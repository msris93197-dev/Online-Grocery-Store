<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<c:if test="${empty email}">
    <c:redirect url="${pageContext.request.contextPath}/user/sign-in"/>
</c:if>
    <title>Pantrix | Checkout</title>
    <jsp:include page="layouts/header.jsp"></jsp:include>
    <link href="${pageContext.request.contextPath}/css/theme.css" rel="stylesheet" type="text/css" />
</head>
<body class="grocery-app">
<jsp:include page="layouts/app-header.jsp"/>
<jsp:include page="layouts/app-sidebar.jsp"/>
<main id="main-content" class="app-main" tabindex="-1">
<jsp:include page="layouts/page-header.jsp">
<jsp:param name="title" value="Delivery address"/>
<jsp:param name="subtitle" value="Tell us where to deliver your essentials."/>
<jsp:param name="root" value="Home"/>
<jsp:param name="rootUrl" value="/home"/>
<jsp:param name="parent" value="My cart"/>
<jsp:param name="parentUrl" value="/cart/my-cart"/>
<jsp:param name="back" value="true"/>
<jsp:param name="step" value="2"/>
</jsp:include>
    <!-- checkout page -->
    <div class="privacy py-sm-5 py-4">
        <div class="container py-xl-4 py-lg-2">
            <!-- tittle heading -->

    <div class="container">
    <table id="example" class="responsive-table table table-hover">
      <thead>
        <tr>
          <th scope="col">Product Name</th>
          <th scope="col">Quantity</th>
          <th scope="col">Price</th>
          <th scope="col">Total Price</th>
        </tr>
      </thead>
      <tbody>
       <c:set var="count" value="1" scope="page"/>
        <tr>
<%--           <td data-label="Product Name"><div class="cell-value"><a href="${pageContext.request.contextPath}/product/productdetails?code=${code}">${itemName}</a></div></td> --%>
<td data-label="Quantity"><div class="cell-value"><a href="${pageContext.request.contextPath}/product/productdetails?code=${code}" target="_blank">
          <span class="image-tile compact-image-tile"><img loading="lazy" alt="${itemName}" src="${pageContext.request.contextPath}${image}" width="70" height="90" class="product-image img img-responsiive" /></span></a>
          <br>${itemName}</div></td>
          <td data-label="Price"><div class="cell-value">${quantity}</div></td>
          <td data-label="Total Price"><div class="cell-value"><fmt:formatNumber value="${price}" minFractionDigits="0" maxFractionDigits="2" groupingUsed="false" /></div></td>
          <td data-label="Summary"><div class="cell-value"><fmt:formatNumber value="${totalPrice}" minFractionDigits="0" maxFractionDigits="2" groupingUsed="false" /></div></td>
        </tr>
      </tbody>
    </table>
            </div>
        <c:if test="${not empty count}">
            <aside class="summary-card" aria-label="Order summary"><h4>Order summary</h4><div class="summary-row"><span>Items</span><strong>${quantity}</strong></div><div class="summary-row total"><span>Total</span><strong>&#x20b9;<fmt:formatNumber value="${totalPrice}" minFractionDigits="0" maxFractionDigits="2" groupingUsed="false" /></strong></div></aside>
<div class="checkout-left">
                <div class="address_form_agile mt-sm-5 mt-4">
                    <h4 class="mb-sm-4 mb-3">Billing Address</h4>
                    <form action="${pageContext.request.contextPath}/order/checkout" method="post" class="creditly-card-form agileinfo_form">
                        <div class="creditly-wrapper wthree, w3_agileits_wrapper">
                            <div class="information-wrapper">
                                <div class="first-row">
                                    <div class="controls form-group">
                                    <label class="col-form-label" for="field-customerName"><b>Your Name</b></label>
                                        <input id="field-customerName" class="billing-address-name form-control" type="text" name="customerName" value="${name}" required="required" />
                                    </div>
                                    <div class="w3_agileits_card_number_grids">
                                        <div class="w3_agileits_card_number_grid_left form-group">
                                            <div class="controls">
                                            <label class="col-form-label" for="txtPhone"><b>Phone Number</b></label>
                                                <input type="text" class="form-control" value="${phone}" maxlength="10" name="customerPhone" id="txtPhone" required="required" />
                                                <span id="spnPhoneStatus"></span>
                                            </div>
                                        </div>
                                        <div class="w3_agileits_card_number_grid_right form-group">
                                            <div class="controls">
                                            <label class="col-form-label" for="field-address"><b>Address</b></label>
                                                <textarea id="field-address" name="address" class="form-control" rows="4" cols="45" required="required">${address}</textarea>
                                            </div>
                                        </div>
                                        <div class="w3_agileits_card_number_grid_right form-group">
                                            <div class="controls">
                                            <label class="col-form-label" for="pinCode"><b>Pin Code</b> [As of now product delivery for pin code 400601 is available.]</label>
                                                <input type="text" class="form-control" value="400601" maxlength="6" id="pinCode" name="pinCode" required="required" />
                                                <span id="spnPinStatus"></span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="controls form-group">
                                    <label class="col-form-label" for="field-addressType"><b>Select Address Type</b></label>
                                        <select id="field-addressType" class="option-w3ls" name="addressType" required="required">
                                            <option>Home</option>
                                            <option>Office</option>
                                            <option>Commercial</option>
                                        </select>
                                    </div>
                                </div>
                                <div class="col-sm-12 text-left">
                     <input type="submit" id="submit" class="btn btn-success btn-md center-block" value="Buy" style="width: 100px;" />
                     &emsp;<input type="button" class="btn btn-danger reset" value="Clear" style="width: 100px;" />
                 </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            </c:if>
        </div>
    </div>
    <!-- //checkout page -->
    <div>
        <div>
        </div>
    </div>
</main>
<jsp:include page="layouts/cart-footer.jsp"></jsp:include>
<script type="text/javascript">
    $(document).ready(function(){
        $(".reset").click(function() {
        $(this).closest('form').find("input[type=text], textarea").val("");
        });
    });

    $(document).ready(function() {
        $('#txtPhone').blur(function(e) {
            if (validatePhone('txtPhone')) {

            }
            else {
                $('#spnPhoneStatus').html('Invalid Phone Number.');
                $('#spnPhoneStatus').css('color', 'red');
            }
        });
    });

    function validatePhone(txtPhone) {
        var a = document.getElementById(txtPhone).value;
        var filter = /^\d*(?:\.\d{1,2})?$/;
        if (filter.test(a)) {
            return true;
        }
        else {
            return false;
        }
    }

    $(document).ready(function() {
        $('#pinCode').blur(function(e) {
            if (validateCode('pinCode')) {
            }
            else {
                $('#spnPinStatus').html('Invalid Pin Code.');
                $('#spnPinStatus').css('color', 'red');
            }
        });
    });

    function validateCode(pinCode) {
        var p = document.getElementById(pinCode).value;
        var filter = /^\d*(?:\.\d{1,2})?$/;
        if (filter.test(p)) {
            return true;
        }
        else {
            return false;
        }
    }

    $(document).ready(function() {
        $('#submit').click(function(e) {
            var mobileNum = $("#txtPhone").val();
            var pinCode = $("#pinCode").val();
            var validateMobNum= /^\d*(?:\.\d{1,2})?$/;
            if (validateMobNum.test(mobileNum) && mobileNum.length == 10) {
                if (validateMobNum.test(pinCode) && pinCode.length == 6) {
                return true;
            }
            else {
                $('#spnPinStatus').html('Please Enter Valid Pin Code.');
                $('#spnPinStatus').css('color', 'red');
                e.preventDefault();
                return false;
            }
            }
            else {
                $('#spnPhoneStatus').html('Please Enter Valid Phone Number.');
                $('#spnPhoneStatus').css('color', 'red');
                e.preventDefault();
                return false;
            }
        });
    });
</script>
</body>
</html>