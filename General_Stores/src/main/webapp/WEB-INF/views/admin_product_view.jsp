<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Grocket | Products</title>
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
                    <li>View Products</li>
                </ul>
            </div>
        </div>
    </div>
    <!-- //page -->
    <!-- register -->
    <div class="contact py-sm-5 py-4">
        <div class="container-fluid py-xl-4 py-lg-2">
<div class="admin-heading"><div><span class="eyebrow">Store administration</span><h2>Products</h2><p>Manage your catalogue, pricing and product details.</p></div></div>
    <c:if test="${not empty delete}">
                <div class="alert alert-success alert-dismissible fade show text-center">
                    Product removed successfully.
                    <button type="button" class="close" aria-label="Dismiss message" data-dismiss="alert">&times;</button>
                </div>
    </c:if>
    <c:if test="${not empty invalid}">
                <div class="alert alert-danger alert-dismissible fade show text-center">
                    Invalid Filename.
                    <button type="button" class="close" aria-label="Dismiss message" data-dismiss="alert">&times;</button>
                </div>
    </c:if>
<p id="mb">Slide Right to see full table.</p>
    <table id="example" class="responsive-table table table-hover table-bordered text-center">
                <thead>
                    <tr>
                        <th scope="col">SR. No.</th>
                        <th scope="col">Name</th>
                        <th scope="col">Image</th>
                        <th scope="col">Description</th>
                        <th scope="col">MRP(&#x20b9;)</th>
                        <th scope="col">Price(&#x20b9;)</th>
                        <th scope="col">Date</th>
                        <th scope="col">Action</th>
                    </tr>
                </thead>
                <tbody>
                <c:set var="count" value="0" scope="page"></c:set>
                    <c:forEach var="product" items="${product}">
                    <c:set var="count" value="${count + 1}" scope="page"></c:set>
                        <tr>
                            <td data-label="SR. No."><div class="cell-value">${count}</div></td>
                            <td data-label="Name"><div class="cell-value">${product.name}</div></td>
                            <td data-label="Image"><div class="cell-value"><a href="${pageContext.request.contextPath}/product/productdetails?code=${product.code}" target="_blank">
          <img loading="lazy" alt="${product.name}" src="${pageContext.request.contextPath}${product.image}" width="70" height="90" class="product-image img img-responsiive" /></a>
         </div></td>
                            <td data-label="Description"><div class="cell-value">${product.description}</div></td>
                            <td data-label="MRP(&#x20b9;)"><div class="cell-value"><del><fmt:formatNumber value="${product.mrpPrice}" minFractionDigits="0" maxFractionDigits="2" groupingUsed="false" /></del></div></td>
                            <td data-label="Price(&#x20b9;)"><div class="cell-value"><fmt:formatNumber value="${product.price}" minFractionDigits="0" maxFractionDigits="2" groupingUsed="false" /></div></td>
                            <td data-label="Date"><div class="cell-value"><fmt:formatDate pattern="dd-MMM-yyyy HH:mm" value="${product.createDate}" /></div></td>
                            <td data-label="Action"><div class="cell-value"><a href="${pageContext.request.contextPath}/admin/product/edit/${product.code}" aria-label="Edit product"><i class="far fa-edit" style="font-size:30px;color:var(--primary);"></i></a> |
                              <c:set var="fileName" value="${fn:split(product.image, '/')}" />
                              <a href="${pageContext.request.contextPath}/admin/product/delete/${product.id}/${fileName[1]}" style="font-size:30px;color:var(--primary);" onclick="return confirm('Are you sure you want to delete this product?');" aria-label="Remove item">
                            <i class="far fa-times-circle"></i></a>
                            </div></td>
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
