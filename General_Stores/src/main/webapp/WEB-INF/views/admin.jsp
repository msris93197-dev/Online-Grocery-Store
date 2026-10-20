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
<body class="grocery-app admin-page auth-page">
<jsp:include page="layouts/admin-header.jsp"/>
<jsp:include page="layouts/admin-sidebar.jsp"/>
<main id="main-content" class="app-main" tabindex="-1">
<jsp:include page="layouts/page-header.jsp">
<jsp:param name="title" value="Admin login"/>
<jsp:param name="root" value="Admin"/>
<jsp:param name="rootUrl" value="/admin/home"/>
<jsp:param name="parent" value=""/>
<jsp:param name="parentUrl" value="/admin/home"/>
<jsp:param name="back" value="false"/>
<jsp:param name="step" value=""/>
</jsp:include>

<!-- log in -->
    <br><br>
    <div class="container h-100">

<div class="d-flex justify-content-center h-100">
            <div class="row">
                <div class="col-md-12">

                    <form:form action="${pageContext.request.contextPath}/admin/home" modelAttribute="AdminLoginForm" method="post">
                        <div class="form-group">
                            <label class="col-form-label" for="field-email">Email</label>
                            <form:input id="field-email" type="email" path="email" class="form-control" size="30" placeholder="Email" name="email" required="required" />
                            <form:errors path="email" cssStyle="color:var(--danger);" cssClass="error"/>
                        </div>
                        <div class="form-group">
                            <label class="col-form-label" for="password">Password</label>
                            <form:password path="password" size="30" class="form-control" placeholder="Password" name="Password" id="password" required="required" />
                            <form:errors path="password" cssStyle="color:var(--danger);" cssClass="error"/>
                        </div>
                        <div class="right-w3l">
                            <input type="submit" class="form-control" value="Login">
                            <a href="/admin/forgot-password" style="color:var(--primary)">Forgot Password?</a>
                        </div>
                    </form:form>
                    </div>
                </div>
                </div>
            </div>
    </main>
<jsp:include page="layouts/footer.jsp"></jsp:include>
</body>
</html>