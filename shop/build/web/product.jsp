<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@include file="header.jsp" %>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <title>All Product</title>
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <style>
            /* General Styles */
            body {
                font-family: 'Roboto', sans-serif;
                background-color: #f8f9fa;
            }

            h4 {
                font-size: 1.75rem;
                font-weight: bold;
                color: #28a745;
            }


            .navbar-brand {
                color: #fff;
                font-size: 1.5rem;
                font-weight: bold;
            }

            .navbar-brand:hover {
                color: #f8f9fa;
            }

            .navbar-nav .nav-link {
                color: #fff;
                font-weight: 500;
                margin-right: 20px;
            }

            .navbar-nav .nav-link:hover {
                color: #e9ecef;
            }

            /* Sidebar Styles */
            .sidebar {
                background-color: #f8f9fa;
                padding: 15px;
                border: 1px solid #ddd;
                border-radius: 8px;
                box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            }

            .sidebar h4 {
                font-size: 1.5rem;
                color: #333;
            }

            .sidebar ul li {
                margin-bottom: 10px;
            }

            .sidebar ul li a {
                color: #28a745;
                font-size: 1.1rem;
                text-decoration: none;
                transition: all 0.3s;
            }

            .sidebar ul li a:hover {
                color: #218838;
            }

            /* Product Item Styles */
            .fruite-item {
                background-color: #fff;
                border: 1px solid #ddd;
                transition: transform 0.3s ease, box-shadow 0.3s ease;
                display: flex;
                flex-direction: column;
                justify-content: space-between;
                height: 100%;
                border-radius: 8px;
            }

            .fruite-item:hover {
                transform: translateY(-10px);
                box-shadow: 0 8px 16px rgba(0, 0, 0, 0.15);
            }

            .fruite-img {
                height: 250px;
                overflow: hidden;
                border-bottom: 1px solid #ddd;
                border-radius: 8px 8px 0 0;
            }

            .fruite-img img {
                object-fit: cover;
                height: 100%;
                width: 100%;
                transition: transform 0.3s ease;
            }

            .fruite-item:hover .fruite-img img {
                transform: scale(1.1);
            }

            .content-wrapper {
                padding: 20px;
                text-align: center;
            }

            .content-wrapper h4 {
                font-size: 1.25rem;
                color: #333;
            }

            .content-wrapper p.price {
                font-size: 1.4rem;
                color: #28a745;
                font-weight: bold;
                margin: 10px 0;
            }

            .content-wrapper a.btn {
                background-color: #28a745;
                color: white;
                padding: 10px 25px;
                border-radius: 30px;
                font-weight: bold;
                font-size: 1rem;
                transition: background-color 0.3s;
            }

            .content-wrapper a.btn:hover {
                background-color: #218838;
            }

            /* Pagination Styles */
            .pagination {
                margin-top: 20px;
            }

            .pagination .page-link {
                color: #28a745;
                padding: 10px 18px;
                border: 1px solid #28a745;
                transition: background-color 0.3s, color 0.3s;
            }

            .pagination .page-item.active .page-link {
                background-color: #28a745;
                color: white;
                border-color: #28a745;
            }

            .pagination .page-item .page-link:hover {
                background-color: #218838;
                color: white;
            }

            .pagination .page-item.disabled .page-link {
                background-color: #f0f0f0;
                color: #6c757d;
                border-color: #f0f0f0;
            }

        </style>
    </head>

    <body>

        <!-- Main Content -->
        <div class="container-fluid py-5">
            <div class="container" style="margin-top: 100px">
                <div class="row">
                    <!-- Sidebar - Categories -->
                    <div class="col-lg-3">
                        <div class="sidebar">
                            <h3 class=" text-uppercase text-decoration-underline text-success text-center">Loại son</h3>
                            <ul class="list-unstyled">
                                <c:forEach items="${clist}" var="o">
                                    <li class="container"><a href="pshow?uid=${user.userName}&index=${i}&s=${s}&cid=${o.id}" class="text-uppercase">${o.name}</a></li>
                                    </c:forEach>
                            </ul>
                        </div>
                        <div>
                            <h5 class="text-center text-uppercase">${numsearch}</h5>
                        </div>
                    </div>

                    <!-- Product Listing -->
                    <div class="col-lg-9">
                        <form action="pshow" method="post">
                            <div class="row g-4">
                                <c:forEach items="${plist}" var="o">
                                    <div class="col-md-6 col-lg-4 col-xl-3">
                                        <input type="hidden" name="uid" value="${user.userName}">
                                        <div class="rounded fruite-item">
                                            <div class="fruite-img">
                                                <img src="${o.img}" alt="${o.name}">
                                            </div>
                                            <div class="content-wrapper">
                                                <h3 class="card-title text-uppercase">
                                                    <a href="pdetail?uid=${user.userName}&pid=${o.id}">${o.name}</a>
                                                </h3>
                                                <p class="price">${o.price}đ</p>
                                                <button type="submit" name="addtocart" value="${o.id}" class="btn btn-success">Add To Cart</button>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </form>


                        <!-- Pagination -->
                        <nav aria-label="Page navigation">
                            <ul class="pagination justify-content-center">
                                <c:forEach begin="1" end="${endPage}" var="i">
                                    <li class="page-item ${i == index ? 'active' : ''}">
                                        <a class="page-link" href="pshow?uid=${user.userName}&index=${i}&s=${s}&cid=${cid}">${i}</a>
                                    </li>
                                </c:forEach>
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div>

    </body>

</html>



<%@include file="footer.jsp" %>