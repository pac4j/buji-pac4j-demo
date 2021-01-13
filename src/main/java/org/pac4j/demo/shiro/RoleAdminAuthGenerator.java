package org.pac4j.demo.shiro;

import org.pac4j.core.authorization.generator.AuthorizationGenerator;
import org.pac4j.core.context.WebContext;
import org.pac4j.core.context.session.SessionStore;
import org.pac4j.core.profile.CommonProfile;
import org.pac4j.core.profile.UserProfile;

import java.util.Optional;

public class RoleAdminAuthGenerator implements AuthorizationGenerator {

    @Override
    public Optional<UserProfile> generate(final WebContext context, final SessionStore sessionStore, final UserProfile profile) {
        profile.addRole("ROLE_ADMIN");
        ((CommonProfile) profile).removeLoginData(); // remove the access token to reduce size and make the remember-me work
        profile.setRemembered(true);
        return Optional.of(profile);
    }
}
