<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
<c:if test="${empty email}">
    <c:redirect url="${pageContext.request.contextPath}/user/sign-in"/>
</c:if>
    <title>Pantrix | My Account </title>
    <jsp:include page="layouts/header.jsp"></jsp:include>
    <link href="${pageContext.request.contextPath}/css/theme.css" rel="stylesheet" type="text/css" />
</head>
<body class="grocery-app account-page">
<jsp:include page="layouts/app-header.jsp"/>
<jsp:include page="layouts/app-sidebar.jsp"/>
<main id="main-content" class="app-main" tabindex="-1">
<jsp:include page="layouts/page-header.jsp">
<jsp:param name="title" value="My account"/>
<jsp:param name="subtitle" value="Manage your profile and delivery details."/>
<jsp:param name="root" value="Home"/>
<jsp:param name="rootUrl" value="/home"/>
<jsp:param name="parent" value=""/>
<jsp:param name="parentUrl" value="/home"/>
<jsp:param name="back" value="true"/>
<jsp:param name="step" value=""/>
</jsp:include>
<!-- log in -->
    <br>
<!-- register -->
    <div class="contact py-sm-5 py-4">
        <div class="container py-xl-4 py-lg-2">

        <c:if test="${not empty success}">
            <div class="alert alert-success alert-dismissible fade show">
                Account Updated Successfully.
                <button type="button" class="close" aria-label="Dismiss message" data-dismiss="alert">&times;</button>
            </div>
        </c:if>
        <c:if test="${not empty error}">
            <div class="alert alert-danger alert-dismissible fade show">
                Something went wrong.
                <button type="button" class="close" aria-label="Dismiss message" data-dismiss="alert">&times;</button>
            </div>
        </c:if>
        <!-- form -->
            <form:form action="${pageContext.request.contextPath}/customer/updateCustomer" modelAttribute="customerUpdate" method="post">
                <div class="contact-grids1 w3agile-6">
                    <div class="row">
                    <form:hidden path="id"/>
                        <div class="col-md-6 col-sm-6 contact-form1 form-group">
                            <label class="col-form-label" for="field-name">Your Name</label>
                            <form:input id="field-name" path="name" class="form-control" placeholder="Name" name="Name" value="${customer.name}" required="required" />
                            <form:errors path="name" cssStyle="color:var(--danger);" cssClass="error"/>
                        </div>
                            <div class="col-md-6 col-sm-6 contact-form1 form-group">
                                <label class="col-form-label" for="field-phone">Phone</label>
                                <form:input id="field-phone" path="phone" class="form-control" value="${customer.phone}" maxlength="10" minlength="10" placeholder="Phone" name="phone" required="required" />
                                <form:errors path="phone" cssStyle="color:var(--danger);" cssClass="error"/>
                            </div>
<%-- 						<c:out value="Hello == ${gender}" /> --%>
                        <c:if test="${gender == 'Male'}">
                            <div class="col-md-6 col-sm-6 contact-form1 form-group">
                            <label class="col-form-label" for="field-gender">Gender</label>
                            <form:select id="field-gender" path="gender" name="gender" class="form-control" require="required">
                                <form:option value="Male" selected="selected">Male</form:option>
                                <form:option value="Female">Female</form:option>
                            </form:select>
                            <form:errors path="gender" cssStyle="color:var(--danger);" cssClass="error"/>
                        </div>
                        </c:if>
                        <c:if test="${gender == 'Female'}">
                            <div class="col-md-6 col-sm-6 contact-form1 form-group">
                            <label class="col-form-label" for="field-gender">Gender</label>
                            <form:select id="field-gender" path="gender" name="gender" class="form-control" require="required">
                                <form:option value="Male">Male</form:option>
                                <form:option value="Female" selected="selected">Female</form:option>
                            </form:select>
                            <form:errors path="gender" cssStyle="color:var(--danger);" cssClass="error"/>
                            </div>
                        </c:if>
                        <div class="col-md-6 col-sm-6 contact-form1 form-group">
                                <label class="col-form-label" for="field-pinCode">Pin Code</label>
                                <form:input id="field-pinCode" path="pinCode" class="form-control" value="${customer.pinCode}" maxlength="6" placeholder="Pin Code" name="pin" required="required" />
                                <form:errors path="pinCode" cssStyle="color:var(--danger);" cssClass="error"/>
                            </div>
                        <div class="col-md-6 col-sm-6 contact-form1 form-group">
                            <label class="col-form-label" for="field-address">Address</label>
                            <form:textarea id="field-address" path="address" class="form-control" value="${customer.address}" placeholder="Address" rows="4" cols="45" name="address" required="required"></form:textarea>
                            <form:errors path="address" cssStyle="color:var(--danger);" cssClass="error"/>
                        </div>
                    </div>
                    <div class="right-w3l col-md-6">
                        <input type="submit" class="form-control" value="Save">
                    </div>
                </div>
            </form:form>
            <!-- //form -->
        </div>
    </div>
    </main>
<jsp:include page="layouts/footer.jsp"></jsp:include>
</body>
</html>