<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Pantrix | My Account</title>
    <jsp:include page="layouts/header.jsp"></jsp:include>
    <link href="${pageContext.request.contextPath}/css/theme.css" rel="stylesheet" type="text/css" />
</head>
<body class="grocery-app admin-page account-page">
<jsp:include page="layouts/admin-header.jsp"/>
<jsp:include page="layouts/admin-sidebar.jsp"/>
<main id="main-content" class="app-main" tabindex="-1">
<jsp:include page="layouts/page-header.jsp">
<jsp:param name="title" value="My account"/>
<jsp:param name="root" value="Admin"/>
<jsp:param name="rootUrl" value="/admin/home"/>
<jsp:param name="parent" value=""/>
<jsp:param name="parentUrl" value="/admin/home"/>
<jsp:param name="back" value="true"/>
<jsp:param name="step" value=""/>
</jsp:include>
<!-- log in -->
    <br>
<!-- register -->
    <div class="contact py-sm-5 py-4">
        <div class="container py-xl-4 py-lg-2">

        <c:if test="${not empty success}">
            <div class="alert alert-success alert-dismissible fade show">
                Account Updated Successfully.
                <button type="button" class="close" aria-label="Dismiss message" data-dismiss="alert">&times;</button>
            </div>
        </c:if>
        <c:if test="${not empty error}">
            <div class="alert alert-danger alert-dismissible fade show">
                Something went wrong.
                <button type="button" class="close" aria-label="Dismiss message" data-dismiss="alert">&times;</button>
            </div>
        </c:if>
        <!-- form -->
            <form action="/admin/updateProfile" method="post">
                <div class="contact-grids1 w3agile-6">
                    <div class="row">
                        <div class="col-md-6 col-sm-6 contact-form1 form-group">
                            <label class="col-form-label" for="name">Name</label>
                            <input type="text" class="form-control" placeholder="Name" name="name" id="name" value="${name}" />
                        </div>

                        <div class="col-md-6 col-sm-6 contact-form1 form-group">
                            <label class="col-form-label" for="email">Email</label>
                            <input type="email" class="form-control" placeholder="Email" name="email" id="email" value="${email}"/>
                        </div>
                    </div>
                    <div class="right-w3l col-md-6">
                        <input type="submit" id="submit" class="form-control" value="Update">
                    </div>
                </div>
            </form>
            <!-- //form -->
        </div>
    </div>
    </main>
<jsp:include page="layouts/footer.jsp"></jsp:include>
</body>
</html>
