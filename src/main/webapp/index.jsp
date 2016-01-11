<%@page import="org.apache.shiro.subject.Subject"%>
<%@page import="org.apache.shiro.SecurityUtils"%>
<%
	Subject subject = SecurityUtils.getSubject();
%>
<h1>index</h1>
<a href="facebook/index.jsp">Protected url by Facebook : facebook/index.jsp</a> (use a real account)<br />
<a href="twitter/index.jsp">Protected url by Twitter : twitter/index.jsp</a> (use a real account)<br />
<a href="form/index.jsp">Protected url by form authentication : form/index.jsp</a> (use login = pwd)<br />
<a href="basicauth/index.jsp">Protected url by basic auth : basicauth/index.jsp</a> (use login = pwd)<br />
<a href="cas/index.jsp">Protected url by CAS : cas/index.jsp</a> (use login = pwd)<br />
<a href="vk/index.jsp">Protected url by Vk : vk/index.jsp</a> (use a real account)<br />
<a href="saml/index.jsp">Protected url by SAML : saml/index.jsp</a> (use testpac4j at gmail.com / Pac4jtest)<br />
<br />
<a href="logout">logout</a>
<br /><br />
profile : <%=subject.getPrincipals()%>
