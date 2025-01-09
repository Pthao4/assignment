
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@include file="header.jsp" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Product</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
    </head>
    <body>
        <div class="container">
            <form action="manageproductadd" method="post" class="row g-3">
                <h2 class="mb-4 text-center text-success fw-bold" style="margin-top: 100px">Add Product</h2>
                <input type="hidden" name="uid" value="${user.userName}">
                <!-- Product Name -->
                <div class="col-md-6">
                    <label for="ProductName" class="form-label">Product Name</label>
                    <input type="text" class="form-control" id="ProductName" name="ProductName" value="" required>
                </div>

                <!-- Unit Price -->
                <div class="col-md-6">
                    <label for="UnitPrice" class="form-label">Unit Price</label>
                    <input type="number" step="0.01" class="form-control" id="UnitPrice" name="UnitPrice" value="" required>
                </div>

                <!-- Supplier ID -->
                <div class="col-md-6">
                    <label for="SupplierID" class="form-label col-md-12">Supplier Name</label>
                    <select id="SupplierID" name="SupplierID" class="col-md-12">
                        <c:forEach items="${slist}" var="o">
                            <option value="${o.id}">${o.companyName}</option>
                        </c:forEach>
                    </select>
                </div>

                <!-- Category ID -->
                <div class="col-md-6">
                    <label for="CategoryID" class="form-label col-md-12">Category Name</label>
                    <select id="CategoryID" name="CategoryID" class="col-md-12">
                        <c:forEach items="${clist}" var="o">
                            <option value="${o.id}">${o.name}</option>
                        </c:forEach>
                    </select>
                </div>



                <!-- Units In Stock -->
                <div class="col-md-6">
                    <label for="UnitsInStock" class="form-label">Units In Stock</label>
                    <input type="number" class="form-control" id="UnitsInStock" name="UnitsInStock" value="" required>
                </div>

                <!-- Image URL -->
                <div class="col-md-6">
                    <label for="Image" class="form-label">Image URL</label>
                    <input type="text" class="form-control" id="Image" name="Image" value="" required>
                </div>

                <!-- Description -->
                <div class="col-12">
                    <label for="Describe" class="form-label">Description</label>
                    <textarea class="form-control" id="Describe" name="Describe" rows="4"  placeholder="Enter product description"></textarea>
                </div>

                <!-- Submit Button -->
                <div class="col-12 text-center p-2">
                    <button type="submit" class="btn btn-success px-4 px-5">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-plus-circle" viewBox="0 0 16 16">
                        <path d="M8 15A7 7 0 1 1 8 1a7 7 0 0 1 0 14m0 1A8 8 0 1 0 8 0a8 8 0 0 0 0 16"></path>
                        <path d="M8 4a.5.5 0 0 1 .5.5v3h3a.5.5 0 0 1 0 1h-3v3a.5.5 0 0 1-1 0v-3h-3a.5.5 0 0 1 0-1h3v-3A.5.5 0 0 1 8 4"></path>
                        </svg>
                        Add
                    </button>
                </div>
            </form>
        </div>
    </body>
</html>

<%@include file="footer.jsp" %>