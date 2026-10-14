<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Grocket | Contacts</title>
<jsp:include page="layouts/header.jsp"></jsp:include>
<link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet">
<style type="text/css">
@media only screen and (max-width: 760px),
    (min-device-width: 768px) and (max-device-width: 1024px)  {
        p#mb {
            display: none;
            visibility: hidden;
        }
    }
@media(max-width:623px) {
    p#mb {
        color:var(--primary);
        font-weight:bold;
        align-content:center;
        display: unset;
        visibility:visible;
    }
table {
    display: block;
    overflow-x: auto;
}
}
    </style>
    <link href="${pageContext.request.contextPath}/css/theme.css" rel="stylesheet" type="text/css" />
</head>
<body class="grocery-app admin-page">
    <jsp:include page="layouts/admin_menu.jsp"></jsp:include>
    <!-- banner-2 -->
    <div class="page-head_agile_info_w3l"></div>
    <!-- //banner-2 -->
    <!-- page -->
    <div class="services-breadcrumb">
        <div class="agile_inner_breadcrumb">
            <div class="container">
                <ul class="w3_short">
                    <li><a href="/admin/home">Home</a> <i>|</i></li>
                    <li>View Contacts</li>
                </ul>
            </div>
        </div>
    </div>
    <!-- //page -->
    <!-- register -->
    <div class="contact py-sm-5 py-4">
    <c:if test="${not empty delete}">
                <div class="alert alert-success alert-dismissible fade show text-center">
                    Customer contact removed successfully.
                    <button type="button" class="close" aria-label="Dismiss message" data-dismiss="alert">&times;</button>
                </div>
</c:if>
        <div class="container-fluid py-xl-4 py-lg-2">
<div class="admin-heading"><div><span class="eyebrow">Store administration</span><h2>Customer messages</h2><p>Read enquiries and messages from your customers.</p></div></div>
            <p id="mb">Slide Right to see full table.</p>
    <table id="example" class="responsive-table table table-hover table-bordered text-center">
                <thead>
                    <tr>
                        <th scope="col">SR. No.</th>
                        <th scope="col">Name</th>
                        <th scope="col">Email</th>
                        <th scope="col">Message</th>
                        <th scope="col">Date</th>
                        <th scope="col">Action</th>
                    </tr>
                </thead>
                <tbody>
                <c:set var="count" value="0" scope="page"></c:set>
                    <c:forEach var="contact" items="${contact}">
                    <c:set var="count" value="${count + 1}" scope="page"></c:set>
                        <tr>
                            <td data-label="SR. No."><div class="cell-value">${count}</div></td>
                            <td data-label="Name"><div class="cell-value">${contact.name}</div></td>
                            <td data-label="Email"><div class="cell-value">${contact.email}</div></td>
                            <td data-label="Message"><div class="cell-value">${contact.message}</div></td>
                            <td data-label="Date"><div class="cell-value"><fmt:formatDate pattern="dd-MMM-yyyy HH:mm" value="${contact.contactDate}" /></div></td>
                            <td data-label="Action"><div class="cell-value"><a href="${pageContext.request.contextPath}/admin/contact/delete/${contact.id}" style="font-size:40px;color:var(--primary);" onclick="return confirm('Are you sure you want to delete this contact?');" aria-label="Remove item">
                            <i class="far fa-times-circle"></i></a></div></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
    <jsp:include page="layouts/cart-footer.jsp"></jsp:include>
    <!-- Bootstrap core JavaScript-->
<!-- Page level plugin JavaScript-->
<script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js"></script>
<script>
    $(document).ready(function() {
        $('#example').DataTable();
    } );
    </script>
</body>
</html>
