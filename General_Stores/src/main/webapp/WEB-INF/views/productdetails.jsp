<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Pantrix | Product </title>
    <jsp:include page="layouts/header.jsp"></jsp:include>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/flexslider.css" type="text/css" media="screen" />
    <link href="${pageContext.request.contextPath}/css/theme.css" rel="stylesheet" type="text/css" />
</head>
<body class="grocery-app">
    <c:choose>
    <c:when test="${not empty email}">
        <jsp:include page="layouts/user-navigation.jsp"></jsp:include>
        <jsp:include page="layouts/user-menu.jsp"></jsp:include>
    </c:when>
    <c:otherwise>
        <jsp:include page="layouts/navigation-bar.jsp"></jsp:include>
        <jsp:include page="layouts/menu.jsp"></jsp:include>
    </c:otherwise>
</c:choose>
    <!-- banner-2 -->
    <div class="page-head_agile_info_w3l">

    </div>
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
                    <li>Product Details</li>
                </ul>
            </div>
        </div>
    </div>
    <!-- //page -->
    <!-- Single Page -->
    <div class="banner-bootom-w3-agileits py-5">
        <div class="container py-xl-4 py-lg-2">
            <!-- tittle heading -->
            <h3 class="tittle-w3l text-center mb-lg-5 mb-sm-4 mb-3">Product
                View</h3>
            <!-- //tittle heading -->
            <div class="row product-detail-layout">
                <div class="col-lg-5 col-md-8 single-right-left ">
                    <div class="grid images_3_of_2">
                        <div class="flexslider">
                        <div class="thumb-image">
                            <img loading="lazy" src="${pageContext.request.contextPath}${product.image}"
                         class="product-image img img-responsive img-fluid" alt="${product.name}">
                        </div>
                            <div class="clearfix"></div>
                        </div>
                    </div>
                </div>

                <div class="col-lg-7 single-right-left simpleCart_shelfItem">
                    <span class="eyebrow">Everyday pantry essentials</span><h3 class="mb-3">${product.name}</h3>
<c:if test="${product.mrpPrice > 0 and product.mrpPrice > product.price}"><span class="badge badge-deal mb-3"><fmt:formatNumber value="${(product.mrpPrice - product.price) * 100 / product.mrpPrice}" maxFractionDigits="0" />% off MRP</span></c:if>
                    <p class="mb-3">
                        <span class="item_price">&#x20b9;<fmt:formatNumber value="${product.price}" minFractionDigits="0" maxFractionDigits="2" groupingUsed="false" /></span>
                        <del>&#x20b9;<fmt:formatNumber value="${product.mrpPrice}" minFractionDigits="0" maxFractionDigits="2" groupingUsed="false" /></del>
                        <label>Free delivery</label>
                    </p>
                    <div class="product-single-w3l">
                        <p class="my-sm-4 my-3">
                            ${product.description}
                        </p>
                    </div>
                    <div class="single-infoagile">
                        <ul>
                            <li class="mb-3">
                                Cash on Delivery Eligible.
                            </li>
                            <li class="mb-3">
                                Shop your daily essentials with ease.
                            </li>
                        </ul>
                    </div>

                    <form action="#" method="post" class="detail-cart-form">
  <input type="hidden" name="cmd" value="_cart" />
  <input type="hidden" name="add" value="1" />
  <input type="hidden" name="item_id" value="${product.id}" />
  <input type="hidden" name="business" value=" " />
  <input type="hidden" name="item_name" value="${product.name}" />
  <input type="hidden" name="amount" value="${product.price}" />
  <input type="hidden" name="mrp" value="${product.mrpPrice}" />
  <input type="hidden" name="currency_code" value="INR" />
  <input type="hidden" name="return" value=" " />
  <input type="hidden" name="cancel_return" value=" " />
  <label for="detail-quantity">Quantity<input id="detail-quantity" type="number" name="quantity" min="1" step="1" value="1" required /></label>
  <input type="submit" class="btn btn-success" value="Add to cart" />
</form>
<div class="occasion-cart">
                        <div class="snipcart-details top_brand_home_details item_add single-item hvr-outline-out">
                            <form action="/cart/checkout" method="post">
                                <fieldset>
                                    <input type="hidden" name="code" value="${product.code}" />
                                    <input type="submit" name="submit" value="Checkout" class="button" />
                                </fieldset>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <jsp:include page="layouts/footer.jsp"></jsp:include>
    <!-- //Single Page -->
    <!-- imagezoom -->
    <script src="${pageContext.request.contextPath}/js/imagezoom.js"></script>
    <!-- //imagezoom -->
    <!-- flexslider -->
    <script src="${pageContext.request.contextPath}/js/jquery.flexslider.js"></script>
    <script>
        // Can also be used with $(document).ready()
        $(window).load(function () {
            $('.flexslider').flexslider({
                animation: "slide",
                controlNav: "thumbnails"
            });
        });
    </script>
    <!-- //FlexSlider-->
</body>
</html>