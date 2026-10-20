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
    <title>Pantrix | My Orders</title>
    <jsp:include page="layouts/header.jsp"></jsp:include>
    <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/theme.css" rel="stylesheet" type="text/css" />
</head>
<body class="grocery-app">
<jsp:include page="layouts/app-header.jsp"/>
<jsp:include page="layouts/app-sidebar.jsp"/>
<main id="main-content" class="app-main" tabindex="-1">
<jsp:include page="layouts/page-header.jsp">
<jsp:param name="title" value="My orders"/>
<jsp:param name="subtitle" value="Track your purchases in one place."/>
<jsp:param name="root" value="Home"/>
<jsp:param name="rootUrl" value="/home"/>
<jsp:param name="parent" value="My Pantrix"/>
<jsp:param name="parentUrl" value="/customer/my-account"/>
<jsp:param name="back" value="true"/>
<jsp:param name="step" value=""/>
</jsp:include>
    <div class="privacy py-sm-5 py-4">
    <c:if test="${not empty cancelled}">
        <div class="alert alert-success alert-dismissible fade show text-center">
            Your order has been cancelled successfully.
            <button type="button" class="close" aria-label="Dismiss message" data-dismiss="alert">&times;</button>
        </div>
</c:if>
        <div class="container py-xl-4 py-lg-2">

            <div class="container">
            <c:if test="${empty orders}"><div class="empty-state"><i class="fas fa-box-open" aria-hidden="true"></i><h2>Your first order starts here</h2><p>Pick your pantry favourites and we will keep your orders here.</p><a class="btn btn-primary" href="${pageContext.request.contextPath}/product/all">Start shopping</a></div></c:if><div class="table-responsive">
<table id="example" class="responsive-table table table-hover table-bordered text-center">
      <thead>
        <tr>
          <th scope="col">SR. No.</th>
          <th scope="col">Order No.</th>
          <th scope="col">Item</th>
          <th scope="col">Quantity</th>
          <th scope="col">Price(&#x20b9;)</th>
          <th scope="col">Total Price(&#x20b9;)</th>
          <th scope="col">Date</th>
          <th scope="col">Status</th>
<!--           <th scope="col">Action</th> -->
        </tr>
      </thead>
      <tbody>
      <c:forEach var="orders" items="${orders}">
       <c:set var="count" value="${count + 1}" scope="page"/>
        <tr>
          <td data-label="SR. No."><div class="cell-value">${count}</div></td>
          <td data-label="Order No."><div class="cell-value">${orders.paymentId}</div></td>
          <td data-label="Item"><div class="cell-value"><a href="${pageContext.request.contextPath}/product/productdetails?code=${orders.product.code}" target="_blank">
          <span class="image-tile compact-image-tile"><img loading="lazy" alt="${orders.product.name}" src="${pageContext.request.contextPath}${orders.product.image}" width="70" height="90" class="product-image img img-responsiive" /></span></a>
          <br>${orders.product.name}</div></td>
          <td data-label="Quantity"><div class="cell-value">${orders.quantity}</div></td>
          <td data-label="Price(&#x20b9;)"><div class="cell-value"><fmt:formatNumber value="${orders.price}" minFractionDigits="0" maxFractionDigits="2" groupingUsed="false" /></div></td>
          <td data-label="Total Price(&#x20b9;)"><div class="cell-value"><fmt:formatNumber value="${orders.amount}" minFractionDigits="0" maxFractionDigits="2" groupingUsed="false" /></div></td>
          <td data-label="Date"><div class="cell-value"><fmt:formatDate pattern="dd-MMM-yyyy HH:mm" value="${orders.order.orderDate}" /></div></td>
          <td data-label="Status"><div class="cell-value">
          <c:if test="${orders.orderStatus eq 'Pending'}">
              <span class="badge badge-warning">${orders.orderStatus}</span>
              </c:if>
              <c:if test="${orders.orderStatus eq 'Delivered'}">
              <span class="badge badge-success">${orders.orderStatus}</span>
              </c:if>
              <c:if test="${orders.orderStatus eq 'Cancelled'}">
              <span class="badge badge-danger">${orders.orderStatus}</span>
              </c:if>
          </div></td>
<!--           <td data-label="Action"><div class="cell-value"> -->
<%--           	<c:if test="${orders.orderStatus eq 'Pending'}"> --%>
<%--           	<c:set var="aemail" value="email" scope="session"/> --%>
<%--           	<a href="${pageContext.request.contextPath}/admin/order/changeStatus/Cancelled/${orders.id}" class="btn btn-warning" onclick="return confirm('Are you sure you want to cancel this order?');">Cancel</a> --%>
<%--           	</c:if> --%>
<%--           	<c:if test="${orders.orderStatus eq 'Delivered'}"> --%>
<%--           	<a href="${pageContext.request.contextPath}/product/productdetails?code=${orders.product.code}" class="btn btn-success">Re-Order</a> --%>
<%--           	</c:if> --%>
<%--           	<c:if test="${orders.orderStatus eq 'Cancelled'}"> --%>
<%--           	<a href="${pageContext.request.contextPath}/product/productdetails?code=${orders.product.code}" class="btn btn-info">Re-Order</a> --%>
<%--           	</c:if>  --%>
<!--           </div></td> -->
        </tr>
        </c:forEach>
      </tbody>
    </table>
    </div>
            </div>
        </div>
    </div>
    <!-- //checkout page -->
    <div>
    </div>
</main>
<jsp:include page="layouts/cart-footer.jsp"></jsp:include>
    <!-- Bootstrap core JavaScript-->
<!-- Page level plugin JavaScript-->
<script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js"></script>
    <!--quantity-->
    <script>
    $(document).ready(function() {
        $('#example').DataTable();
    } );
    </script>
</body>
</html>