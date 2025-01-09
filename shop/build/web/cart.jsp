<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@include file="header.jsp" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cart Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />
    </head>
    <body>
        <section class="h-100 gradient-custom">
            <div class="container py-5">
                <div class="row d-flex justify-content-center my-4 mt-5">
                    <div class="col-md-8">
                        <div class="card mb-4">
                            <div class="card-header py-3">
                                <h5 class="mb-0">Cart - ${numitem} items</h5>
                            </div>
                            <div class="card-body">
                                <c:forEach items="${list}" var="o">
                                    <div class="row">
                                        <div class="col-lg-3 col-md-12 mb-4 mb-lg-0">
                                            <!-- Image -->
                                            <div class="bg-image hover-overlay hover-zoom ripple rounded" data-mdb-ripple-color="light">
                                                <img src="${o.product.img}"
                                                     class="w-100" alt="Image" />
                                                <a href="#!">
                                                    <div class="mask" style="background-color: rgba(251, 251, 251, 0.2)"></div>
                                                </a>
                                            </div>
                                            <!-- Image -->
                                        </div>

                                        <div class="col-lg-5 col-md-6 mb-4 mb-lg-0">
                                            <!-- Data -->
                                            <p><strong>${o.product.name}</strong></p>
                                            <button type="button" class="btn btn-danger btn-sm me-1 mb-2" 
                                                    onclick="removeFromCart(${o.product.id})" title="Remove item">
                                                <i class="fas fa-trash"></i>
                                            </button>
                                        </div>

                                        <div class="col-lg-4 col-md-6 mb-4 mb-lg-0">
                                            <!-- Quantity -->
                                            <!-- Đoạn mã cập nhật cho cột Quantity -->
                                            <div class="d-flex mb-4" style="max-width: 300px">
                                                <button class="btn btn-primary px-3 me-2"
                                                        onclick="updateQuantity(${o.product.id}, ${o.product.price}, -1)">
                                                    <i class="fas fa-minus"></i>
                                                </button>

                                                <div class="form-outline">
                                                    <input id="quantity-${o.product.id}" min="1" name="quantity" value="${o.quantity}"
                                                           type="number" class="form-control" oninput="onQuantityChange(${o.product.id}, ${o.product.price})"/>
                                                    <label class="form-label" for="quantity-${o.product.id}">Quantity</label>
                                                </div>

                                                <button class="btn btn-primary px-3 ms-2"
                                                        onclick="updateQuantity(${o.product.id}, ${o.product.price}, 1)">
                                                    <i class="fas fa-plus"></i>
                                                </button>
                                            </div>

                                            <!-- Cập nhật giá tiền ngay tại ô Price -->
                                            <p class="text-start text-md-center text-danger">
                                                <strong id="price-${o.product.id}">${o.quantity * o.product.price}đ</strong>
                                            </p>
                                            <!-- Price -->
                                        </div>
                                    </div>
                                </c:forEach>

                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card mb-4">
                            <div class="card-header py-3">
                                <h5 class="mb-0">Summary</h5>
                            </div>
                            <div class="card-body">
                                <ul class="list-group list-group-flush">
                                    <li class="list-group-item d-flex justify-content-between align-items-center border-0 px-0 mb-3">
                                        <div>
                                            <strong>Total amount</strong>
                                        </div>
                                        <span><strong id="totalAmount">${summary}đ</strong></span> <!-- Thêm id để dễ cập nhật -->
                                    </li>
                                </ul>
                                <button type="button" class="btn btn-success btn-lg btn-block" onclick="checkout()">
                                    Go to checkout
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js"></script>
        <script>
                                    function updateQuantity(productId, pricePerUnit, change) {
                                        var uid = '${uid}';
                                        const quantityInput = document.getElementById('quantity-' + productId);
                                        let newQuantity = parseInt(quantityInput.value) + change;

                                        // Đảm bảo số lượng không nhỏ hơn 1
                                        if (newQuantity < 1) {
                                            newQuantity = 1;
                                        }
                                        quantityInput.value = newQuantity; // Cập nhật số lượng trực tiếp trong ô input

                                        // Gửi AJAX đến server để cập nhật số lượng
                                        const xhr = new XMLHttpRequest();
                                        xhr.open('POST', 'updateCart', true); // 'updateCart' là đường dẫn servlet để cập nhật
                                        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
                                        xhr.onreadystatechange = function () {
                                            if (xhr.readyState === 4 && xhr.status === 200) {
                                                // Server đã xử lý thành công, cập nhật lại giao diện
                                                const totalPrice = newQuantity * pricePerUnit;
                                                document.getElementById('price-' + productId).textContent = totalPrice + 'đ';

                                                // Cập nhật tổng giá trị toàn bộ giỏ hàng
                                                document.getElementById('totalAmount').textContent = xhr.responseText + 'đ';
                                            }
                                        };
                                        xhr.send('productId=' + productId + '&quantity=' + newQuantity + '&uid=' + uid);
                                    }

                                    function removeFromCart(productId) {
                                        // Xác nhận hành động xóa sản phẩm
                                        const confirmation = confirm("Bạn có chắc chắn muốn xóa sản phẩm này khỏi giỏ hàng?");
                                        if (!confirmation) {
                                            return; // Nếu người dùng không xác nhận, dừng hàm
                                        }
                                        var uid = '${uid}'; // Lấy uid từ JSP
                                        const xhr = new XMLHttpRequest();
                                        xhr.open('POST', 'removeFromCart', true);
                                        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
                                        xhr.onreadystatechange = function () {
                                            if (xhr.readyState === 4) {
                                                if (xhr.status === 200) {
//                                                    alert(xhr.responseText); // Hiển thị thông báo thành công
                                                    location.reload(); // Tải lại trang để cập nhật giỏ hàng
                                                } else {
                                                    alert("Error: " + xhr.statusText); // Thông báo lỗi nếu có
                                                }
                                            }
                                        };
                                        xhr.send('productId=' + productId + '&uid=' + uid);
                                    }

                                    function onQuantityChange(productId, pricePerUnit) {
                                        const quantityInput = document.getElementById('quantity-' + productId);
                                        let newQuantity = parseInt(quantityInput.value);

                                        // Đảm bảo số lượng không nhỏ hơn 1
                                        if (newQuantity < 1 || isNaN(newQuantity)) {
                                            newQuantity = 1;
                                            quantityInput.value = newQuantity;
                                        }

                                        // Gọi hàm updateQuantity để cập nhật thay đổi lên server
                                        updateQuantity(productId, pricePerUnit, 0); // Truyền 0 vì không tăng/giảm mà là giá trị nhập mới
                                    }

                                    function checkout() {
                                        var uid = '${uid}';
                                        const xhr = new XMLHttpRequest();
                                        xhr.open('POST', 'checkout', true);
                                        xhr.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
                                        xhr.onreadystatechange = function () {
                                            if (xhr.readyState === 4 && xhr.status === 200) {
                                                if (xhr.responseText === "success") {
                                                    alert('Checkout successful!');
                                                    location.href = 'invoice?uid=' + uid; // Điều hướng đến trang xác nhận đơn hàng
                                                } else if (xhr.responseText === "error") {
                                                    alert('Sản phẩm không đủ hàng trong kho. Vui lòng kiểm tra lại.');
                                                }
                                            }
                                        };
                                        xhr.send('uid=' + uid);
                                    }
        </script>
    </body>
</html>

<%@include file="footer.jsp" %>
