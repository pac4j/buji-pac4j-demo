package org.pac4j.demo.shiro;

import javax.servlet.jsp.PageContext;

import org.apache.shiro.web.env.EnvironmentLoader;
import org.apache.shiro.web.env.IniWebEnvironment;

public final class WebUtils {

    public static <T extends Object> T getObject(final PageContext pageContext, final Class<T> clazz, final String name) {
        final IniWebEnvironment env = (IniWebEnvironment) pageContext.getServletContext()
                .getAttribute(EnvironmentLoader.ENVIRONMENT_ATTRIBUTE_KEY);
        if (env != null) {
            return env.getObject(name, clazz);
        }
        return null;
    }
}
