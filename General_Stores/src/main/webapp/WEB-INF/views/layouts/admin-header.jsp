<%-- Administrator top bar and account dropdown. --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<a class="skip-link" href="#main-content">Skip to content</a>
<header class="app-topbar admin-topbar">
<button type="button" class="shell-button sidebar-toggle" aria-label="Toggle navigation" aria-controls="app-sidebar" aria-expanded="false"><i class="fas fa-bars" aria-hidden="true"></i></button>
<a class="app-brand" href="${pageContext.request.contextPath}/admin/home"><i class="fas fa-shopping-basket" aria-hidden="true"></i> Pantrix <small>Admin</small></a>
<div class="profile-control"><button type="button" class="shell-button profile-toggle" aria-expanded="false" aria-controls="profile-links"><i class="far fa-user" aria-hidden="true"></i><span><c:out value="${empty aname ? 'Admin account' : aname}"/></span><i class="fas fa-chevron-down" aria-hidden="true"></i></button><div id="profile-links" class="profile-links" hidden><jsp:include page="admin-account-links.jsp"/></div></div>
</header>