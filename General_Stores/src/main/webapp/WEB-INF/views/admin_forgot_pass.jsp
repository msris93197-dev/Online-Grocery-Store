<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Pantrix | Forgot Password </title>
    <jsp:include page="layouts/header.jsp"></jsp:include>
    <link href="${pageContext.request.contextPath}/css/theme.css" rel="stylesheet" type="text/css" />
</head>
<body class="grocery-app admin-page auth-page">
<jsp:include page="layouts/admin-header.jsp"/>
<jsp:include page="layouts/admin-sidebar.jsp"/>
<main id="main-content" class="app-main" tabindex="-1">
<jsp:include page="layouts/page-header.jsp">
<jsp:param name="title" value="Reset admin access"/>
<jsp:param name="root" value="Admin"/>
<jsp:param name="rootUrl" value="/admin/home"/>
<jsp:param name="parent" value=""/>
<jsp:param name="parentUrl" value="/admin/home"/>
<jsp:param name="back" value="false"/>
<jsp:param name="step" value=""/>
</jsp:include>
<!-- log in -->
    <br>
    <div class="container h-100">
        <c:if test="${not empty success}">
        <div class="alert alert-success alert-dismissible fade show">
        <strong>Forgot Password!</strong> Email has been sent.
        Click  <a href="${pageContext.request.contextPath}/admin/" style="text-decoration: underline;" class="title">Here</a> to login.<button type="button" class="close" aria-label="Dismiss message" data-dismiss="alert">&times;</button>
           </div>
    </c:if>
        <c:if test="${not empty blank}">
                <div class="alert alert-danger alert-dismissible fade show">
        <strong>Forgot Password!</strong> Email is required.
        <button type="button" class="close" aria-label="Dismiss message" data-dismiss="alert">&times;</button>
                   </div>
        </c:if>
        <c:if test="${not empty error}">
            <div class="alert alert-danger alert-dismissible fade show">
        <strong>Forgot Password!</strong> Oops! Something Went Wrong.
        <button type="button" class="close" aria-label="Dismiss message" data-dismiss="alert">&times;</button>
               </div>
        </c:if>
        <c:if test="${not empty notFound}">
            <div class="alert alert-danger alert-dismissible fade show">
        <strong>Forgot Password!</strong> Could not found a user with this email.
        <button type="button" class="close" aria-label="Dismiss message" data-dismiss="alert">&times;</button>
                </div>
        </c:if>

<div class="d-flex justify-content-center h-100">
            <div class="row">
                <div class="col-md-12">
                    <form action="/admin/forgotPassword" method="post">
                        <div class="form-group">
                            <label class="col-form-label" for="email">Email</label>
                            <input type="email" class="form-control" size="35" placeholder="Enter email" name="email" id="email" required="required">
                        </div>
                        <div class="right-w3l">
                            <input type="submit" class="form-control btn btn-primary" value="Submit">
                        </div>
                    </form>
                    </div>
                </div>
                </div>
            </div>
    </main>
<jsp:include page="layouts/footer.jsp"></jsp:include>
</body>
</html>