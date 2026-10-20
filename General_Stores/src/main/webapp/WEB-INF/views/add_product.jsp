<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Pantrix | Add Product </title>
    <jsp:include page="layouts/header.jsp"></jsp:include>
    <link href="${pageContext.request.contextPath}/css/theme.css" rel="stylesheet" type="text/css" />
</head>
<body class="grocery-app admin-page product-editor">
<jsp:include page="layouts/admin-header.jsp"/>
<jsp:include page="layouts/admin-sidebar.jsp"/>
<main id="main-content" class="app-main" tabindex="-1">
<jsp:include page="layouts/page-header.jsp">
<jsp:param name="title" value="Add product"/>
<jsp:param name="subtitle" value="Add an everyday essential to your catalogue."/>
<jsp:param name="root" value="Admin"/>
<jsp:param name="rootUrl" value="/admin/home"/>
<jsp:param name="parent" value="Catalogue"/>
<jsp:param name="parentUrl" value="/admin/product/view"/>
<jsp:param name="back" value="true"/>
<jsp:param name="step" value=""/>
</jsp:include>
<!-- log in -->
    <br>
    <div class="alert alert-info alert-dismissible fade show text-center">
            Use a clear product image on a white background. Images are displayed at their original size.
            </div>
<!-- register -->
    <div class="contact py-sm-5 py-4">
        <div class="container py-xl-4 py-lg-2">

        <!-- form -->

            <div class="alert alert-success alert-dismissible fade show text-center" id="success" style="display:none;"></div>
            <div class="alert alert-danger alert-dismissible fade show text-center" id="error" style="display:none;"></div>
        <form id="form">
                <div class="contact-grids1 w3agile-6">
                    <div class="row">
                        <div class="col-md-6 col-sm-6 contact-form1 form-group">
                            <label class="col-form-label" for="name">Name</label>
                            <input type="text" class="form-control" placeholder="Product Name" id="name" name="name" required="required">
                            <p id="error_name"></p>
                        </div>
                        <div class="col-md-6 col-sm-6 contact-form1 form-group">
                            <label class="col-form-label" for="description">Description</label>
                            <textarea class="form-control" placeholder="Product Description" id="description" rows="3" cols="45" name="description" required="required"></textarea>
                            <p id="error_description"></p>
                        </div>
                        <div class="col-md-6 col-sm-6 contact-form1 form-group">
                            <label class="col-form-label" for="image">Image</label>
                            <input type="file" class="form-control" placeholder="" name="image" id="image" required="required">
                            <p id="error_file"></p>
                        </div>
                        <div class="col-md-6 col-sm-6 contact-form1 form-group">
                            <label class="col-form-label" for="mrp_price">MRP Price</label>
                            <input type="text" class="form-control" placeholder="MRP Price" name="mrp_price" id="mrp_price" required="required">
                            <p id="error_mrp_price"></p>
                        </div>
                        <div class="col-md-6 col-sm-6 contact-form1 form-group">
                            <label class="col-form-label" for="price">Price</label>
                            <input type="text" class="form-control" placeholder="Price" name="price" id="price" required="required">
                            <p id="error_price"></p>
                        </div>
                        <div class="col-md-6 col-sm-6 contact-form1 form-group">
                            <label class="col-form-label" for="active">Status</label>
                            <select name="active" id="active" class="form-control">
                                <option value="true" selected="selected">Active</option>
                                <option value="false">In-Active</option>
                            </select>
                            <p id="error_active"></p>
                        </div>
                    </div>
                        <div class="right-w3l col-md-6">
                            <input type="button" style="background-color: var(--primary);" id="submit" class="btn btn-primary form-control" value="Submit">
                        </div>
                </div>
            </form>
            <!-- //form -->
  <p class="text-center">
  <img src="${pageContext.request.contextPath}/images/loader.gif" alt="loader" style="width: 150px;height: 120px;" id="loader">
  </p>
        </div>
    </div>

    </main>
<jsp:include page="layouts/footer.jsp"></jsp:include>
    <script src="${pageContext.request.contextPath}/js/product.js"></script>
</body>
</html>