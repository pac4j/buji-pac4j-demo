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
<h1>Not protected page</h1>
<a href="..">Back</a><br />
<br /><br />
profiles: <%=profiles%>
