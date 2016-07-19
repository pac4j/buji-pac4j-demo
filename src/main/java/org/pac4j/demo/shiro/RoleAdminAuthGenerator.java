package org.pac4j.demo.shiro;

import org.pac4j.core.authorization.generator.AuthorizationGenerator;
import org.pac4j.core.profile.CommonProfile;

public class RoleAdminAuthGenerator implements AuthorizationGenerator<CommonProfile> {

    @Override
    public void generate(CommonProfile profile) {
        profile.addRole("ROLE_ADMIN");
    }
}
