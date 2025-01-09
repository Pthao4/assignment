<%-- 
    Document   : manageProduct
    Created on : Oct 25, 2024, 9:53:33 PM
    Author     : thaon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<%@include file="header.jsp" %>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Manage Produtct</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <style>
        @media (max-width: 767.98px) {
            .border-sm-start-none {
                border-left: none !important;
            }
        }
    </style>
</head>
<body>
    <section>
        <div class="container py-5">
            <div class="row justify-content-center mb-3">
                <c:forEach items="${list}" var="o">
                    <div class="col-md-12 col-xl-10 mt-5">
                        <div class="card shadow-0 border rounded-3">
                            <div class="card-body">
                                <div class="row">
                                    <div class="col-md-12 col-lg-3 col-xl-3 mb-4 mb-lg-0">
                                        <div class="bg-image hover-zoom ripple rounded ripple-surface">
                                            <img src="${o.img}" class="w-100 h-100" />
                                        </div>
                                    </div>
                                    <div class="col-md-6 col-lg-6 col-xl-6 d-flex align-items-center">
                                        <h5>${o.name}</h5>
                                    </div>
                                    <div class="col-md-6 col-lg-3 col-xl-3 border-sm-start-none border-start">
                                        <div class="d-flex flex-row align-items-center mb-1 justify-content-center">
                                            <h4 class="mb-1 me-1 text-danger">${o.price}đ</h4>
                                        </div>
                                        <div class="d-flex flex-column mt-4">
                                            <button data-mdb-button-init data-mdb-ripple-init class="btn btn-primary btn-sm" type="button"><a href="manageproductedit?uid=${user.userName}&pid=${o.id}" class="text-decoration-none text-white">Edit</a></button>
                                            <button data-mdb-button-init data-mdb-ripple-init class="btn btn-outline-primary btn-sm mt-2" type="button" onclick="deleteProduct('${user.userName}', '${o.id}')">
                                                Delete
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
            <div class="text-center">
                <button type="button" class="btn btn-success" onclick="addProduct('${user.userName}')">Add New Product</button>
            </div>
        </div>
    </section>

    <script>
        function deleteProduct(uid, pid) {
            if (confirm("Delete this product?")) {
                window.location.href = "manageproductdelete?uid=" + uid+"&pid=" + pid;
            }
        }
        
        function addProduct(uid){
            window.loc ation.href = "manageproductadd?uid=" + uid;
        }
    </script>
</body>
</html>

<%@include file="footer.jsp" %>