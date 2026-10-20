<%-- Shared customer account shortcuts for the sidebar and profile dropdown. --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:choose><c:when test="${not empty email}">
<a href="${pageContext.request.contextPath}/cart/my-cart"><i class="fas fa-shopping-basket" aria-hidden="true"></i><span>My cart</span></a>
<a href="${pageContext.request.contextPath}/orders/my-orders"><i class="fas fa-box" aria-hidden="true"></i><span>My orders</span></a>
<a href="${pageContext.request.contextPath}/customer/my-account"><i class="far fa-user" aria-hidden="true"></i><span>My account</span></a>
<a href="${pageContext.request.contextPath}/customer/changepassword"><i class="fas fa-key" aria-hidden="true"></i><span>Change password</span></a>
<a href="${pageContext.request.contextPath}/customer/logout"><i class="fas fa-sign-out-alt" aria-hidden="true"></i><span>Logout</span></a>
</c:when><c:otherwise>
<a href="${pageContext.request.contextPath}/customer/login"><i class="far fa-user" aria-hidden="true"></i><span>Login</span></a>
<a href="${pageContext.request.contextPath}/customer/register"><i class="fas fa-user-plus" aria-hidden="true"></i><span>Register</span></a>
</c:otherwise></c:choose>