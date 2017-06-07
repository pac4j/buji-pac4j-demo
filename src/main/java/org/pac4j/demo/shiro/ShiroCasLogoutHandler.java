package org.pac4j.demo.shiro;

import io.buji.pac4j.profile.ShiroProfileManager;
import org.pac4j.cas.logout.DefaultCasLogoutHandler;
import org.pac4j.core.context.WebContext;
import org.pac4j.core.context.session.SessionStore;
import org.pac4j.core.store.Store;

public class ShiroCasLogoutHandler<C extends WebContext> extends DefaultCasLogoutHandler<C> {

    public ShiroCasLogoutHandler() {
    }

    public ShiroCasLogoutHandler(final Store<String, Object> store) {
        super(store);
    }

    protected void destroy(final C context, final SessionStore sessionStore, final String channel) {
        // remove profiles
        final ShiroProfileManager manager = new ShiroProfileManager(context);
        manager.logout();
        logger.debug("destroy the user profiles");
        // and optionally the web session
        if (isDestroySession()) {
            logger.debug("destroy the whole session");
            final boolean invalidated = sessionStore.destroySession(context);
            if (!invalidated) {
                logger.error("The session has not been invalidated for {} channel logout", channel);
            }
        }
    }
}
