<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="ISO-8859-1">
<title>Pantrix | Product details</title>
<jsp:include page="layouts/header.jsp"></jsp:include>
    <link href="${pageContext.request.contextPath}/css/theme.css" rel="stylesheet" type="text/css" />
</head>
<body class="grocery-app">
<jsp:include page="layouts/menu.jsp"></jsp:include>
<div class="fourzerofour"><h2>Explore everyday essentials</h2><p>Find your next favourite in our grocery collection.</p><a class="btn btn-success" href="${pageContext.request.contextPath}/product/all">Browse products</a></div>
<jsp:include page="layouts/footer.jsp"></jsp:include>

</body>
</html>