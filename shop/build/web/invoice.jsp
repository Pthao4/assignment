<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang="vi">
    <head>
        <meta charset="UTF-8">
        <title>Hóa Đơn Bán Hàng</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    </head>
    <body>
        <div class="container my-5">
            <h2 class="text-center">Hóa Đơn Bán Hàng</h2>

            <table class="table table-bordered mt-4">
                <thead class="table-primary">
                    <tr>
                        <th>Sản Phẩm</th>
                        <th>Số Lượng</th>
                        <th>Đơn Giá (VND)</th>
                        <th>Thành Tiền (VND)</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${olist}" var="o">
                        <tr>
                            <td>${o.product.name}</td>
                            <td>${o.quantity}</td>
                            <td>${o.unitprice}</td>
                            <td>${o.quantity*o.unitprice}</td>
                        </tr>
                    </c:forEach>
                </tbody>
                <tfoot>
                    <tr class="table-secondary">
                        <th colspan="3" class="text-end">Tổng Cộng</th>
                        <th>${total}</th>
                    </tr>
                </tfoot>
            </table>

            <div class="text-center mt-4">
                <button class="btn btn-secondary" onclick="home('${user.userName}')">Trở về trang chủ</button>
            </div>
        </div>

        <script>
            function home(id){
                window.location.href = "home?uid=" + id;
            }
        </script>
    </body>
</html>
