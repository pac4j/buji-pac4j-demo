package org.leleuj.provider;

import org.scribe.up.provider.impl.Google2Provider;

public class MyGoogleProvider extends Google2Provider {
    
    public MyGoogleProvider() {
        setScope(Google2Scope.EMAIL_AND_PROFILE);
    }
}
