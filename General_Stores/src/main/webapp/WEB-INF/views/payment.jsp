<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<c:if test="${empty email}">
    <c:redirect url="${pageContext.request.contextPath}/user/sign-in"/>
</c:if>
    <title>Pantrix | Order confirmation</title>
    <jsp:include page="layouts/header.jsp"></jsp:include>
    <link href="${pageContext.request.contextPath}/css/theme.css" rel="stylesheet" type="text/css" />
</head>
<body class="grocery-app">
<jsp:include page="layouts/app-header.jsp"/>
<jsp:include page="layouts/app-sidebar.jsp"/>
<main id="main-content" class="app-main" tabindex="-1">
<jsp:include page="layouts/page-header.jsp">
<jsp:param name="title" value="Payment"/>
<jsp:param name="subtitle" value="Complete your order."/>
<jsp:param name="root" value="Home"/>
<jsp:param name="rootUrl" value="/home"/>
<jsp:param name="parent" value="My cart"/>
<jsp:param name="parentUrl" value="/cart/my-cart"/>
<jsp:param name="back" value="true"/>
<jsp:param name="step" value="3"/>
</jsp:include>
    <!-- checkout page -->
    <div class="privacy py-sm-5 py-4">
        <div class="container py-xl-4 py-lg-2">
            <!-- tittle heading -->

        <c:if test="${not empty success}">
            <c:set var="totalAmount" value="${totalAmount}" scope="session"></c:set>
            <c:set var="totalMrp" value="${totalMrp}" scope="session"></c:set>
            <fmt:formatDate var="orderDate" pattern="dd-MMM-yyyy" value="${orderDate}" scope="session" />
            <c:set var="paymentId" value="${paymentId}" scope="session"></c:set>
            <c:set var="pinCode" value="${pinCode}" scope="session"></c:set>
            <c:set var="totalQty" value="${totalQty}" scope="session"></c:set>
            <c:set var="totalSavings" value="${totalSavings}" scope="session"></c:set>
    <h4 class="text-center">Thank you for your order. <a href="${pageContext.request.contextPath}/orders/getPdf">
    click</a> here to send bill to your email.</h4>
        </c:if>
        <c:if test="${not empty pdf}">
            <h4 class="text-center">Email has been sent.<a href="${pageContext.request.contextPath}/orders/my-orders">
    click</a> here to check your orders.</h4>
        </c:if>
        <c:if test="${not empty error_pdf}">
            <h4 class="text-center">Oops! Something Went Wrong While Sending Email.</h4>
        </c:if>
        <c:if test="${not empty error}">
            <h4 class="text-center">Oops! Something Went Wrong.</h4>
        </c:if>
        </div>
    </div>
    <!-- //checkout page -->
    <div>
        <div>
        </div>
    </div>
</main>
<jsp:include page="layouts/footer.jsp"></jsp:include>
</body>
</html>