<%@ page import="com.liferay.portal.kernel.dao.search.DisplayTerms" %>
<%@ page import="com.liferay.portal.kernel.log.Log" %>
<%@ page import="com.liferay.portal.kernel.log.LogFactoryUtil" %>
<%@ page import="javax.portlet.ActionRequest" %>
<%@ page import="javax.portlet.PortletURL" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="portlet" uri="http://java.sun.com/portlet_2_0" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="liferay-ui" uri="http://liferay.com/tld/ui" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" %>

<portlet:defineObjects/>


<jsp:useBean id="area" scope="request" type="by.md54.testcase.entity.Area"/>
<jsp:useBean id="specialisation" scope="request" type="by.md54.testcase.entity.Specialisation"/>
<jsp:useBean id="vacancies" scope="request" type="java.util.List"/>
<jsp:useBean id="totalCount" scope="request" type="java.lang.Integer"/>
<jsp:useBean id="sortField" scope="request" type="java.lang.String"/>
<jsp:useBean id="sortDir" scope="request" type="java.lang.String"/>


<%
    PortletURL iteratorURL = renderResponse.createRenderURL();
    iteratorURL.setParameter("jspPage", "view.jsp");
    iteratorURL.setParameter("act", "changePagination");
    iteratorURL.setParameter("areaId", String.valueOf(area.getId()));
    iteratorURL.setParameter("specId", String.valueOf(specialisation.getId()));
    iteratorURL.setParameter(ActionRequest.ACTION_NAME, "showVacancies");
%>
<%!
    Log logger = LogFactoryUtil.getLog("portlet=test-case");

%>
<% logger.info(request.getContextPath());%>


<liferay-ui:search-container displayTerms="<%= new DisplayTerms(renderRequest) %>" iteratorURL="<%= iteratorURL %>"
                             delta="5" deltaConfigurable="true" orderByCol="<%= sortField%>"
                             orderByType="<%= sortDir%>">
    <liferay-ui:search-form page="/search.jsp" searchContainer="<%= searchContainer %>"
                            servletContext="<%= this.getServletConfig().getServletContext() %>"/>
    <liferay-ui:search-iterator searchContainer="<%= searchContainer %>" paginate="true"/>
    <liferay-ui:search-container-results total="<%= totalCount %>" results="<%= vacancies %>"/>
    <liferay-ui:search-container-row className="by.md54.testcase.entity.Vacancy" modelVar="search" keyProperty="id">
        <liferay-ui:search-container-column-text
                name="Наименование"
                property="name"
                value="<%= search.getName() %>"
                orderableProperty="name"
                orderable="<%= true %>"
        />

        <liferay-ui:search-container-column-text
                name="Работодатель"
                property="employer.name"
                value="<%= search.getEmployer().getName() %>"
                orderableProperty="employer.name"
                orderable="<%= true %>"
        />
        <liferay-ui:search-container-column-text
                name="Опубликовано"
                property="published"
                orderableProperty="published"
                value="<%= search.getPublished().toString()%>"
                orderable="<%= true %>"
        />
        <liferay-ui:search-container-column-text
                name="Зарплата"
                value="${ search.salary == null ? 'Не указана' : search.salary }"
                orderable="<%= true %>"
                orderableProperty="salary"
        />
    </liferay-ui:search-container-row>
    <liferay-ui:search-iterator paginate="true"/>

</liferay-ui:search-container>
