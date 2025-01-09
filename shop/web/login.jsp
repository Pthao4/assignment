
<%@page contentType="text/html" pageEncoding="UTF-8"%>

</html>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
        <style>
            /* Căn chỉnh chiều cao và nội dung giữa trang */
            .vh-100 {
                height: 100vh;
            }

            .divider::before,
            .divider::after {
                content: "";
                flex: 1;
                height: 1px;
                background: #eee;
            }
        </style>
    </head>
    <body>
        <section class="vh-100 d-flex align-items-center">
            <div class="container">
                <div class="row justify-content-center align-items-center">
                    <!-- Hình ảnh minh họa -->
                    <div class="col-md-6 d-none d-md-block">
                        <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-login-form/draw2.svg"
                             class="img-fluid" alt="Phone image">
                    </div>
                    <!-- Form đăng nhập -->
                    <div class="col-md-6">
                        <form action="login" method="post">
                            <h3 class="mb-4 text-center text-primary">Login</h3>
                            <p class="text-danger">${exist}</p>
                            <!-- Email input -->
                            <div class="mb-3">
                                <label for="username" class="form-label">User Name ${mess!=null ? '<i class="bi bi-exclamation-circle" style="color: red; font-size: 12px"></i>' : ''}</label>
                                <input type="text" class="form-control" id="username" name="username" value="${cookie.name.value}" oninput="" />
                            </div>

                            <!-- Password input -->
                            <div class="mb-3">
                                <label for="password" class="form-label">Password ${mess!=null ? '<i class="bi bi-exclamation-circle" style="color: red; font-size: 12px"></i>' : ''}</label>
                                <input type="password" class="form-control" id="password" name="password" value="${cookie.pass.value}" />
                            </div>

                            <!-- Checkbox và Forgot password -->
                            <div class="d-flex justify-content-between align-items-center mb-3">
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" id="rememberMe" name="re" ${cookie.re!=null?"checked":""} />
                                    <label class="form-check-label" for="rememberMe">Remember me</label>
                                </div>

                                <a href="forgotpass.jsp" id="forgot" class="text-muted">Forgot password?</a>
                            </div>

                            <!-- Submit button -->
                            <button type="submit" class="btn btn-primary w-100">Sign in</button>

                            <!-- Divider -->
                            <div class="divider d-flex align-items-center my-4">
                                <p class="text-center fw-bold mx-3 mb-0 text-muted">OR</p>
                            </div>

                            <!-- Link to signup -->
                            <div class="text-center">
                                <a href="signup.jsp" class="btn btn-link text-primary">Sign Up</a>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </section>

        
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
