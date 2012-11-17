<h1>twitter/index</h1>
<a href="/logout">logout</a><br />
<br />
<%@page import="org.apache.shiro.subject.Subject"%>
<%@page import="org.apache.shiro.SecurityUtils"%>
<%
	Subject subject = SecurityUtils.getSubject();
%>
typeId : <%=subject.getPrincipal()%><br />
userProfile : <%=subject.getPrincipals().asList().get(1)%><br />
isAuthenticated : <%=subject.isAuthenticated()%><br />
isRemembered : <%=subject.isRemembered()%><br />
