<%@ page import="com.liferay.portal.security.permission.PermissionChecker" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="portlet" uri="http://java.sun.com/portlet_2_0" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

This is the <b>test case for SandS</b> portlet.<br />

<%--<jsp:useBean id="releaseInfo" scope="request" type="java.lang.String"/>--%>
<%--Release info: <c:out escapeXml="true" value="${releaseInfo}" />;<br />--%>
<%--<jsp:useBean id="userName" scope="request" type="java.lang.String"/>--%>
<%--Username: <c:out escapeXml="true" value="${userName}" />.--%>

<%!
    private PermissionChecker permisionChecker;
%><portlet:renderURL var="showAddRecordUrl">
    <%--    <portlet:param name="act" value="addRecordForm" />--%>
</portlet:renderURL>
<portlet:renderURL var="showUrl">
</portlet:renderURL>

<a href="<portlet:renderURL var="showAddRecordUrl">
						</portlet:renderURL>"><b>Update</b></a>


<body>
<portlet:defineObjects/>
<%--<c:if test="<%= permisionChecker.isOmniadmin()%>">--%>
<%--<jsp:include page="config.jsp"/>--%>
<%--</c:if>--%>

<jsp:include page="vacancyPage.jsp"/>


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
<%--&lt;%&ndash;                    <td align="center" valign="top" width="100px"><a href="&ndash;%&gt;--%>
<%--&lt;%&ndash;						<portlet:renderURL>&ndash;%&gt;--%>
<%--&lt;%&ndash;							<portlet:param name="act" value="editRecordForm" />&ndash;%&gt;--%>
<%--&lt;%&ndash;							<portlet:param name="recordId" value="${record.recordId}" />&ndash;%&gt;--%>
<%--&lt;%&ndash;						</portlet:renderURL>&ndash;%&gt;--%>
<%--&lt;%&ndash;					"><b>Edit</b></a>&ndash;%&gt;--%>
<%--&lt;%&ndash;                        /&ndash;%&gt;--%>
<%--&lt;%&ndash;                        <a href="&ndash;%&gt;--%>
<%--&lt;%&ndash;						<portlet:actionURL>&ndash;%&gt;--%>
<%--&lt;%&ndash;							<portlet:param name="act" value="removeRecord" />&ndash;%&gt;--%>
<%--&lt;%&ndash;							<portlet:param name="id" value="${record.recordId}" />&ndash;%&gt;--%>
<%--&lt;%&ndash;						</portlet:actionURL>" onclick="return confirmRemove()">&ndash;%&gt;--%>
<%--&lt;%&ndash;                            <b>Remove</b></a></td>&ndash;%&gt;--%>
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