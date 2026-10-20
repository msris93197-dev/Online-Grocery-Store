<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Pantrix | Forgot Password </title>
    <jsp:include page="layouts/header.jsp"></jsp:include>
    <link href="${pageContext.request.contextPath}/css/theme.css" rel="stylesheet" type="text/css" />
</head>
<body class="grocery-app auth-page">
<jsp:include page="layouts/app-header.jsp"/>
<jsp:include page="layouts/app-sidebar.jsp"/>
<main id="main-content" class="app-main" tabindex="-1">
<jsp:include page="layouts/page-header.jsp">
<jsp:param name="title" value="Reset your password"/>
<jsp:param name="root" value="Home"/>
<jsp:param name="rootUrl" value="/home"/>
<jsp:param name="parent" value=""/>
<jsp:param name="parentUrl" value="/home"/>
<jsp:param name="back" value="false"/>
<jsp:param name="step" value=""/>
</jsp:include>
<!-- log in -->
    <br>
    <div class="container h-100">
    <c:if test="${not empty success}">
                                <div class="alert alert-primary alert-dismissible fade show">
        <strong>Forgot Password!</strong> You should soon receive an email allowing you
        to reset your password.<br>Please make sure to check your spam and trash if you
        can't find the email.<button type="button" class="close" aria-label="Dismiss message" data-dismiss="alert">&times;</button>
                                    </div>
                            </c:if>
                            <c:if test="${not empty error}">
                                <div class="alert alert-danger alert-dismissible fade show">
        <strong>Forgot Password!</strong> Something went wrong.<br>Please try again later.
        <button type="button" class="close" aria-label="Dismiss message" data-dismiss="alert">&times;</button>
                                    </div>
                            </c:if>

<div class="d-flex justify-content-center h-100">
            <div class="row">
                <div class="col-md-12">
                    <form:form action="${pageContext.request.contextPath}/customer/forgotPassword" modelAttribute="forgot-password" method="post">
                        <div class="form-group">
                            <label class="col-form-label" for="field-email">Email</label>
                            <form:input id="field-email" type="email" path="email" class="form-control" placeholder="Email" name="email" required="required" />
                            <form:errors path="email" cssStyle="color:var(--danger);" cssClass="error"/>
                        </div>
                        <div class="right-w3l">
                            <input type="submit" class="form-control" value="Submit">
                        </div>
                        <p class="text-center dont-do mt-3">Don't have an account?
                            <a href="login">Register Now</a>
                        </p>
                    </form:form>
                    </div>
                </div>
                </div>
            </div>
    </main>
<jsp:include page="layouts/footer.jsp"></jsp:include>
</body>
</html>