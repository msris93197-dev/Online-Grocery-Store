<%-- Shared catalogue card. The image and name are one link; cart actions remain independent. --%>
<%@ tag pageEncoding="ISO-8859-1" body-content="empty"%>
<%@ attribute name="product" required="true" type="java.lang.Object"%>
<%@ attribute name="includeMrp" required="false" type="java.lang.Boolean"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<c:url var="detailsUrl" value="/product/productdetails"><c:param name="code" value="${product.code}"/></c:url>
<div class="product-men"><article class="men-pro-item simpleCart_shelfItem pantry-card">
<a class="product-primary-link" href="${detailsUrl}"><div class="men-thumb-item image-tile">
<c:if test="${product.mrpPrice > 0 and product.mrpPrice > product.price}"><span class="discount-badge"><fmt:formatNumber value="${(product.mrpPrice-product.price)*100/product.mrpPrice}" maxFractionDigits="0"/>% off</span></c:if>
<img loading="lazy" width="139" height="139" alt="" src="${pageContext.request.contextPath}${product.image}" class="product-image">
</div><h2 class="card-product-name"><c:out value="${product.name}"/></h2></a>
<div class="info-product-price"><span class="item_price">&#8377;<fmt:formatNumber value="${product.price}" maxFractionDigits="2" groupingUsed="false"/></span> <del>&#8377;<fmt:formatNumber value="${product.mrpPrice}" maxFractionDigits="2" groupingUsed="false"/></del></div>
<div class="snipcart-details item_add single-item">
<form action="#" method="post"><fieldset>
<input type="hidden" name="cmd" value="_cart"/>
<input type="hidden" name="add" value="1"/>
<input type="hidden" name="item_id" value="${product.id}"/>
<input type="hidden" name="business" value=" "/>
<input type="hidden" name="item_name" value="${product.name}"/>
<input type="hidden" name="amount" value="${product.price}"/>
<c:if test="${includeMrp != false}"><input type="hidden" name="mrp" value="${product.mrpPrice}"/></c:if>
<input type="hidden" name="currency_code" value="INR"/>
<input type="hidden" name="return" value=" "/>
<input type="hidden" name="cancel_return" value=" "/>
<div class="card-actions"><input type="submit" class="btn btn-primary" value="Add to Cart"/><a class="btn btn-danger" href="${detailsUrl}">Buy Now</a></div>
</fieldset></form></div>
</article></div>