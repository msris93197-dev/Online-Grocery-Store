<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Pantrix | Contact </title>
    <jsp:include page="layouts/header.jsp"></jsp:include>
    <style type="text/css">

    </style>
    <link href="${pageContext.request.contextPath}/css/theme.css" rel="stylesheet" type="text/css" />
</head>
<body class="grocery-app">
<jsp:include page="layouts/app-header.jsp"/>
<jsp:include page="layouts/app-sidebar.jsp"/>
<main id="main-content" class="app-main" tabindex="-1">
<jsp:include page="layouts/page-header.jsp">
<jsp:param name="title" value="Contact us"/>
<jsp:param name="root" value="Home"/>
<jsp:param name="rootUrl" value="/home"/>
<jsp:param name="parent" value=""/>
<jsp:param name="parentUrl" value="/home"/>
<jsp:param name="back" value="false"/>
<jsp:param name="step" value=""/>
</jsp:include>
<!-- log in -->
    <br>
    <!-- contact -->
    <div class="contact py-sm-5 py-4">
        <div class="container py-xl-4 py-lg-2">
            <!-- tittle heading -->

            <!-- //tittle heading -->
            <div class="row contact-grids agile-1 mb-5">
                <div class="col-sm-4 contact-grid agileinfo-6 mt-sm-0 mt-2">
                    <div class="contact-grid1 text-center">
                        <div class="con-ic">
                            <i class="fas fa-map-marker-alt rounded-circle"></i>
                        </div>
                        <h4 class="font-weight-bold mt-sm-4 mt-3 mb-3">Address</h4>
                        <p style="font-weight: bold;color:var(--ink);">Pantrix
                            <label style="font-weight: bold;color:var(--ink);">Online grocery store</label>
                        </p>
                    </div>
                </div>
                <div class="col-sm-4 contact-grid agileinfo-6 my-sm-0 my-4">
                    <div class="contact-grid1 text-center">
                        <div class="con-ic">
                            <i class="fas fa-clock rounded-circle"></i>
                        </div>
                        <h4 class="font-weight-bold mt-sm-4 mt-3 mb-3">Support Hours</h4>
                        <p style="font-weight: bold;color:var(--ink);">Mon &ndash; Sat, 9 AM &ndash; 9 PM</p>
                    </div>
                </div>
                <div class="col-sm-4 contact-grid agileinfo-6">
                    <div class="contact-grid1 text-center">
                        <div class="con-ic">
                            <i class="fas fa-envelope-open rounded-circle"></i>
                        </div>
                        <h4 class="font-weight-bold mt-sm-4 mt-3 mb-3">Email</h4>
                        <p>
                            <a style="font-weight: bold;color:var(--ink);" href="#form">Write to us using the form below</a>
                        </p>
                    </div>
                </div>
            </div>
            <!-- form -->
            <form id="form" method="post">
                <div class="contact-grids1 w3agile-6">
                    <div class="row">
                    <c:choose>
                        <c:when test="${not empty email}">
                            <div class="col-md-6 col-sm-6 contact-form1 form-group">
                            <label class="col-form-label" for="name">Name</label>
                            <input type="text" class="form-control" placeholder="Name" disabled="disabled" value="${name}" name="name" id="name" required="required">
                            <p class="error" id="error_name"></p>
                        </div>
                        <div class="col-md-6 col-sm-6 contact-form1 form-group">
                            <label class="col-form-label" for="email">E-mail</label>
                            <input type="email" class="form-control" placeholder="Email" disabled="disabled" value="${email}" name="email" id="email" required="required">
                            <p class="error" id="error_email"></p>
                        </div>
                        </c:when>
                        <c:otherwise>
                            <div class="col-md-6 col-sm-6 contact-form1 form-group">
                            <label class="col-form-label" for="name">Name</label>
                            <input type="text" class="form-control" placeholder="Name" name="name" id="name" required="required">
                            <p class="error" id="error_name"></p>
                        </div>
                        <div class="col-md-6 col-sm-6 contact-form1 form-group">
                            <label class="col-form-label" for="email">E-mail</label>
                            <input type="email" class="form-control" placeholder="Email" name="email" id="email" required="required">
                            <p class="error" id="error_email"></p>
                        </div>
                        </c:otherwise>
                    </c:choose>
                        <div class="col-md-6 col-sm-6 contact-form1 form-group">
                            <label class="col-form-label" for="subject">Subject</label>
                            <input type="text" class="form-control" placeholder="Subject" name="subject" id="subject" required="required">
                            <p class="error" id="error_subject"></p>
                        </div>
                        <div class="col-md-6 col-sm-6 contact-form1 form-group">
                            <label class="col-form-label" for="message">Message</label>
                            <textarea name="message" class="form-control" placeholder="Message" cols="45" rows="5" id="message" required="required"></textarea>
                            <p class="error" id="error_message"></p>
                        </div>
                    </div>
                    <div class="right-w3l col-md-6">
                        <input type="button" class="btn btn-primary form-control" id="submit" value="Submit">
                    </div>
                </div>
            </form>
            <!-- //form -->
            <br>
                    <center><div id="success" style="color:var(--success);font-weight: bold;font-size: 15px;"></div></center>
                    <center><div id="error" style="color:var(--danger);font-weight: bold;font-size: 15px;"></div></center>
  <center>
  <img src="${pageContext.request.contextPath}/images/loader.gif" alt="loader" style="width: 150px;height: 120px;" id="loader">
  </center>
        </div>
    </div>
    <!-- //contact -->
    <!---728x90--->
    <!-- map -->

    <!-- //map -->
    </main>
<jsp:include page="layouts/footer.jsp"></jsp:include>
    <script src="${pageContext.request.contextPath}/js/contact.js"></script>
</body>
</html>