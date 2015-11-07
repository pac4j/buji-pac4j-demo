<p align="center">
  <img src="https://pac4j.github.io/pac4j/img/logo-shiro.png" width="300" />
</p>

This `buji-pac4j-demo` project is a Java web application to test the [buji-pac4j](https://github.com/bujiio/buji-pac4j) security extension with various authentication mechanisms: Facebook, Twitter, form, basic auth, CAS, SAML...

## Start & test

Build the project and launch the web app with jetty on [http://localhost:8080](http://localhost:8080):

    cd buji-pac4j-demo
    mvn clean compile jetty:run

To test, you can call a protected url by clicking on the "Protected url by **xxx**" link, which will start the authentication process with the **xxx** provider.  
Or you can click on the "Authenticate with **xxx**" link to manually start the authentication process with the **xxx** provider.

To test the CAS support, you need to start a CAS server on port 8888. Use the following demo: [cas-overlay-demo](https://github.com/leleuj/cas-overlay-demo) with the option: `-Djetty.port=8888`.

If you want to use `Guice`, please see the [buji-guice-demo](https://github.com/vonZeppelin/buji-guice-demo).
