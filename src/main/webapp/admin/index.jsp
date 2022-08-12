<%@page session="false" %>
<%@page import="org.apache.shiro.SecurityUtils"%>
<%@ page import="java.util.List" %>
<%@ page import="io.buji.pac4j.subject.Pac4jPrincipal" %>
<%@ page import="org.pac4j.core.profile.UserProfile" %>
<%@ page import="org.apache.shiro.subject.Subject" %>
<%@ page import="org.apache.shiro.subject.PrincipalCollection" %>
<%
	final Subject subject = SecurityUtils.getSubject();
	final PrincipalCollection principals = subject.getPrincipals();
	final Pac4jPrincipal principal = principals.oneByType(Pac4jPrincipal.class);
	List<UserProfile> profiles = null;
	if (principal != null) {
		profiles = principal.getProfiles();
	}
%>
<h1>protected area</h1>
<a href="..">Back</a>
<br /><br />
<b>Shiro principals</b>: <%=principals%>
<br /><br />
<b>pac4j profiles</b>: <%=profiles%>
<br/><br/>
subject.hasRole("ROLE_ADMIN"): <%=subject.hasRole("ROLE_ADMIN")%><br/>
subject.hasRole("ROLE_USER"): <%=subject.hasRole("ROLE_USER")%>
