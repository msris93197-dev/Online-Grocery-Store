<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Pantrix | Login </title>
    <jsp:include page="layouts/header.jsp"></jsp:include>
    <link href="${pageContext.request.contextPath}/css/theme.css" rel="stylesheet" type="text/css" />
</head>
<body class="grocery-app auth-page">
<jsp:include page="layouts/app-header.jsp"/>
<jsp:include page="layouts/app-sidebar.jsp"/>
<main id="main-content" class="app-main" tabindex="-1">
<jsp:include page="layouts/page-header.jsp">
<jsp:param name="title" value="Login"/>
<jsp:param name="subtitle" value="Sign in to shop your everyday essentials."/>
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

<div class="d-flex justify-content-center h-100">
            <div class="row">
                <div class="col-md-12">
                <c:if test="${not empty backUrl}"><center><h4 class="text-center" style="color:var(--danger);">Login First</h4><hr></center></c:if>
                    <form:form action="${pageContext.request.contextPath}/customer/loginCustomer" modelAttribute="customerLoginForm" method="post" class="validatedForm">
                        <div class="contact-form1 form-group">
                                <label class="col-form-label" for="email">Email</label>
                                <form:input type="email" path="email" size="40" class="form-control" id="email" placeholder="Email" name="Email" required="required" />
                                <form:errors path="email" cssStyle="color:var(--danger);" cssClass="error"/>
                            </div>
                            <div class="contact-form1 form-group">
                                <label class="col-form-label" for="password">Password</label>
                                <form:password path="password" maxlength="64" size="40" minlength="6" class="form-control" placeholder="Password" name="Password" id="password" required="required" />
                                <form:errors path="password" cssStyle="color:var(--danger);" cssClass="error"/>
                            </div>
                            <div class="right-w3l">
                                <input type="submit" class="form-control btn btn-primary" value="Login">
                            </div>
                    </form:form>
                    <a href="register" style="color:var(--primary)">Register</a>
                    <a href="forgot-password" style="color:var(--primary);float:right;">Forgot Password?</a>
                    </div>
                </div>
            </div>
        </div>
    </main>
<jsp:include page="layouts/footer.jsp"></jsp:include>
</body>
</html>