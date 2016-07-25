<%@page import="org.apache.shiro.SecurityUtils"%>
<%@ page import="org.pac4j.core.profile.CommonProfile" %>
<%@ page import="java.util.List" %>
<%@ page import="io.buji.pac4j.subject.Pac4jPrincipal" %>
<%@ page import="org.apache.shiro.subject.PrincipalCollection" %>
<%
    List<CommonProfile> profiles = null;
    final PrincipalCollection principals = SecurityUtils.getSubject().getPrincipals();
    if (principals != null) {
        final Pac4jPrincipal principal = principals.oneByType(Pac4jPrincipal.class);
        if (principal != null) {
            profiles = principal.getProfiles();
        }
    }
%>
<h1>index</h1>
<a href="facebook/index.jsp">Protected url by Facebook: facebook/index.jsp</a> (use a real account)<br />
<a href="facebook/notprotected.jsp">Not protected page: facebook/notprotected.jsp</a> (no authentication required)<br />
<a href="facebookadmin/index.jsp">Protected url by Facebook with ROLE_ADMIN: facebookadmin/index.jsp</a> (use a real account)<br />
<a href="facebookcustom/index.jsp">Protected url by Facebook with custom authorizer (= must be a <em>CommonProfile</em> where the username starts with "jle"): facebookcustom/index.jsp</a> (login with form or basic authentication before with jle* username)<br />
<a href="twitter/index.jsp">Protected url by Twitter: twitter/index.jsp</a> or <a href="twitter/index.jsp?client_name=FacebookClient">by Facebook: twitter/index.jsp?client_name=FacebookClient</a> (use a real account)<br />
<a href="form/index.jsp">Protected url by form authentication: form/index.jsp</a> (use login = pwd)<br />
<a href="basicauth/index.jsp">Protected url by indirect basic auth: basicauth/index.jsp</a> (use login = pwd)<br />
<a href="cas/index.jsp">Protected url by CAS: cas/index.jsp</a> (use login = pwd)<br />
<a href="saml2/index.jsp">Protected url by SAML2: saml2/index.jsp</a> (use testpac4j at gmail.com / Pac4jtest)<br />
<a href="oidc/index.jsp">Protected url by Google OpenID Connect: oidc/index.jsp</a> (use a real account)<br />
<a href="vk/index.jsp">Protected url by Vk: vk/index.jsp</a> (use a real account)<br />
<a href="protected/index.jsp">Protected url: protected/index.jsp</a> (won't start any login process)<br />
<br />
<a href="jwt.jsp">Generate a JWT token</a> (after being authenticated)<br />
<a href="/dba/index.jsp">Protected url by DirectBasicAuthClient: /dba/index.jsp</a> (POST the <em>Authorization</em> header with value: <em>Basic amxlbGV1OmpsZWxldQ==</em>) then by <a href="/dba/index.jsp">ParameterClient: /dba/index.jsp</a> (with request parameter: token=<em>jwt_generated_token</em>)<br />
<a href="/rest-jwt/index.jsp">Protected url by ParameterClient: /rest-jwt/index.jsp</a> (with request parameter: token=<em>jwt_generated_token</em>)<br />
<br />
<a href="forceLogin?client_name=FacebookClient">Force Facebook login</a> (even if already authenticated)<br />
<br />
<a href="/logout?url=/?forcepostlogouturl">logout</a>
<br /><br />
profiles: <%=profiles%>
