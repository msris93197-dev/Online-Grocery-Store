<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Pantrix | Page 404 </title>
    <jsp:include page="layouts/header.jsp"></jsp:include>
    <link href="${pageContext.request.contextPath}/css/theme.css" rel="stylesheet" type="text/css" />
</head>
<body class="grocery-app">
    <c:choose>
    <c:when test="${not empty email}">
        <jsp:include page="layouts/user-navigation.jsp"></jsp:include>
        <jsp:include page="layouts/user-menu.jsp"></jsp:include>
    </c:when>
    <c:otherwise>
        <jsp:include page="layouts/navigation-bar.jsp"></jsp:include>
        <jsp:include page="layouts/menu.jsp"></jsp:include>
    </c:otherwise>
</c:choose>
    <!-- banner-2 -->
    <div class="page-head_agile_info_w3l">

    </div>
    <!-- //banner-2 -->
    <!-- page -->
    <div class="services-breadcrumb">
        <div class="agile_inner_breadcrumb">
            <div class="container">
                <ul class="w3_short">
                    <li>
                        <a href="${pageContext.request.contextPath}/home">Home</a>
                        <i>|</i>
                    </li>
                    <li>Page 404</li>
                </ul>
            </div>
        </div>
    </div>
    <!-- //page -->
<br><!-- 404 page start -->
<div class="fourzerofour">
    <div class="container">
        <div class="row">
            <div class="col-12 text-center">
                <h2>Nothing on this shelf.</h2><p>The page you are looking for could not be found.</p><div class="img">
                    <img class="img-fluid" src="${pageContext.request.contextPath}/images/404.png" alt="Page not found">
                </div><br>
                <div class="text-center dont-do mt-3">
        <a href="${pageContext.request.contextPath}/home" class="btn btn-success">Continue shopping</a>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- 404 page End -->
    <jsp:include page="layouts/footer.jsp"></jsp:include>
</body>
</html>