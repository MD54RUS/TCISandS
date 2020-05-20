<%@ taglib prefix="liferay-ui" uri="http://liferay.com/tld/ui" %>
<%@ taglib prefix="aui" uri="http://alloy.liferay.com/tld/aui" %>
<%@ page import="com.liferay.portal.kernel.dao.search.DisplayTerms" %>
<%@ page import="com.liferay.portal.kernel.dao.search.SearchContainer" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>

<%
    SearchContainer searchContainer2 = (SearchContainer) request.getAttribute("liferay-ui:search:searchContainer");
    DisplayTerms displayTerms2 = searchContainer2.getDisplayTerms();
%>

<liferay-ui:search-toggle
        buttonLabel="Search"
        displayTerms="<%= displayTerms2 %>"
        id="toggle_id_search">
    <aui:input label="First Name" name="firstName" value="100"/>
    <aui:input label="Last Name" name="lastName" value="254"/>
    <aui:input label="studentAge" name="studentAge" value="85"/>
    <aui:select name="studentGender">
        <aui:option label="Male" value="1">m</aui:option>
        <aui:option label="Female" value="0">f</aui:option>
    </aui:select>
    <aui:input label="studentAddress" name="studentAddress" value="address"/>
</liferay-ui:search-toggle>
