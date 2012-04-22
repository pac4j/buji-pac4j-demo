<h1>facebook/index</h1>
<a href="/logout">logout</a><br />
<br />
<%@page import="org.apache.shiro.subject.Subject"%>
<%@page import="org.apache.shiro.SecurityUtils"%>
<%
	Subject subject = SecurityUtils.getSubject();
%>
principal : <%=subject.getPrincipal()%><br />
principals : <%=subject.getPrincipals()%><br />
isAuthenticated : <%=subject.isAuthenticated()%><br />
isRemembered : <%=subject.isRemembered()%><br />
