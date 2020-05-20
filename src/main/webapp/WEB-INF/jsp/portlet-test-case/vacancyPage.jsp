<%@ page import="com.liferay.portal.kernel.dao.search.DisplayTerms" %>
<%@ page import="com.liferay.portal.kernel.log.Log" %>
<%@ page import="com.liferay.portal.kernel.log.LogFactoryUtil" %>
<%@ page import="javax.portlet.ActionRequest" %>
<%@ page import="javax.portlet.PortletURL" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="portlet" uri="http://java.sun.com/portlet_2_0" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="liferay-ui" uri="http://liferay.com/tld/ui" %>
<%@ page contentType="text/html" pageEncoding="UTF-8" language="java" %>
<%! int[] rowCountCollection = {5, 10, 15, 20, 25, 50, 100};
//RenderRequest request
//    PortletSession session = renderRequest.getPortletSession();

    private void reload() {

    }

%>

<portlet:defineObjects/>


<jsp:useBean id="area" scope="request" type="by.md54.testcase.entity.Area"/>
<jsp:useBean id="specialisation" scope="request" type="by.md54.testcase.entity.Specialisation"/>
<%--<jsp:useBean id="totalRows" scope="request" type="java.lang.Integer"/>--%>
<%--<jsp:useBean id="pageNumber" scope="request" type="java.lang.Integer"/>--%>
<%--<jsp:useBean id="perPage" scope="request" type="java.lang.Integer"/>--%>
<jsp:useBean id="vacancies" scope="request" type="java.util.List"/>
<jsp:useBean id="totalCount" scope="request" type="java.lang.Integer"/>


<%--<% int totalPageCount = totalRows/perPage; %>--%>


<%--<input name="perPageInput"/>--%>


<%--<a href="--%>
<%--<portlet:renderURL var="updateURL">--%>
<%--    <portlet:param name="act" value="changePagination"/>--%>
<%--    <portlet:param name="areaId" value="<%=String.valueOf(area.getId())%>" />--%>
<%--    <portlet:param name="specId" value="<%=String.valueOf(specialisation.getId())%>" />--%>
<%--    <portlet:param name="perPage" value = "<%=String.valueOf(perPage)%>"/>--%>
<%--    <portlet:param name="page" value="<%=String.valueOf(pageNumber)%>" />--%>
<%--</portlet:renderURL>--%>
<%--"><b>Render</b></a>--%>


<%--<a href="--%>
<%--<portlet:renderURL>--%>
<%--    <portlet:param name="act" value="changePagination"/>--%>
<%--    <portlet:param name="perPage" value = "5"/>--%>
<%--    <portlet:param name="page" value="0" />--%>
<%--    <portlet:param name="areaId" value="<%=String.valueOf(area.getId())%>" />--%>
<%--    <portlet:param name="specId" value="<%=String.valueOf(specialisation.getId())%>" />--%>
<%--</portlet:renderURL>--%>
<%--"><b>Render 5</b></a>--%>

<%--&lt;%&ndash;<portlet:renderURL var="getVacancyURL">&ndash;%&gt;--%>
<%--&lt;%&ndash;    <portlet:param name="action" value="getVacancy"/>&ndash;%&gt;--%>
<%--&lt;%&ndash;    <portlet:param name="perPage" value="<%=String.valueOf(perPage)%>"/>&ndash;%&gt;--%>
<%--&lt;%&ndash;    <portlet:param name="pageNumber" value="<%=String.valueOf(pageCount)%>"/>&ndash;%&gt;--%>
<%--&lt;%&ndash;</portlet:renderURL>&ndash;%&gt;--%>
<%--&lt;%&ndash;<%%>&ndash;%&gt;--%>

<%--<div class="container">--%>

<%--    <div id = "pagination">--%>
<%--        &lt;%&ndash;For displaying Previous link except for the 1st page &ndash;%&gt;--%>
<%--        <c:if test="${pageNumber != 0}">--%>
<%--            <td><a href="#${pageNumber - 1}">Previous</a></td>--%>
<%--        </c:if>--%>

<%--        &lt;%&ndash;For displaying Page numbers.--%>
<%--        The when condition does not display a link for the current page&ndash;%&gt;--%>
<%--        <table border="1" cellpadding="5" cellspacing="5">--%>
<%--            <tr>--%>
<%--                <c:forEach begin="0" end="<%=totalPageCount%>" var="i">--%>
<%--                    <c:choose>--%>
<%--                        <c:when test="${pageNumber eq i}">--%>
<%--                            <td>${i+1}</td>--%>
<%--                        </c:when>--%>
<%--                        <c:otherwise>--%>
<%--                            <td><a href="#${i}">${i}</a></td>--%>
<%--                        </c:otherwise>--%>
<%--                    </c:choose>--%>
<%--                </c:forEach>--%>
<%--            </tr>--%>
<%--        </table>--%>

<%--        &lt;%&ndash;For displaying Next link &ndash;%&gt;--%>
<%--        <c:if test="<%=pageNumber != totalPageCount%>">--%>
<%--            <td><a href="#${pageNumber + 1}">Next</a></td>--%>
<%--        </c:if>--%>
<%--    </div>--%>
<%--    <p>Выводить по <select style="width: 60px" class="selectpicker" name="countRow" id="countRowSelect"--%>
<%--                           onchange="function x() {--%>
<%--                                   this.options.selected=true;--%>
<%--                           &lt;%&ndash;        <%perPage = jspContext.>&ndash;%&gt;--%>

<%--                           &lt;%&ndash;session.setAttribute("attribute-name","attribute-value", PortletSession.PORTLET_SCOPE);&ndash;%&gt;--%>
<%--                                   // this.options.selectedIndex = this.options[this.selectedIndex];--%>
<%--                                   // this.perPage = this.options[this.selectedIndex];--%>
<%--                                   }--%>

<%--                                   ">--%>
<%--        <% for (int counts : rowCountCollection) { %>--%>
<%--        &lt;%&ndash;        <c:forEach items="<%=rowCountCollection%>" var="counts">&ndash;%&gt;--%>
<%--        &lt;%&ndash;            <%= (eqArray.get(count).equals("eqName"))?"selected":"" %>&ndash;%&gt;--%>
<%--&lt;%&ndash;        <option value="<a href="&ndash;%&gt;--%>
<%--&lt;%&ndash;        <portlet:renderURL var="getVacancyURL">&ndash;%&gt;--%>
<%--&lt;%&ndash;            <portlet:param name="action" value="getVacancy"/>&ndash;%&gt;--%>
<%--&lt;%&ndash;            <portlet:param name="perPage" value="<%=String.valueOf(perPage)%>"/>&ndash;%&gt;--%>
<%--&lt;%&ndash;            <portlet:param name="pageNumber" value="<%=String.valueOf(pageCount)%>"/>&ndash;%&gt;--%>
<%--&lt;%&ndash;        </portlet:renderURL>&ndash;%&gt;--%>
<%--&lt;%&ndash;        "</a>"<%= counts == perPage ? "selected" : ""%><%=counts%>&ndash;%&gt;--%>
<%--&lt;%&ndash;        </option>&ndash;%&gt;--%>
<%--                <option value="<%=counts%>" <%= counts == perPage? "selected": ""%>><%=counts%></option>--%>
<%--        <%} %>--%>
<%--        &lt;%&ndash;        </c:forEach>&ndash;%&gt;--%>
<%--    </select> строк на страницу.--%>
<%--    </p>--%>
<%--    <table class="table" align="center">--%>
<%--        <thead>--%>
<%--        <tr>--%>
<%--            <th>Description</th>--%>
<%--            <th>Employer</th>--%>
<%--            <th>Published</th>--%>
<%--            <th>Salary</th>--%>
<%--        </tr>--%>
<%--        </thead>--%>
<%--        <tbody>--%>


<%--        <c:if test="${not empty vacancies}">--%>
<%--        <c:forEach var="vacancy" items="${vacancies}">--%>
<%--            <tr>--%>
<%--                <td>${vacancy.name}</td>--%>
<%--                <td>${vacancy.employer.name}</td>--%>
<%--                <td>${vacancy.published_at}</td>--%>
<%--                <td>${vacancy.salary}</td>--%>
<%--            </tr>--%>
<%--        </c:forEach>--%>
<%--        </tbody>--%>
<%--    </table>--%>

<%--    <!-- Pagination links in spring mvc. -->--%>
<%--        &lt;%&ndash;    <ul class="pagination pagination-sm">&ndash;%&gt;--%>
<%--        &lt;%&ndash;        <li class="pageNumber-item"><a class="pageNumber-link" href="/SpringMvcPagination/init/1">1</a></li>&ndash;%&gt;--%>
<%--        &lt;%&ndash;        <li class="pageNumber-item"><a class="pageNumber-link" href="/SpringMvcPagination/init/2">2</a></li>&ndash;%&gt;--%>
<%--        &lt;%&ndash;        <li class="pageNumber-item"><a class="pageNumber-link" href="/SpringMvcPagination/init/3">3</a></li>&ndash;%&gt;--%>
<%--        &lt;%&ndash;    </ul>&ndash;%&gt;--%>
<%--    </c:if>--%>

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
                             delta="5" deltaConfigurable="true">
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
                property="published_at"
                orderableProperty="published_at"
                value="<%= search.getPublished_at().toString()%>"
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
</div>
