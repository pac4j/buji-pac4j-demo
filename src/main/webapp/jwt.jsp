<%@page import="org.apache.shiro.subject.Subject"%>
<%@page import="org.apache.shiro.SecurityUtils"%>
<%@ page import="org.apache.shiro.subject.PrincipalCollection" %>
<%@ page import="org.pac4j.jwt.profile.JwtGenerator" %>
<%@ page import="io.buji.pac4j.subject.Pac4jPrincipal" %>
<%
    Subject subject = SecurityUtils.getSubject();
%>
<h1>Generate JWT token</h1>
<a href="..">Back</a><br />
<br /><br />
<%
    final JwtGenerator generator = new JwtGenerator("12345678901234567890123456789012");
    String token = null;
    final PrincipalCollection col = subject.getPrincipals();
    if (col != null) {
        final Pac4jPrincipal principal = col.oneByType(Pac4jPrincipal.class);
        if (principal != null) {
            token = generator.generate(principal.getProfile());
        }
    }
%>
token: <%=token%><br />
