<%@page import="org.apache.shiro.subject.Subject"%>
<%@page import="org.apache.shiro.SecurityUtils"%>
<%
	Subject subject = SecurityUtils.getSubject();
%>
<h1>protected area</h1>
<a href="..">Back</a><br />
<br /><br />
profile : <%=subject.getPrincipals()%><br />
