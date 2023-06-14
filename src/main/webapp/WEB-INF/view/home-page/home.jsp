<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Trang chủ</title>

    <style>
        .menu {
            background-color: #f69b44;
        }

        .btn-search:hover {
            cursor: pointer;
            color: orangered;
        }

        .customer-tab:hover {
            cursor: pointer;
            opacity: 50%;
        }

        .header-nav {
            position: fixed;
            width: 100%;
            z-index: 2;
        }

        .mainContent {
            padding-top: 150px;
        }

        .text-link-footer {
            text-decoration: none;
            color: black;
        }

        .hover-zoom {
            transition: all 0.3s;
        }

        .hover-zoom:hover {
            transform: scale(1.15);
            opacity: 70%;
        }

    </style>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"
            integrity="sha384-geWF76RCwLtnZ8qwWowPQNguL3RmwHVBC9FhGdlKrxdiJJigb/j/68SIy3Te4Bkz"
            crossorigin="anonymous"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
          integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
</head>
<body>

<div class="header-nav">
    <!-- header-->
    <header class="header bg-white">
        <div class="container pt-2 ps-5">
            <div class="row">
                <div class="col-md-1">
                    <img src="https://media.discordapp.net/attachments/1113385012763557903/1115184033924661338/logo.png?width=361&height=358"
                         class="img-fluid" alt="Logo" width="80">
                </div>
                <div class="col-md-5 m-auto pt-3">
                    <div class="input-group mb-3">
                        <input type="text" class="form-control" placeholder="Từ khóa tìm kiếm"
                               aria-label="Từ khóa tìm kiếm" aria-describedby="basic-addon2">
                        <span class="input-group-text btn-search" id="basic-addon2">
                        <i class="fa-solid fa-magnifying-glass"></i>
                    </span>
                    </div>
                </div>
                <div class="col-md-4 m-auto">
                    <div class="row">
                        <div class="col">
                            <div class="row">
                                <div class="col-3">
                                    <div class="fs-3 text-danger">
                                        <i class="fa-solid fa-phone-volume"></i>
                                    </div>
                                </div>
                                <div class="col-9">
                                    Hỗ trợ trực tiếp <br>
                                    <strong>0123456789</strong>
                                </div>
                            </div>
                        </div>

                        <c:if test="${user == null}">
                            <div class="col" style="margin-bottom: 21px;">
                                <div class="row">
                                    <div class="col-3">
                                        <div class="fs-3 text-danger">
                                            <i class="fa-regular fa-circle-user"></i>
                                        </div>
                                    </div>
                                    <div class="col-9">
                                            <%--                                                                                <jsp:useBean id="user" scope="session" type="com.example.wwpetshop.model.User"/>--%>
                                        <button type="button" id="login-btn" class="btn btn-outline-warning btn-sm mt-2"
                                                data-bs-toggle="modal"
                                                data-bs-target="#login">
                                            Đăng nhập
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </c:if>

                        <c:if test="${user != null}">
                            <div class="col">
                                <div class="row">
                                    <div class="col-3">
                                        <div class="fs-3 text-danger">
                                            <i class="fa-solid fa-paw"></i>
                                        </div>
                                    </div>
                                    <div class="col-9">
                                        Xin chào <br>
                                        <div class="btn-group">
                                            <p class="dropdown-toggle customer-tab text-uppercase"
                                               data-bs-toggle="dropdown" aria-expanded="false">
                                                <c:out value="${user.name}"></c:out>
                                            </p>
                                            <ul class="dropdown-menu">
                                                <li><a class="dropdown-item info" href="#">Tài khoản của tôi</a></li>
                                                <li><a class="dropdown-item info" href="home?action=order">Đơn hàng</a></li>
                                                <li>
                                                    <hr class="dropdown-divider info">
                                                </li>
                                                <li>
                                                    <a class="dropdown-item info" href="home?action=logout">
                                                        Đăng xuất
                                                    </a>
                                                </li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:if>

                    </div>
                </div>
                <c:if test="${user != null}">
                    <div class="col-md-2 m-auto" style="padding-bottom: 12px;">
                        <a href="home?action=cart" class="position-relative">
                            <span class="fs-3" style="color: #f69b44">
                                <i class="fa-solid fa-cart-shopping"></i>
                            </span>
                        </a>
                    </div>
                </c:if>

                <c:if test="${user == null}">
                    <div class="col-md-2 m-auto" style="padding-bottom: 12px;">
                        <a href="" class="position-relative">
                            <span class="fs-3" style="color: #f69b44">
                                <i class="fa-solid fa-cart-shopping"></i>
                            </span>
                        </a>
                    </div>
                </c:if>

            </div>
        </div>
    </header>

    <!--nav menu-->
    <section class="menu">
        <div class="container">
            <div class="row">
                <div class="col-3">
                    <a class="nav-link pt-2 text-center fs-4" aria-current="page" href="#"
                       style="color: #FFFFFF; font-weight: bold">Trang
                        chủ</a>
                </div>
                <div class="col-9">
                    <nav class="navbar navbar-expand-lg">
                        <div class="container-fluid">
                            <div class="collapse navbar-collapse text-center" id="navbarSupportedContent">
                                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                                    <li class="nav-item pe-5">
                                        <a class="nav-link text-white" href="#">Giới thiệu</a>
                                    </li>
                                    <li class="nav-item dropdown pe-5">
                                        <a class="nav-link text-white dropdown-toggle" href="#" role="button"
                                           data-bs-toggle="dropdown" aria-expanded="false">
                                            Sản phẩm
                                        </a>
                                        <ul class="dropdown-menu">
                                            <li><a class="dropdown-item" href="#cat">Cat SHOP</a></li>
                                            <li>
                                                <hr class="dropdown-divider">
                                            </li>
                                            <li><a class="dropdown-item" href="#dog">Dog SHOP</a></li>
                                            <li>
                                                <hr class="dropdown-divider">
                                            </li>
                                            <li><a class="dropdown-item" href="#hamster">Hamster SHOP</a></li>
                                        </ul>
                                    </li>
                                    <li class="nav-item dropdown pe-5">
                                        <a class="nav-link text-white dropdown-toggle" href="#" role="button"
                                           data-bs-toggle="dropdown" aria-expanded="false">
                                            Dịch vụ
                                        </a>
                                        <ul class="dropdown-menu">
                                            <li><a class="dropdown-item" href="#">Khách sạn chó, mèo</a></li>
                                            <li>
                                                <hr class="dropdown-divider">
                                            </li>
                                            <li><a class="dropdown-item" href="#">Spa chó, mèo</a></li>
                                        </ul>
                                    </li>
                                    <li class="nav-item pe-5">
                                        <a class="nav-link text-white" href="#">Tin tức</a>
                                    </li>
                                    <li class="nav-item pe-5">
                                        <a class="nav-link text-white" href="#">Khuyến mãi</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </nav>
                </div>
            </div>
        </div>
    </section>
</div>

<!--main-->
<main class="mainContent">
    <div class="container">
        <div class="slider p-2">
            <div id="carouselExampleIndicators" class="carousel slide">
                <div class="carousel-inner">
                    <div class="carousel-item active">
                        <img src="https://media.discordapp.net/attachments/1113385012763557903/1116689223018348604/banner2.png?width=1137&height=558"
                             class="d-block w-100" alt="...">
                    </div>
                    <div class="carousel-item">
                        <img src="https://media.discordapp.net/attachments/1113385012763557903/1116689222712176670/banner1.JPG?width=1137&height=558"
                             class="d-block w-100" alt="...">
                    </div>
                    <div class="carousel-item">
                        <img src="https://media.discordapp.net/attachments/1113385012763557903/1116689223580393593/banner3.jpg?width=1135&height=558"
                             class="d-block w-100" alt="...">
                    </div>
                    <div class="carousel-item">
                        <img src="https://media.discordapp.net/attachments/1113385012763557903/1116689224213737512/banner4.png?width=1135&height=558"
                             class="d-block w-100" alt="...">
                    </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators"
                        data-bs-slide="prev">
                    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators"
                        data-bs-slide="next">
                    <span class="carousel-control-next-icon" aria-hidden="true"></span>
                    <span class="visually-hidden">Next</span>
                </button>
            </div>
        </div>
        <!--end slider-->

        <!--        product list-->
        <div class="product-list mb-3 ">
            <!--            cat shop-->
            <div class="product-title border-bottom pt-3" id="cat">
                <strong class="bg-danger text-white p-1" style="border-radius: 4px">Cat SHOP</strong>
            </div>
            <div class="product-line">
                <div class="row">
                    <c:forEach items="${productList}" var="product">
                        <c:if test="${product.categoryID == 1}">
                            <div class="col-md-3 mb-3">
                                <a href="home?action=product&id=${product.id}" class="text-decoration-none text-dark">
                                    <img class="img-fluid hover-zoom" alt="product"
                                         src=${product.imgURL}>
                                    <h4 style="width: 306px; height: 86px;">${product.name}</h4>
                                </a>
                                <p class="text-end fw-semibold text-warning fs-5">Giá: ${product.price}$</p>
                            </div>
                        </c:if>
                    </c:forEach>

                </div>
            </div>

            <!--            dog shop-->
            <div class="product-title border-bottom pt-3" id="dog">
                <strong class="bg-danger text-white p-1" style="border-radius: 4px">Dog SHOP</strong>
            </div>
            <div class="product-line">
                <div class="row">
                    <c:forEach items="${productList}" var="product">
                        <c:if test="${product.categoryID == 2}">
                            <div class="col-md-3 mb-3">
                                <a href="home?action=product&id=${product.id}" class="text-decoration-none text-dark">
                                    <img class="img-fluid hover-zoom" alt="product"
                                         src=${product.imgURL}>
                                    <h4 style="width: 306px; height: 84px;">${product.name}</h4>
                                </a>
                                <p class="text-end fw-semibold text-warning fs-5">Giá: ${product.price}$</p>
                            </div>
                        </c:if>
                    </c:forEach>

                </div>
            </div>

            <!--            hamster shop-->
            <div class="product-title border-bottom pt-3" id="hamster">
                <strong class="bg-danger text-white p-1" style="border-radius: 4px">Hamster SHOP</strong>
            </div>
            <div class="product-line">
                <div class="row">
                    <c:forEach items="${productList}" var="product">
                        <c:if test="${product.categoryID == 3}">
                            <div class="col-md-3 mb-3">
                                <a href="home?action=product&id=${product.id}" class="text-decoration-none text-dark">
                                    <img class="img-fluid hover-zoom" alt="product"
                                         src=${product.imgURL}>
                                    <h4 style="width: 306px; height: 56px;">${product.name}</h4>
                                </a>

                                <p class="text-end fw-semibold text-warning fs-5">Giá: ${product.price}$</p>
                            </div>
                        </c:if>
                    </c:forEach>

                </div>
            </div>
        </div>
    </div>
</main>


<!--footer-->
<footer class="footer bg-secondary-subtle py-4">
    <div class="container">
        <div class="row">
            <div class="col-5">
                <h4 class="text-info fs-4">WauWau PetShop</h4>
                <ul>
                    <li>Địa chỉ: Chung cư méo mèo meo.</li>
                    <li>Tài khoản ACB: 999999</li>
                    <li>Số điện thoai: 0123456789</li>
                </ul>
            </div>
            <div class="col-4">
                <h4 class="text-info fs-4">CHĂM SÓC KHÁCH HÀNG</h4>
                <ul>
                    <li>Chính sách giao - nhận hàng.</li>
                    <li>Chính sách đổi trả.</li>
                    <li>Chính sách bảo mật.</li>
                    <li>Câu hỏi thường gặp.</li>
                </ul>
            </div>
            <div class="col-3">
                <h4 class="text-info fs-4">THEO DÕI CHÚNG TÔI</h4>
                <ul style="list-style: none">
                    <li>
                        <div class="row">
                            <div class="col-1">
                                <div class="fs-6">
                                    <i class="fa-brands fa-facebook"></i>
                                </div>
                            </div>
                            <div class="col-11">
                                <a class="text-link-footer" href="#">Facebook</a>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="row">
                            <div class="col-1">
                                <div class="fs-6">
                                    <i class="fa-brands fa-instagram"></i>
                                </div>
                            </div>
                            <div class="col-11">
                                <a class="text-link-footer" href="#">Instagram</a>
                            </div>
                        </div>
                    </li>
                    <li>
                        <div class="row">
                            <div class="col-1">
                                <div class="fs-6">
                                    <i class="fa-brands fa-youtube"></i>
                                </div>
                            </div>
                            <div class="col-11">
                                <a class="text-link-footer" href="#">Youtube</a>
                            </div>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
</footer>


<!--login modal-->
<div class="modal fade" id="login" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="container h-100">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="card text-dark">
                        <div class="card-body p-5 text-center">
                            <div class="mb-md-5 mt-md-4 pb-5">
                                <h2 class="fw-bold mb-2">ĐĂNG NHẬP</h2>
                                <form method="post" action="home">
                                    <input type="hidden" name="action" value="login">

                                    <p class="text-dark mb-5">Nhập email và mật khẩu của bạn!</p>

                                    <c:if test="${loginstatus.equals('failed')}">
                                        <script>
                                            document.getElementById("login-btn").click();
                                        </script>
                                        <p class="text-danger">Đăng nhập thất bại!</p>
                                    </c:if>

                                    <div class="form-outline form-white mb-4">
                                        <input type="email" required name="email" id="typeEmailX"
                                               class="form-control form-control-lg"
                                               placeholder="Email"/>
                                    </div>

                                    <div class="form-outline form-white mb-4">
                                        <input type="password" required minlength="3" name="password" id="typePasswordX"
                                               class="form-control form-control-lg"
                                               placeholder="Mật khẩu"/>
                                    </div>

                                    <p class="small mb-5 pb-lg-2"><a class="text-dark" href="#!">Quên mật khẩu?</a>
                                    </p>

                                    <button class="btn btn-outline-warning btn-lg px-5" type="submit">Đăng nhập</button>

                                    <div class="d-flex justify-content-center text-center mt-4 pt-1">
                                        <a href="#!" class="text-dark"><i class="fab fa-facebook-f fa-lg"></i></a>
                                        <a href="#!" class="text-dark"><i
                                                class="fab fa-twitter fa-lg mx-4 px-2"></i></a>
                                        <a href="#!" class="text-dark"><i class="fab fa-google fa-lg"></i></a>
                                    </div>
                                </form>
                            </div>

                            <div>
                                <p class="mb-0">Bạn chưa có tài khoản?
                                    <button type="submit" id="register-btn" class="btn btn-outline-danger btn-sm"
                                            data-bs-toggle="modal"
                                            data-bs-target="#register">
                                        Đăng ký
                                    </button>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


<!--register modal -->
<div class="modal fade" id="register" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="container h-100">
                <div class="row d-flex justify-content-center align-items-center h-100">
                    <div class="card">
                        <div class="card-body p-5">
                            <h2 class="text-center mb-5">TẠO TÀI KHOẢN</h2>
                            <form method="post" action="home">
                                <input type="hidden" name="action" value="register">

                                <c:if test="${registerstatus.equals('failed')}">
                                    <script>
                                        document.getElementById("register-btn").click();
                                    </script>
                                    <p class="text-danger text-center">Email đã tồn tại!</p>
                                </c:if>

                                <c:if test="${registerstatus.equals('success')}">
                                    <script>
                                        document.getElementById("register-btn").click();
                                    </script>
                                    <p class="text-success text-center">Đăng kí tài khoản thành công.</p>
                                </c:if>

                                <div class="form-outline mb-4">
                                    <input type="text" required id="form3Example1cg" name="name"
                                           class="form-control form-control-lg"/>
                                    <label class="form-label" for="form3Example1cg">Tên của bạn</label>
                                </div>
                                <div class="form-outline mb-4">
                                    <input type="email" required id="form3Example3cg" name="email"
                                           class="form-control form-control-lg"/>
                                    <label class="form-label" for="form3Example3cg">Email đăng nhập của bạn</label>
                                </div>

                                <div class="form-outline mb-4">
                                    <input type="password" required minlength="3" id="form3Example4cg" name="password"
                                           class="form-control form-control-lg"/>
                                    <label class="form-label" for="form3Example4cg">Mật khẩu</label>
                                </div>

                                <div class="form-check d-flex justify-content-center mb-5">
                                    <input class="form-check-input me-2" type="checkbox" required value=""
                                           id="form2Example3cg"/>
                                    <label class="form-check-label" for="form2Example3cg">
                                        Tôi đồng ý với
                                        <a href="#!" class="text-body">
                                            <u>những điều khoản dịch vụ.</u>
                                        </a>
                                    </label>
                                </div>

                                <div class="d-flex justify-content-center">
                                    <button type="submit"
                                            class="btn btn-outline-warning btn-block btn-lg gradient-custom-4 text-body">
                                        Đăng ký
                                    </button>
                                </div>

                                <p class="text-center text-muted mt-5 mb-0">Bạn đã có tài khoản?
                                    <a href="#!"
                                       class="fw-bold text-body">
                                        <button type="button" class="btn btn-outline-info btn-sm"
                                                data-bs-toggle="modal" data-bs-target="#login">
                                            Đăng nhập
                                        </button>
                                    </a>
                                </p>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

</body>

</html>
