<%-- 
    Document   : profile
    Created on : Oct 18, 2024, 9:19:38 PM
    Author     : thaon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="header.jsp" %>

<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Profile</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" 
              rel="stylesheet" 
              integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" 
              crossorigin="anonymous">
    </head>
    <body>
        <section>
            <div class="container py-5">
                <div class="row">
                    <div class="col">
                        <nav aria-label="breadcrumb" class="bg-body-tertiary rounded-3 p-3 mb-4">
                            <ol class="breadcrumb mb-0">
                                <li class="breadcrumb-item">
                                    <a href="home.jsp" class="text-decoration-none text-dark">Home</a>
                                </li>
                                <li class="breadcrumb-item active" aria-current="page">User Profile</li>
                            </ol>
                        </nav>
                    </div>
                </div>

                <div class="row">
                    <!-- Profile Image and Username -->
                    <div class="col-lg-4">
                        <div class="card mb-4">
                            <div class="card-body text-center">
                               <!--<img src="" alt="avatar" class="rounded-circle img-fluid" style="width: 150px;">-->
                               <img src="${user.image}" alt="avatar" class="rounded-circle img-fluid" style="width: 150px;">
                                <h5 class="my-3">${user.userName}</h5>
                            </div>
                        </div>
                    </div>

                    <!-- User Details -->
                    <div class="col-lg-8">
                        <div class="card mb-4">
                            <div class="card-body">
                                <!-- Full Name -->
                                <div class="row">
                                    <div class="col-sm-3">
                                        <p class="mb-0">Full Name</p>
                                    </div>
                                    <div class="col-sm-9">
                                        <p class="text-muted mb-0">${user.fullName}</p>
                                    </div>
                                </div>
                                <hr>

                                <!-- Email -->
                                <div class="row">
                                    <div class="col-sm-3">
                                        <p class="mb-0">Email</p>
                                    </div>
                                    <div class="col-sm-9">
                                        <p class="text-muted mb-0">${user.email}</p>
                                    </div>
                                </div>
                                <hr>

                                <!-- Phone -->
                                <div class="row">
                                    <div class="col-sm-3">
                                        <p class="mb-0">Phone</p>
                                    </div>
                                    <div class="col-sm-9">
                                        <p class="text-muted mb-0">${user.phone}</p>
                                    </div>
                                </div>
                                <hr>

                                <!-- Birth Date -->
                                <div class="row">
                                    <div class="col-sm-3">
                                        <p class="mb-0">Birth Date</p>
                                    </div>
                                    <div class="col-sm-9">
                                        <p class="text-muted mb-0">${user.formatBirthDate()}</p>
                                    </div>
                                </div>
                                <hr>

                                <!-- Address -->
                                <div class="row">
                                    <div class="col-sm-3">
                                        <p class="mb-0">Address</p>
                                    </div>
                                    <div class="col-sm-9">
                                        <p class="text-muted mb-0">${user.address}</p>
                                    </div>
                                </div>
                            </div>

                            <!-- Update Button -->
<!--                            <div class="d-flex justify-content-center mb-2">
                                <button type="button" data-mdb-button-init data-mdb-ripple-init class="btn btn-primary">
                                    Update Information
                                </button>
                            </div>-->
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </body>
</html>

<%@include file="footer.jsp" %>