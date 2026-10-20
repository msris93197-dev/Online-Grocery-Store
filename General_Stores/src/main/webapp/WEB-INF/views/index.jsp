<%@ taglib prefix="pantrix" tagdir="/WEB-INF/tags"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Pantrix | Home </title>
    <jsp:include page="layouts/header.jsp"></jsp:include>
    <link href="${pageContext.request.contextPath}/css/theme.css" rel="stylesheet" type="text/css" />
</head>
<body class="grocery-app">
<jsp:include page="layouts/app-header.jsp"/>
<jsp:include page="layouts/app-sidebar.jsp"/>
<main id="main-content" class="app-main" tabindex="-1">
<jsp:include page="layouts/page-header.jsp">
<jsp:param name="title" value="Your everyday pantry"/>
<jsp:param name="subtitle" value="Everyday essentials, easy to find."/>
<jsp:param name="root" value="Home"/>
<jsp:param name="rootUrl" value="/home"/>
<jsp:param name="parent" value=""/>
<jsp:param name="parentUrl" value="/home"/>
<jsp:param name="back" value="false"/>
<jsp:param name="step" value=""/>
</jsp:include>

    <jsp:include page="layouts/banner.jsp"></jsp:include>
    <!-- top Products -->
    <div class="ads-grid py-sm-5 py-4">
        <div class="container-fluid py-xl-4 py-lg-2">
            <div class="row">
                <!-- product left -->
                <div class="agileinfo-ads-display col-lg-12">
                    <div class="wrapper">
                        <!-- first section -->
                        <div class="px-sm-4 px-3 py-sm-5 py-3 mb-4">

                            <div class="row product-grid">
<c:choose>
                    <c:when test="${not empty products}">
                        <c:forEach var="product" items="${products}"><pantrix:productCard product="${product}"/></c:forEach>
                    </c:when>
                    <c:otherwise>
                        <c:if test="${empty products}"><div class="empty-state"><i class="fas fa-shopping-basket" aria-hidden="true"></i><h2>The shelves are being restocked</h2><p>Please check back soon for your everyday essentials.</p><a class="btn btn-primary" href="${pageContext.request.contextPath}/product/all">Browse all products</a></div></c:if>
                </c:otherwise>
            </c:choose>
                    </div>
                        </div>
                        <c:choose>
                    <c:when test="${count > product_size}">
                        <div class="col-12 text-center">
                            <b><a class="btn btn-success" style="color:white;border-radius: 15px;" href="${pageContext.request.contextPath}/products/1">Browse more products</a></b>
                        </div>
                    </c:when>
                    <c:otherwise>
                    <c:if test="${pageNo > 0}">
                        <div class="col-sm-12 text-center">
                            <b><a class="btn btn-success" style="color: white;border-radius: 15px;" href="${nextUrl}">Next page</a></b>&nbsp;
                            <b><a class="btn btn-danger" href="${backUrl}" style="color: white;border-radius: 15px;">Go back</a></b>
                        </div>
                    </c:if>
                    <c:if test="${empty products}">
                        <div class="col-12 text-center">
                            <b><a class="btn btn-danger" href="${header.referer}" style="color: white;border-radius: 15px;">... GO BACK ...</a></b>
                        </div>
                    </c:if>
                    </c:otherwise>
                </c:choose>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </main>
<jsp:include page="layouts/footer.jsp"></jsp:include>
</body>
</html>