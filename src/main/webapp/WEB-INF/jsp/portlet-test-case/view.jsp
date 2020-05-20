<%@ page import="com.liferay.portal.security.permission.PermissionChecker" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="portlet" uri="http://java.sun.com/portlet_2_0" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="aui" uri="http://alloy.liferay.com/tld/aui" %>

This is the <b>test case for ISandS</b> portlet.<br />
<br>
<br>
<portlet:defineObjects/>


<jsp:useBean id="area" scope="request" type="by.md54.testcase.entity.Area"/>
<jsp:useBean id="specialisation" scope="request" type="by.md54.testcase.entity.Specialisation"/>


<portlet:renderURL var="showFilteringFormURL">
    <portlet:param name="act" value="changeFilter"/>
    <portlet:param name="specId" value="<%=String.valueOf(specialisation.getId())%>"/>
    <portlet:param name="areaId" value="<%=String.valueOf(area.getId())%>"/>
</portlet:renderURL>


<portlet:renderURL var="loadVacancy">
    <portlet:param name="action" value="loadFilter"/>
</portlet:renderURL>
<h2 align="center" class="text-primary">Данные загружены с сайта hh.ru</h2>
<hr/>


<div class="filter_label">
    <label class="blockLine">${area.name}</label>
    <label class="blockLine">${specialisation.name}</label>

    <aui:button class="blockLine" onClick="<%=showFilteringFormURL%>" value="Change filter"/>
</div>

<%!
    private PermissionChecker permisionChecker;
%>


<body>


<jsp:include page="vacancyPage.jsp"/>


</body>


