<%@ taglib prefix="pantrix" tagdir="/WEB-INF/tags"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Pantrix | Search results </title>
    <jsp:include page="layouts/header.jsp"></jsp:include>
    <link href="${pageContext.request.contextPath}/css/theme.css" rel="stylesheet" type="text/css" />
</head>
<body class="grocery-app">
<jsp:include page="layouts/app-header.jsp"/>
<jsp:include page="layouts/app-sidebar.jsp"/>
<main id="main-content" class="app-main" tabindex="-1">
<jsp:include page="layouts/page-header.jsp">
<jsp:param name="title" value="Search results"/>
<jsp:param name="subtitle" value="Find something for your pantry."/>
<jsp:param name="root" value="Home"/>
<jsp:param name="rootUrl" value="/home"/>
<jsp:param name="parent" value="All products"/>
<jsp:param name="parentUrl" value="/product/all"/>
<jsp:param name="back" value="false"/>
<jsp:param name="step" value=""/>
</jsp:include>

    <!-- top Products -->
    <div class="ads-grid py-sm-5 py-4">
        <div class="container py-xl-4 py-lg-2">
            <div class="row">
                <!-- product left -->
                <div class="agileinfo-ads-display col-lg-12">
                    <div class="wrapper">
                        <!-- first section -->
                        <div class="px-sm-4 px-3 py-sm-5 py-3 mb-4">

                            <div class="row product-grid">
<c:choose>
                            <c:when test="${not empty products}">
                            <c:forEach var="product" items="${products}"><pantrix:productCard product="${product}" includeMrp="false"/></c:forEach>
                                </c:when>
                            <c:otherwise><div class="empty-state"><i class="fas fa-search" aria-hidden="true"></i><h2>No results for &#39;<c:out value="${param.keyword}"/>&#39;</h2><p>Try another pantry favourite or explore the full collection.</p><a class="btn btn-primary" href="${pageContext.request.contextPath}/product/all">Browse all products</a></div>

                            </c:otherwise>
                        </c:choose>
                                <!-- //product left -->
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- //top products -->
    </main>
<jsp:include page="layouts/footer.jsp"></jsp:include>
</body>
</html>