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
<jsp:include page="layouts/app-header.jsp"/>
<jsp:include page="layouts/app-sidebar.jsp"/>
<main id="main-content" class="app-main" tabindex="-1">
<jsp:include page="layouts/page-header.jsp">
<jsp:param name="title" value="Page not found"/>
<jsp:param name="root" value="Home"/>
<jsp:param name="rootUrl" value="/home"/>
<jsp:param name="parent" value=""/>
<jsp:param name="parentUrl" value="/home"/>
<jsp:param name="back" value="false"/>
<jsp:param name="step" value=""/>
</jsp:include>
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
    </main>
<jsp:include page="layouts/footer.jsp"></jsp:include>
</body>
</html>