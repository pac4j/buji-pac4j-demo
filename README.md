## What is this project ?

This **buji-pac4j-demo** project is a Java web application to test the [buji-pac4j library](https://github.com/bujiio/buji-pac4j) with Facebook, Twitter, form authentication, basic auth, CAS...  
The **buji-pac4j** library is built to delegate authentication to a provider and be authenticated back in the protected application with a complete user profile retrieved from the provider.

If you want to use *Guice*, please see the [buji-guice-demo](https://github.com/vonZeppelin/buji-guice-demo).

## Quick start & test 

To start quickly, build the project and launch the web app with jetty :

    cd buji-pac4j-demo
    mvn clean install jetty:run

To test, you can call a protected url by clicking on the "Protected by **xxx** : **xxx**/index.jsp" url, which will start the authentication process with the **xxx** provider.  
Or you can click on the "Authenticate with **xxx*" link, to start manually the authentication process with the **xxx** provider.

If you need to test with CAS, you can easily setup a CAS server by using one of the following CAS demos (use the *-Djetty.port=8888* option to start it on port 8888 as expected by this demo) :
- [cas-overlay-3.5.x](https://github.com/leleuj/cas-overlay-3.5.x) for CAS server version 3.5.x-SNAPSHOT
- [cas-overlay-demo](https://github.com/leleuj/cas-overlay-demo) for CAS server version 4.0.0-SNAPSHOT
