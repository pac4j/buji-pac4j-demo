<%@page import="org.apache.shiro.subject.Subject"%>
<%@page import="org.apache.shiro.SecurityUtils"%>
<%
    Subject subject = SecurityUtils.getSubject();
%>
<h1>Not protected page</h1>
<a href="..">Back</a><br />
<br /><br />
profiles: <%=subject.getPrincipals()%><br />
