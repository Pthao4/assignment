
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@include file="header.jsp" %>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Product</title>
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container">
        <form action="manageproductedit" method="post" class="row g-3">
            <h2 class="mb-4 text-center text-success fw-bold" style="margin-top: 100px">Edit Product</h2>
            <input type="hidden" name="uid" value="${user.userName}">
            <input type="hidden" name="pid" value="${p.id}">
            <!-- Product Name -->
            <div class="col-md-6">
                <label for="ProductName" class="form-label">Product Name</label>
                <input type="text" class="form-control" id="ProductName" name="ProductName" value="${p.name}" required>
            </div>

            <!-- Unit Price -->
            <div class="col-md-6">
                <label for="UnitPrice" class="form-label">Unit Price</label>
                <input type="number" step="0.01" class="form-control" id="UnitPrice" name="UnitPrice" min="1" value="${p.price}" required>
            </div>
            
            <!-- Supplier ID -->
            <div class="col-md-6">
                <label for="SupplierID" class="form-label col-md-12">Supplier Name</label>
                <select id="SupplierID" name="SupplierID" class="col-md-12">
                    <c:forEach items="${slist}" var="o">
                        <option value="${o.id}" ${(p.supplier.id == o.id)?'selected':''}>${o.companyName}</option>
                    </c:forEach>
                </select>
            </div>

            <!-- Category ID -->
            <div class="col-md-6">
                <label for="CategoryID" class="form-label col-md-12">Category Name</label>
                <select id="CategoryID" name="CategoryID" class="col-md-12">
                    <c:forEach items="${clist}" var="o">
                        <option value="${o.id}" ${(p.category.id == o.id)?'selected':''}>${o.name}</option>
                    </c:forEach>
                </select>
            </div>

            

            <!-- Units In Stock -->
            <div class="col-md-6">
                <label for="UnitsInStock" class="form-label">Units In Stock</label>
                <input type="number" class="form-control" id="UnitsInStock" name="UnitsInStock" value="${p.inStock}"} required>
            </div>
            
            <!-- Image URL -->
            <div class="col-md-6">
                <label for="Image" class="form-label">Image URL</label>
                <input type="text" class="form-control" id="Image" name="Image" value="${p.img}" required>
            </div>

            <!-- Description -->
            <div class="col-12">
                <label for="Describe" class="form-label">Description</label>
                <textarea class="form-control" id="Describe" name="Describe" rows="4"  placeholder="Enter product description">${p.describe}</textarea>
            </div>

            <!-- Release Date -->
<!--            <div class="col-md-6">
                <label for="ReleaseDate" class="form-label">Release Date</label>
                <input type="date" class="form-control" id="ReleaseDate" name="ReleaseDate" required>
            </div>

             Status 
            <div class="col-md-6">
                <label for="Status" class="form-label">Status</label>
                <input type="text" class="form-control" id="Status" name="Status" placeholder="Enter product status" required>
            </div>-->

            <!-- Submit Button -->
            <div class="col-12 text-center">
                <button type="submit" class="btn btn-primary">Save Changes</button>
            </div>
        </form>
    </div>

    <!-- Bootstrap 5 JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

<%@include file="footer.jsp" %>

