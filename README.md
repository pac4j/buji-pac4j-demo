<p align="center">
  <img src="https://pac4j.github.io/pac4j/img/logo-shiro.png" width="300" />
</p>

This `buji-pac4j-demo` project is a Shiro web application using:
- the Shiro security library
- the [javaee-pac4j](https://github.com/pac4j/jee-pac4j) security library
- the [buji-pac4j](https://github.com/bujiio/buji-pac4j) bridge from pac4j to Shiro.

## Start & test

You can build the project and run it on [http://localhost:8080](http://localhost:8080) using the following commands:

    cd buji-pac4j-demo
    mvn clean package jetty:run

If you want to use `Guice`, please see the [buji-guice-demo](https://github.com/vonZeppelin/buji-guice-demo).
