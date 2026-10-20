<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Pantrix | Logout </title>
    <jsp:include page="layouts/header.jsp"></jsp:include>
    <script src="${pageContext.request.contextPath}/js/backNoWork.js"></script>
    <link href="${pageContext.request.contextPath}/css/theme.css" rel="stylesheet" type="text/css" />
</head>
<body class="grocery-app admin-page">
<jsp:include page="layouts/admin-header.jsp"/>
<jsp:include page="layouts/admin-sidebar.jsp"/>
<main id="main-content" class="app-main" tabindex="-1">
<jsp:include page="layouts/page-header.jsp">
<jsp:param name="title" value="Signed out"/>
<jsp:param name="root" value="Admin"/>
<jsp:param name="rootUrl" value="/admin/home"/>
<jsp:param name="parent" value=""/>
<jsp:param name="parentUrl" value="/admin/home"/>
<jsp:param name="back" value="false"/>
<jsp:param name="step" value=""/>
</jsp:include>
<br>
    <div class="col-12 text-center">
            <div>
                <h5 class="subtitle">You have been logged-out successfully.</h5>
            </div>
        </div>
    </main>
<jsp:include page="layouts/footer.jsp"></jsp:include>
</body>
</html>