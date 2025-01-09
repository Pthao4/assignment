<%-- 
    Document   : forgotpass
    Created on : Oct 16, 2024, 8:41:49 PM
    Author     : thaon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <title>Forgot Password</title>
    </head>
    <body>
        <main class="container my-5">
            <div class="card shadow border-primary">
                <div class="card-body p-5">
                    <div class="text-center">
                        <h1 class="h3 fw-bold">Forgot password?</h1>
                        <p class="mt-2 small text-muted">
                            Remember your password?
                            <a href="login" class="text-primary fw-medium">Login here</a>
                        </p>
                    </div>

                    <div class="mt-4">
                        <form action="passgetuser" method="get">
                            <div class="mb-3">
                                <label for="text" class="form-label fw-bold">User Name</label>
                                <input type="text" id="uid" name="uid" class="form-control" required>
                            </div>
                            <div class="text-danger">${mess}</div>
                            <div class="text-center">
                                <button type="submit" class="btn btn-success">Submit</button>
                            </div>
                        </form>

                    </div>
                </div>
            </div>
        </main>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    </body>
</html>
