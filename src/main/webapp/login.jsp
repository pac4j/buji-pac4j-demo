<%@page session="false" %>
<%
    response.setHeader("Cache-Control","must-revalidate,no-cache,no-store");
    response.setHeader("Pragma","no-cache");
    response.setDateHeader ("Expires", 0);
%>
<html>
<body>
<form method="POST">
    <table>
        <tr>
            <td>User:</td>
            <td><input type="text" name="username"/></td>
        </tr>
        <tr>
            <td>Password:</td>
            <td><input type="password" name="password"/></td>
        </tr>
        <!--tr>
            <td>Remember Me?</td>
            <td><input type="checkbox" name="rememberMe" value="true"/></td>
        </tr-->
        <tr>
            <td><input name="submit" type="submit" value="submit" /></td>
        </tr>
    </table>
</form>
</body>
</html>
