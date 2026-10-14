<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<c:if test="${empty aemail}">
    <c:redirect url="${pageContext.request.contextPath}/user/sign-in"/>
</c:if>
    <title>Pantrix | Cancelled Orders </title>
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
    <div class="page-head_agile_info_w3l"></div>
    <!-- page -->
    <div class="services-breadcrumb">
        <div class="agile_inner_breadcrumb">
            <div class="container">
                <ul class="w3_short">
                    <li>
                        <a href="${pageContext.request.contextPath}/admin/home">Home</a>
                        <i>|</i>
                    </li>
                    <li>Cancelled Orders</li>
                </ul>
            </div>
        </div>
    </div>
    <!-- //page -->
<div class="contact py-sm-5 py-4">
<div class="container-fluid py-xl-4 py-lg-2">
<div class="admin-heading"><div><span class="eyebrow">Store administration</span><h2>Cancelled orders</h2><p>Review cancelled purchases.</p></div></div>
<c:if test="${not empty delete}">
                <div class="alert alert-success alert-dismissible fade show text-center">
                    Order removed successfully.
                    <button type="button" class="close" aria-label="Dismiss message" data-dismiss="alert">&times;</button>
                </div>
</c:if>
<c:if test="${not empty delivered}">
                <div class="alert alert-success alert-dismissible fade show text-center">
                    Order Status Changed to Delivered.
                    <button type="button" class="close" aria-label="Dismiss message" data-dismiss="alert">&times;</button>
                </div>
</c:if>
<c:if test="${not empty pendings}">
                <div class="alert alert-success alert-dismissible fade show text-center">
                    Order Status Changed to Pending.
                    <button type="button" class="close" aria-label="Dismiss message" data-dismiss="alert">&times;</button>
                </div>
</c:if>
<p id="mb">Slide Right to see full table.</p>
<h3 class="text-center">Cancelled Orders</h3>
    <table id="example" class="responsive-table table table-hover table-bordered text-center">
                <thead>
                    <tr>
                        <th scope="col">SR. No.</th>
                        <th scope="col">Order No.</th>
                        <th scope="col">Customer Details</th>
                        <th scope="col">Item</th>
                        <th scope="col">Qty.</th>
                        <th scope="col">Total Amount (&#x20b9;)</th>
                        <th scope="col">Status</th>
                        <th scope="col">Date</th>
                        <th scope="col">Action</th>
                    </tr>
                </thead>
                <tbody>
                <c:set var="count" value="0" scope="page"></c:set>
                    <c:forEach var="orders" items="${cancel}">
                    <c:set var="count" value="${count + 1}" scope="page"></c:set>
                        <tr>
                            <td data-label="SR. No."><div class="cell-value">${count}</div></td>
                            <td data-label="Order No."><div class="cell-value">${orders.paymentId}</div></td>
                            <td data-label="Customer Details"><div class="cell-value">${orders.order.customerName} |
                            ${orders.order.customerEmail} |
                            ${orders.order.customerPhone} |
                            ${orders.order.customerAddress} |
                            ${orders.order.customerAddressType} |
                            ${orders.order.pinCode}</div></td>
                            <td data-label="Item"><div class="cell-value"><a href="${pageContext.request.contextPath}/product/productdetails?code=${orders.product.code}" target="_blank">
          <img loading="lazy" alt="${orders.product.name}" src="${pageContext.request.contextPath}${orders.product.image}" width="70" height="90" class="product-image img img-responsiive" /></a>
          <br>${orders.product.name}</div></td>
                              <td data-label="Qty."><div class="cell-value">${orders.quantity}</div></td>
                            <td data-label="Total Amount (&#x20b9;)"><div class="cell-value"><fmt:formatNumber value="${orders.amount}" minFractionDigits="0" maxFractionDigits="2" groupingUsed="false" /></div></td>
                            <td data-label="Status"><div class="cell-value"><span class="badge badge-danger">${orders.orderStatus}</span></div></td>
                            <td data-label="Date"><div class="cell-value"><fmt:formatDate pattern="dd-MMM-yyyy hh:mm:ss" value="${orders.order.orderDate}" /></div></td>
                            <td data-label="Action"><div class="cell-value">
                        <a href="${pageContext.request.contextPath}/admin/order/changeStatus/Delivered/${orders.id}" class="btn btn-success" onclick="return confirm('Change Order Status to Delivered?');">Deliver</a>
                         <hr> <a href="${pageContext.request.contextPath}/admin/order/changeStatus/Pending/${orders.id}" class="btn btn-warning" onclick="return confirm('Change Order Status to Pending?');">Pending</a></div></td>
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
