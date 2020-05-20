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

<%--todo page perPage??--%>

<portlet:renderURL var="showFilteringFormURL">
    <portlet:param name="act" value="changeFilter"/>
    <portlet:param name="specId" value="<%=String.valueOf(specialisation.getId())%>"/>
    <portlet:param name="areaId" value="<%=String.valueOf(area.getId())%>"/>
</portlet:renderURL>



<%--<a href="<%=showFilteringFormURL%>">Change filter</a>--%>


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
<%--<button value="Change request" formaction="${showFilteringFormURL}" type="submit" onsubmit="" onclick="location.href = <%=showFilteringFormURL%>">Change request</button>--%>

<%--<form:form name="catalogForm" method="post" action="${loadVacancy}">--%>
<%--<form:form name="catalogForm" action="${loadVacancy}" >--%>
<%--    <jsp:useBean id="areas" scope="request" type="java.lang.Iterable"/>--%>
<%--    <jsp:useBean id="specialisations" scope="request" type="java.lang.Iterable"/>--%>
<%--    --%>
<%--    <c:if test="${not empty areas}">--%>
<%--&lt;%&ndash;        <form:hidden path="recordId" />&ndash;%&gt;--%>
<%--        <label path="name">Name:</label>--%>

<%--        <select class="selectpicker" name="countRow" id="countRowSelect"--%>
<%--                onchange="function x() {--%>
<%--                this.options.selected=true;}--%>
<%--                ">--%>
<%--            <jsp:useBean id="areaId" scope="request" type="java.lang.Long"/>--%>
<%--            <c:forEach var="area" items="${areas}">--%>
<%--                <option value="${area.name}" ${area.id == areaId? "selected": ""}>${area.name}</option>--%>
<%--            </c:forEach>--%>
<%--&lt;%&ndash;            <% for (Object area : areas) { %>&ndash;%&gt;--%>
<%--&lt;%&ndash;            <option value="<%=area%>" <%= area.toString() == area? "selected": ""%>><%=area%></option>&ndash;%&gt;--%>
<%--&lt;%&ndash;            <%} %>&ndash;%&gt;--%>

<%--        </select>--%>
<%--    </c:if>--%>

<%--    <br>--%>
<%--</form:form>--%>


<%--<jsp:useBean id="releaseInfo" scope="request" type="java.lang.String"/>--%>
<%--Release info: <c:out escapeXml="true" value="${releaseInfo}" />;<br />--%>
<%--<jsp:useBean id="userName" scope="request" type="java.lang.String"/>--%>
<%--Username: <c:out escapeXml="true" value="${userName}" />.--%>

<%!
    private PermissionChecker permisionChecker;
%>

<%--<portlet:renderURL var="showAddRecordUrl">--%>
<%--    &lt;%&ndash;    <portlet:param name="act" value="addRecordForm" />&ndash;%&gt;--%>
<%--</portlet:renderURL>--%>
<%--<portlet:renderURL var="showUrl">--%>
<%--</portlet:renderURL>--%>

<%--            <a href="--%>
<%--						<portlet:actionURL>--%>
<%--							<portlet:param name="act" value="addRecord" />--%>
<%--						</portlet:actionURL>">--%>
<%--                <b>Update</b></a>--%>


<body>


<%--<c:if test="<%= permisionChecker.isOmniadmin()%>">--%>
<%--<jsp:include page="changeFilter.jsp"/>--%>
<%--</c:if>--%>

<jsp:include page="vacancyPage.jsp"/>

<%--<portlet:resourceURL var="testURL">--%>
<%--    <portlet:param name="pageAddress" value="view?page=2,perPage=5" />--%>
<%--</portlet:resourceURL>--%>


<%--<portlet:renderURL>--%>
<%--    <portlet:param name="act" value="testURL"/>--%>
<%--</portlet:renderURL>--%>

</body>


<%--<form:form name="catalogForm" method="post" action="${showAddRecordUrl}">--%>
<%--    <jsp:useBean id="vacancy" scope="request" type="java.lang.Iterable"/>--%>
<%--    <c:if test="${not empty vacancy}">--%>
<%--        <table border="1">--%>
<%--            <tr bgcolor="#99CCFF">--%>
<%--                <td valign="top"><b>Name</b></td>--%>
<%--            </tr>--%>
<%--            <c:forEach var="vacancy" items="${vacancy}">--%>
<%--                <tr>--%>
<%--                    <td valign="top"><c:out value="${vacancy.name}" /></td>--%>
<%--                    <td align="center" valign="top" width="100px"><a href="--%>
<%--						<portlet:renderURL>--%>
<%--							<portlet:param name="act" value="editRecordForm" />--%>
<%--							<portlet:param name="recordId" value="${record.recordId}" />--%>
<%--						</portlet:renderURL>--%>
<%--					"><b>Edit</b></a>--%>
<%--&lt;%&ndash;                        /&ndash;%&gt;--%>
<%--                        <a href="--%>
<%--						<portlet:actionURL>--%>
<%--							<portlet:param name="act" value="removeRecord" />--%>
<%--							<portlet:param name="id" value="${record.recordId}" />--%>
<%--						</portlet:actionURL>" onclick="return confirmRemove()">--%>
<%--                            <b>Remove</b></a></td>--%>
<%--                </tr>--%>
<%--            </c:forEach>--%>
<%--        </table>--%>
<%--    </c:if>--%>
<%--    <br>--%>
<%--    <table align="center">--%>
<%--        <tr>--%>
<%--            <a href="--%>
<%--						<portlet:actionURL>--%>
<%--							<portlet:param name="act" value="addRecord" />--%>
<%--						</portlet:actionURL>">--%>
<%--                <b>Load</b></a>--%>
<%--            <td align="center" valign="top" width="100px">--%>
<%--            <td><input type="submit" value="Add Record" /></td>--%>
<%--        </tr>--%>
<%--        <tr>--%>
<%--            <td>&nbsp;</td>--%>
<%--        </tr>--%>
<%--    </table>--%>
<%--</form:form>--%>
