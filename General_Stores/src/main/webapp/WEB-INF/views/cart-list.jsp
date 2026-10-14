<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="en">
<head>
<c:if test="${empty email}">
    <c:redirect url="${pageContext.request.contextPath}/user/sign-in"/>
</c:if>
    <title>Grocket | My Cart</title>
    <jsp:include page="layouts/header.jsp"></jsp:include>
    <link href="https://cdn.datatables.net/1.10.20/css/dataTables.bootstrap4.min.css" rel="stylesheet">
    <style type="text/css">
#xx {
    display:none;
}
@media only screen and (max-width: 760px),
    (min-device-width: 768px) and (max-device-width: 1024px)  {
        p#mb {
            display: none;
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
}
    </style>
    <link href="${pageContext.request.contextPath}/css/theme.css" rel="stylesheet" type="text/css" />
</head>
<body class="grocery-app">
    <jsp:include page="layouts/user-navigation.jsp"></jsp:include>
    <jsp:include page="layouts/user-menu.jsp"></jsp:include>
    <!-- banner-2 -->
    <div class="page-head_agile_info_w3l"></div>
    <!-- //banner-2 -->
    <!-- page -->
    <div class="services-breadcrumb">
        <div class="agile_inner_breadcrumb">
            <div class="container">
                <ul class="w3_short">
                    <li>
                        <a href="${pageContext.request.contextPath}/home">Home</a>
                        <i>|</i>
                    </li>
                    <li>My Cart</li>
                </ul>
            </div>
        </div>
    </div>
    <!-- //page -->
    <!-- checkout page -->
    <div class="privacy py-sm-5 py-4">
        <div class="container py-xl-4 py-lg-2">
            <!-- tittle heading -->
            <h3 class="tittle-w3l text-center mb-lg-5 mb-sm-4 mb-3">My Cart</h3>
            <c:if test="${empty items}">
                <div class="alert alert-info alert-dismissible fade show text-center">
                    There is no item(s) in your Cart.
                    &nbsp;<a href="${pageContext.request.contextPath}/home" class="btn btn-success text-right">Shop Now</a>
                    <button type="button" class="close" aria-label="Dismiss message" data-dismiss="alert">&times;</button>
                </div>
            </c:if>
<%-- 			<a href="${pageContext.request.contextPath}/home" class="btn btn-success text-right">Continue Shopping</a> --%>
            <c:if test="${not empty delete}">
                <div class="alert alert-success alert-dismissible fade show text-center">
                    Item removed successfully.
                    <button type="button" class="close" aria-label="Dismiss message" data-dismiss="alert">&times;</button>
                </div>
            </c:if>
            <c:if test="${not empty error}">
                <div class="alert alert-danger alert-dismissible fade show text-center">
                    Oops! Something Went Wrong!!!
                    <button type="button" class="close" aria-label="Dismiss message" data-dismiss="alert">&times;</button>
                </div>
            </c:if>
    <c:if test="${not empty items}">
            <div class="checkout-left">
                <div class="address_form_agile mt-sm-5 mt-4">
                <form action="${pageContext.request.contextPath}/cart/order/checkout" method="post" class="creditly-card-form agileinfo_form">
                    <div class="creditly-wrapper wthree, w3_agileits_wrapper">
            <div class="container">
            <div class="table-responsive"><br>
    <p id="mb">Slide Right to see full table.</p>
    <table id="example" class="responsive-table table table-hover table-bordered text-center">
      <thead>
        <tr>
          <th scope="col">SR. No.
<!--           &nbsp;<input type="checkbox" class="form-check-input checks" name="numbers[]" id="ckbCheckAll"> -->
          </th>
          <th scope="col">Item</th>
          <th scope="col">Quantity</th>
          <th scope="col">MRP(&#x20b9;)</th>
          <th scope="col">Selling Price(&#x20b9;)</th>
          <th scope="col">Total Price(&#x20b9;)</th>
          <th scope="col">Action</th>
        </tr>
      </thead>
      <tbody>
      <c:set var="count" value="0" scope="page"/>
      <c:forEach var="item" items="${items}">
       <c:set var="count" value="${count + 1}" scope="page"/>
        <tr>
          <td data-label="SR. No."><div class="cell-value">${count}
<!-- 		  &emsp;&ensp;<input type="checkbox" class="form-check-input checks" name="number[]" value="" id=""> -->
          </div></td>
          <td data-label="Item"><div class="cell-value"><a href="${pageContext.request.contextPath}/product/productdetails?code=${item.product.code}" target="_blank">
          <img loading="lazy" alt="${item.product.name}" src="${pageContext.request.contextPath}${item.product.image}" width="70" height="90" class="product-image img-fluid" /></a>
          <br>${item.product.name}</div></td>
          <td class="quantity" data-label="Quantity"><div class="cell-value">${item.quantity}</div></td>
          <td class="mrp_price" data-label="MRP(&#x20b9;)"><div class="cell-value"><del><fmt:formatNumber value="${item.mrpPrice}" minFractionDigits="0" maxFractionDigits="2" groupingUsed="false" /></del></div></td>
          <td class="price" data-label="Selling Price(&#x20b9;)"><div class="cell-value"><fmt:formatNumber value="${item.price}" minFractionDigits="0" maxFractionDigits="2" groupingUsed="false" /></div></td>
          <td class="amount" data-label="Total Price(&#x20b9;)"><div class="cell-value"><fmt:formatNumber value="${item.totalPrice}" minFractionDigits="0" maxFractionDigits="2" groupingUsed="false" /></div></td>
          <td data-label="Action"><div class="cell-value"><a href="${pageContext.request.contextPath}/cart/remove/${item.id}" style="font-size:35px;color:var(--primary);" onclick="return confirm('Are you sure you want to remove this item from cart?');" aria-label="Remove item"><i class="far fa-times-circle"></i></a><c:set var="size" value="${fn:length(items)}" scope="session" />
        <input type="text" class="cart-data-input" hidden name="pid_${count}" value="${item.product.id}" required="required"/>
        <input type="text" class="cart-data-input" hidden name="quantity_${count}" value="${item.quantity}" required="required"/>
        <input type="text" class="cart-data-input" hidden name="amount_${count}" value="${item.price}" required="required"/>
        <input type="text" class="cart-data-input" hidden name="mrp_${count}" value="${item.mrpPrice}" required="required"/>
        <input type="text" class="cart-data-input" hidden name="code_${count}" value="${item.product.code}" required="required"/>
        <input type="text" class="cart-data-input" hidden name="pname_${count}" value="${item.product.name}" required="required"/>
        <input type="text" class="cart-data-input" hidden name="total_amount_${count}" value="${item.totalPrice}" required="required"/>
        <input type="text" class="cart-data-input" hidden name="cid_${count}" value="${item.id}" required="required"/>
</div></td>
</tr>
        </c:forEach>
      </tbody>
      <tfoot style="background-color:white;">
          <tr>
              <td data-label="SR. No."><div class="cell-value"><b>Total</b></div></td>
              <td data-label="Item"><div class="cell-value"></div></td>
              <td data-label="Quantity"><div class="cell-value"><b>${total_qty}</b></div></td>
              <td data-label="MRP(&#x20b9;)"><div class="cell-value"><b>&#x20b9;<fmt:formatNumber value="${total_mrp}" minFractionDigits="0" maxFractionDigits="2" groupingUsed="false" /></b></div></td>
              <td data-label="Selling Price(&#x20b9;)"><div class="cell-value"></div></td>
              <td data-label="Total Price(&#x20b9;)"><div class="cell-value"><b>&#x20b9;<fmt:formatNumber value="${total_price}" minFractionDigits="0" maxFractionDigits="2" groupingUsed="false" /></b></div></td>
<td data-label="Action"><div class="cell-value">
<button type="button" class="btn btn-primary">
  Total Savings: <span class="badge badge-light">&#x20b9;<fmt:formatNumber value="${total_saving}" minFractionDigits="0" maxFractionDigits="2" groupingUsed="false" /></span>
</button>
</div></td>
          </tr>
      </tfoot>
    </table>
    </div>
            </div><hr>
            <aside class="summary-card" aria-label="Basket summary"><h4>Basket summary</h4><div class="summary-row"><span>Items</span><strong>${total_qty}</strong></div><div class="summary-row"><span>Your savings</span><strong>&#x20b9;<fmt:formatNumber value="${total_saving}" minFractionDigits="0" maxFractionDigits="2" groupingUsed="false" /></strong></div><div class="summary-row total"><span>Total</span><strong>&#x20b9;<fmt:formatNumber value="${total_price}" minFractionDigits="0" maxFractionDigits="2" groupingUsed="false" /></strong></div></aside>
<div class="information-wrapper"><br>
            <h4 class="mb-sm-4 mb-3">Billing Address</h4>
            <h5 class="mb-sm-4 mb-3 text-danger" style="font-weight: bold;">Note: As of now Cash on Delivery payment mode is available.</h5>
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
                                            <label class="col-form-label" for="pinCode"><b>Pin Code</b></label>
                                                <input type="text" class="form-control" value="${pinCode}" maxlength="6" id="pinCode" name="pinCode" required="required" />
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
<!-- 									<input type="hidden" name="paymentMode" /> -->

                                    <div class="controls form-group">
                                    <label class="col-form-label" for="field-paymentMode"><b>Select Payment Mode</b></label>
                                        <select id="field-paymentMode" class="option-w3ls" name="paymentMode" required="required">
                                            <option>COD</option>
                                            <option selected="selected">Grocket Wallet</option>
                                            <option disabled="disabled">Debit Card</option>
                                            <option disabled="disabled">Online Banking</option>
                                            <option disabled="disabled">UPI Id</option>
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
<jsp:include page="layouts/cart-footer.jsp"></jsp:include>
    <!-- Bootstrap core JavaScript-->
<!-- Page level plugin JavaScript-->
<script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.20/js/dataTables.bootstrap4.min.js"></script>
    <!--quantity-->
    <script>
    $(document).ready(function() {
        $('#example').dataTable( {
            //"bInfo" : false,
            //"lengthChange": false,
            paging: false,
        bFilter: false,
        ordering: false,
        searching: true,
        dom: 't'         // This shows just the table

            //language: { search: '', searchPlaceholder: "Search..." }
        } );
        //var x=$("#").val();
// 	    $("#ckbCheckAll").click(function () {
// 	        $(".form-check-input").prop('checked', $(this).prop('checked'));
// 	    });

// 	    $(".checkBoxCform-check-inputlass").change(function(){
// 	        if (!$(this).prop("checked")){
// 	            $("#ckbCheckAll").prop("checked",false);
// 	        }
// 	    });
    $(".reset").click(function() {
                //$(".creditly-card-form")[0].reset();
    $(this).closest('form').find("input[type=text], textarea").val("");
            });
           } );
    </script>
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