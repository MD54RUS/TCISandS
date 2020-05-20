<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<form:form name="editRequestConf" commandName="cofigRequest" method="post" action="${configRequest}">
    <form:label path="name">Name:</form:label>
    <form:input path="name"/>
    <table align="center">
        <tr>
            <td><input type="submit" value="Update Record"/></td>
        </tr>
    </table>
</form:form>
