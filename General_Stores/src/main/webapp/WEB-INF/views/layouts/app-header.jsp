<%-- Customer top bar: brand, search, account shortcuts and minicart. --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<a class="skip-link" href="#main-content">Skip to content</a>
<header class="app-topbar">
<button type="button" class="shell-button sidebar-toggle" aria-label="Toggle navigation" aria-controls="app-sidebar" aria-expanded="false"><i class="fas fa-bars" aria-hidden="true"></i></button>
<a class="app-brand" href="${pageContext.request.contextPath}/home"><i class="fas fa-shopping-basket" aria-hidden="true"></i> Pantrix</a>
<form class="shell-search" action="/product/search" method="post"><input type="search" name="keyword" aria-label="Search products" placeholder="Search your pantry" required><button type="submit">Search</button></form>
<div class="profile-control"><button type="button" class="shell-button profile-toggle" aria-expanded="false" aria-controls="profile-links"><i class="far fa-user" aria-hidden="true"></i><span><c:choose><c:when test="${not empty email}"><c:out value="${name}"/></c:when><c:otherwise>Account</c:otherwise></c:choose></span><i class="fas fa-chevron-down" aria-hidden="true"></i></button><div id="profile-links" class="profile-links" hidden><jsp:include page="account-links.jsp"/></div></div>
<form action="#" method="post" class="shell-cart-form last"><input type="hidden" name="cmd" value="_cart"><input type="hidden" name="display" value="1"><button class="shell-button shell-cart" type="submit" name="submit" value="" data-open-cart aria-label="Open shopping basket"><i class="fas fa-shopping-basket" aria-hidden="true"></i><span class="cart-count" data-cart-count>0</span></button></form>
</header>