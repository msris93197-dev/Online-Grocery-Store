<%-- Persistent customer navigation; a modal drawer below 1200px. --%>
<div class="sidebar-backdrop" hidden></div>
<aside id="app-sidebar" class="app-sidebar" aria-label="Shop navigation"><button class="shell-button drawer-close" type="button" aria-label="Close navigation">&times;</button><nav id="navbarSupportedContent">
<p class="nav-section">Shop</p>
<a href="${pageContext.request.contextPath}/home"><i class="fas fa-home" aria-hidden="true"></i><span>Home</span></a>
<a href="${pageContext.request.contextPath}/product/all"><i class="fas fa-th-large" aria-hidden="true"></i><span>All products</span></a>
<p class="nav-section">My Pantrix</p><jsp:include page="account-links.jsp"/>
<p class="nav-section">Help</p>
<a href="${pageContext.request.contextPath}/about"><i class="fas fa-info-circle" aria-hidden="true"></i><span>About</span></a>
<a href="${pageContext.request.contextPath}/contact"><i class="far fa-envelope" aria-hidden="true"></i><span>Contact us</span></a>
</nav></aside>