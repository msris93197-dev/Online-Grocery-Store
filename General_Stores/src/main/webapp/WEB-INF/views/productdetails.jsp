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
<jsp:include page="layouts/app-header.jsp"/>
<jsp:include page="layouts/app-sidebar.jsp"/>
<main id="main-content" class="app-main" tabindex="-1">
<jsp:include page="layouts/page-header.jsp">
<jsp:param name="title" value="Product details"/>
<jsp:param name="crumb" value="${product.name}"/>
<jsp:param name="root" value="Home"/>
<jsp:param name="rootUrl" value="/home"/>
<jsp:param name="parent" value="All products"/>
<jsp:param name="parentUrl" value="/product/all"/>
<jsp:param name="back" value="true"/>
<jsp:param name="step" value=""/>
</jsp:include>

<section class="product-detail-layout detail-stage-layout">
<div class="detail-image-stage image-tile"><img width="139" height="139" src="${pageContext.request.contextPath}${product.image}" class="product-image" alt="${product.name}"></div>
<div class="detail-info"><span class="eyebrow">Everyday pantry essentials</span><h2><c:out value="${product.name}"/></h2><p><c:out value="${product.description}"/></p>
<div class="detail-price"><span class="item_price">&#8377;<fmt:formatNumber value="${product.price}" maxFractionDigits="2" groupingUsed="false"/></span> <del>&#8377;<fmt:formatNumber value="${product.mrpPrice}" maxFractionDigits="2" groupingUsed="false"/></del></div>
<c:if test="${product.mrpPrice > product.price and product.mrpPrice > 0}"><p class="detail-saving">You save &#8377;<fmt:formatNumber value="${product.mrpPrice-product.price}" maxFractionDigits="2"/> (<fmt:formatNumber value="${(product.mrpPrice-product.price)*100/product.mrpPrice}" maxFractionDigits="0"/>%)</p></c:if>
<div class="assurance-chips"><span><i class="fas fa-money-bill-wave" aria-hidden="true"></i> Cash on delivery eligible</span><span><i class="fas fa-truck" aria-hidden="true"></i> Free delivery</span></div>
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
  <label for="detail-quantity">Quantity</label><div class="quantity-stepper"><button type="button" data-quantity-step="-1" aria-label="Decrease quantity">&#8722;</button><input id="detail-quantity" type="number" name="quantity" min="1" step="1" value="1" required /><button type="button" data-quantity-step="1" aria-label="Increase quantity">+</button></div>
  <div class="detail-primary-action"><strong class="mobile-action-price">&#8377;<fmt:formatNumber value="${product.price}" maxFractionDigits="2"/></strong><input type="submit" class="btn btn-success" value="Add to cart" /></div>
</form>
<div class="detail-checkout"><form action="/cart/checkout" method="post">
                                <fieldset>
                                    <input type="hidden" name="code" value="${product.code}" />
                                    <input type="submit" name="submit" value="Checkout" class="button" />
                                </fieldset>
                            </form></div>
</div></section>
</main>
<jsp:include page="layouts/footer.jsp"></jsp:include>
</body>
</html>