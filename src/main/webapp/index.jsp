<%@page session="false" %>
<%@page import="org.apache.shiro.SecurityUtils"%>
<%@ page import="java.util.List" %>
<%@ page import="io.buji.pac4j.subject.Pac4jPrincipal" %>
<%@ page import="org.apache.shiro.subject.PrincipalCollection" %>
<%@ page import="org.pac4j.core.profile.UserProfile" %>
<%@ page import="org.apache.shiro.subject.Subject" %>
<%
    response.setHeader("Cache-Control","must-revalidate,no-cache,no-store");
    response.setHeader("Pragma","no-cache");
    response.setDateHeader ("Expires", 0);
%>
<%
    List<UserProfile> profiles = null;
    final Subject subject = SecurityUtils.getSubject();
    final PrincipalCollection principals = subject.getPrincipals();
    if (principals != null) {
        final Pac4jPrincipal principal = principals.oneByType(Pac4jPrincipal.class);
        if (principal != null) {
            profiles = principal.getProfiles();
        }
    }
    String sessionId = "nosession";
    if (request.getSession(false) != null) {
        sessionId = request.getSession(false).getId();
    }
%>
<h1>index</h1>
<h2>Shiro:</h2>
<a href="/login/index.jsp">Protected URL by login form: login/index.jsp</a> (use user/user or admin/admin)<br />
<a href="/admin/index.jsp">Protected URL by login form and ROLE_ADMIN: admin/index.jsp</a><br />
<br />
<a href="/logout">Shiro logout</a><br />

<h2>pac4j:</h2>
<a href="/cas/index.jsp" id="casLink">Protected URL by CAS: cas/index.jsp</a> (use login = pwd)<br />
<a href="/saml2/index.jsp">Protected URL by SAML2: saml2/index.jsp</a> (use testpac4j at gmail.com / Pac4jtest)<br />
<a href="/oidc/index.jsp">Protected URL by Google OpenID Connect: oidc/index.jsp</a> (use a real account) => ROLE_ADMIN<br />
<a href="/protected/index.jsp">Protected URL: protected/index.jsp</a> (won't start any login process)<br />
<br />
<a href="/dba/index.jsp">Protected URL by DirectBasicAuthClient: /dba/index.jsp</a> (POST the <em>Authorization</em> header with value: <em>Basic amxlbGV1OmpsZWxldQ==</em>)<br />
<br />
<a href="/pac4jLogout?url=/?forcepostlogouturl">pac4j (local) logout</a><br />

<h2>Context:</h2>
<b>Shiro principals</b>: <%=principals%>
<br /><br />
<b>pac4j profiles</b>: <%=profiles%>
<br/><br/>
<b>sessionId:</b> <%=sessionId%>
<br/><br/>
subject.hasRole("ROLE_ADMIN"): <%=subject.hasRole("ROLE_ADMIN")%><br/>
subject.hasRole("ROLE_USER"): <%=subject.hasRole("ROLE_USER")%><br/>
subject.isAuthenticated(): <%=subject.isAuthenticated()%>