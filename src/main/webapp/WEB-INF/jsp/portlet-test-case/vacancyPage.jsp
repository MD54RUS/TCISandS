<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="portlet" uri="http://java.sun.com/portlet_2_0" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%! private final int perPage = 20;
    private final int pageCount = 0;
    int[] rowCountCollection = {5, 10, 15, 20, 25, 50, 100};
//RenderRequest request
//    PortletSession session = renderRequest.getPortletSession();

    private void reload() {

    }

%>

<portlet:defineObjects/>

<a href="
<portlet:renderURL var="getVacancyURL">
    <portlet:param name="action" value="getVacancy"/>
    <portlet:param name="perPage" value = "<%=String.valueOf(perPage)%>"/>
    <portlet:param name="page" value="<%=String.valueOf(pageCount)%>" />
</portlet:renderURL>
"><b>Render</b></a>
<portlet:renderURL var="getVacancyURL">
    <portlet:param name="action" value="getVacancy"/>
    <portlet:param name="perPage" value="<%=String.valueOf(perPage)%>"/>
    <portlet:param name="page" value="<%=String.valueOf(pageCount)%>"/>
</portlet:renderURL>
<%%>

<div class="container">
    <h2 align="center" class="text-primary">Данные загружены с сайта hh.ru</h2>
    <hr/>
    <div></div>
    <p>Выводить по <select style="width: 60px" class="selectpicker" name="countRow" id="countRowSelect"
                           onchange="function x() {
                                   this.options.selected=true;
                           <%--        <%perPage = jspContext.>--%>

                           <%--session.setAttribute("attribute-name","attribute-value", PortletSession.PORTLET_SCOPE);--%>
                                   // this.options.selectedIndex = this.options[this.selectedIndex];
                                   // this.perPage = this.options[this.selectedIndex];
                                   }

                                   ">
        <% for (int counts : rowCountCollection) { %>
        <%--        <c:forEach items="<%=rowCountCollection%>" var="counts">--%>
        <%--            <%= (eqArray.get(count).equals("eqName"))?"selected":"" %>--%>
        <option value="<a href="
        <portlet:renderURL var="getVacancyURL">
            <portlet:param name="action" value="getVacancy"/>
            <portlet:param name="perPage" value="<%=String.valueOf(perPage)%>"/>
            <portlet:param name="page" value="<%=String.valueOf(pageCount)%>"/>
        </portlet:renderURL>
        "</a>"<%= counts == perPage ? "selected" : ""%><%=counts%>
        </option>
        <%--        <option value="<%=counts%>" <%= counts == perPage? "selected": ""%>><%=counts%></option>--%>
        <%} %>
        <%--        </c:forEach>--%>
    </select> строк на страницу.
    </p>
    <table class="table" align="center">
        <thead>
        <tr>
            <th>Description</th>
            <th>Employer</th>
            <th>Published</th>
            <th>Salary</th>
        </tr>
        </thead>
        <tbody>


        <jsp:useBean id="vacancies" scope="request" type="java.lang.Iterable"/>
        <c:if test="${not empty vacancies}">
        <c:forEach var="vacancy" items="${vacancies}">
            <tr>
                <td>${vacancy.name}</td>
                <td>${vacancy.employer.name}</td>
                <td>${vacancy.published_at}</td>
                <td>${vacancy.salary}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <!-- Pagination links in spring mvc. -->
        <%--    <ul class="pagination pagination-sm">--%>
        <%--        <li class="page-item"><a class="page-link" href="/SpringMvcPagination/init/1">1</a></li>--%>
        <%--        <li class="page-item"><a class="page-link" href="/SpringMvcPagination/init/2">2</a></li>--%>
        <%--        <li class="page-item"><a class="page-link" href="/SpringMvcPagination/init/3">3</a></li>--%>
        <%--    </ul>--%>
    </c:if>
</div>