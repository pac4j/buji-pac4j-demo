<%@page import="org.apache.shiro.SecurityUtils"%>
<%@ page import="org.pac4j.core.profile.CommonProfile" %>
<%@ page import="java.util.List" %>
<%@ page import="io.buji.pac4j.subject.Pac4jPrincipal" %>
<%@ page import="org.apache.shiro.subject.Subject" %>
<%
	final Subject subject = SecurityUtils.getSubject();
	final Pac4jPrincipal principal = subject.getPrincipals().oneByType(Pac4jPrincipal.class);
	List<CommonProfile> profiles = null;
	if (principal != null) {
		profiles = principal.getProfiles();
	}
%>
<h1>protected area</h1>
<a href="..">Back</a><br />
<br /><br />
profiles: <%=profiles%><br/>
subject.hasRole("ROLE_ADMIN"): <%=subject.hasRole("ROLE_ADMIN")%><br />
subject.hasRole("ROLE_USER"): <%=subject.hasRole("ROLE_USER")%><br />
