<%@ page contentType="text/html" pageEncoding="UTF-8" %>


<%@ taglib prefix="portlet" uri="http://java.sun.com/portlet_2_0" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<portlet:defineObjects/>

<jsp:useBean id="area" scope="request" type="by.md54.testcase.entity.Area"/>
<jsp:useBean id="specialisation" scope="request" type="by.md54.testcase.entity.Specialisation"/>

<jsp:useBean id="areaList" scope="request" type="java.lang.Iterable"/>

<jsp:useBean id="specialisationList" scope="request" type="java.lang.Iterable"/>

<jsp:useBean id="root" scope="request" type="by.md54.testcase.entity.Area"/>

<portlet:renderURL var="configRequestURL">
    <portlet:param name="act" value="configRequest"/>
</portlet:renderURL>


<form name="editRequestConf" method="post" action="${configRequestURL}">
    <div class="areaFilter filterBlock">
        <label id="area_label">Регион:</label>
        <select id="area_root" class="filter-select-area" onchange="filterSelectChange('area_root')">
            <c:forEach var="area_items" items="${areaList}">
                <option value="${area_items.name}" data-id="${area_items.id}" data-parentId="${area_items.parentId}"
                    ${area_items.id == root.id ? "selected" : ""}
                    ${area_items.parentId != null ? "hidden" : ""}
                >${area_items.name}
                </option>
            </c:forEach>
        </select>
        <select id="area_parent" class="filter-select-area" onchange="filterSelectChange('area_parent')">
            <c:forEach var="area_items" items="${areaList}">
                <option value="${area_items}" data-id="${area_items.id}" data-parentId="${area_items.parentId}"
                        <jsp:useBean id="parent" scope="request" type="by.md54.testcase.entity.Area"/>
                        <c:if test="${not empty parent}">
                            ${area_items.id == parent.id ? "selected" : ""}
                            ${area_items.parentId != parent.parentId ? "hidden" : ""}
                        </c:if>
                >${area_items.name}
                </option>
            </c:forEach>
        </select>
        <select id="area_child" class="filter-select-area" onchange="filterSelectChange('area_child')">
            <c:if test="${not empty parent}">
                <c:if test="${child.id==0}">
                    selected
                </c:if>

                <jsp:useBean id="child" scope="request" type="by.md54.testcase.entity.Area"/>
                <c:forEach var="area_items" items="${areaList}">
                    <option value="${area_items}" data-id="${area_items.id}" data-parentId="${area_items.parentId}"
                            <c:if test="${not empty child && child.id!=0}">
                                ${area_items.parentId != child.parentId ? "hidden" : ""}
                                ${area_items.id == child.id ? "selected" : ""}
                            </c:if>
                            <c:if test="${empty child || child.id==0}">
                                ${"hidden"}
                            </c:if>
                    >${area_items.name}
                    </
                    >
                </c:forEach>
            </c:if>
        </select>
    </div>
    <div class="specFilter filterBlock">
        <label id="spec_label">Специализация:</label>
        <select id="specialization" class="filter-select-specialization" onchange="filterSelectChange('spec')">
            <c:forEach var="spec_items" items="${specialisationList}">
                <option value="${spec_items.id}" data-id="${spec_items.id}"
                    ${spec_items.id == specialisation.id ? "selected" : ""}
                >${spec_items.name}
                </option>
            </c:forEach>
        </select>

    </div>
    <table align="center">
        <tr>
            <td><input type="submit" value="Update Vacancies"/></td>
        </tr>
    </table>
    <input id="areaId" name="<portlet:namespace/>areaId" type="hidden" value="${area.id}"/>
    <input id="specId" type="hidden" name="<portlet:namespace/>specId" value="${specialisation.id}"/>
</form>



