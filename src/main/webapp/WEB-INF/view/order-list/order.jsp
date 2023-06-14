<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!doctype html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Giỏ hàng</title>

    <style>
        .order-detail:hover {
            cursor: pointer;
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
    <!--nav menu-->
    <section class="menu" style="background-color: #f69b44">
        <div class="container">
            <div class="row">
                <div class="col-3">
                    <a class="nav-link pt-2 text-center fs-4" aria-current="page" href="product?action=back"
                       style="color: #FFFFFF; font-weight: bold">Trang chủ</a>
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
                                            <li><a class="dropdown-item" href="product?action=back#cat">Cat SHOP</a>
                                            </li>
                                            <li>
                                                <hr class="dropdown-divider">
                                            </li>
                                            <li><a class="dropdown-item" href="product?action=back#dog">Dog SHOP</a>
                                            </li>
                                            <li>
                                                <hr class="dropdown-divider">
                                            </li>
                                            <li><a class="dropdown-item" href="product?action=back#hamster">Hamster
                                                SHOP</a></li>
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


<section class="h-100 h-custom">
    <div class="container py-5 h-100">
        <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col-12">
                <div class="card card-registration card-registration-2" style="border-radius: 15px;">
                    <div class="card-body p-0">
                        <div class="row g-0">
                            <div class="p-5">
                                <div class="p-4">
                                    <a href="product?action=back" class="text-decoration-none text-dark">
                                        <i class="fa fa-long-arrow-left"></i>
                                        <span class="ml-1 ms-2">Về Trang Chủ</span>
                                    </a>
                                </div>
                                <div class="d-flex justify-content-between align-items-center mb-5">
                                    <h1 class="fw-bold mb-0 text-black">Đơn hàng</h1>
                                </div>
                                                                <jsp:useBean id="orderList" scope="request" type="java.util.List<com.example.wwpetshop.model.Order>"/>
                                <c:forEach items="${orderList}" var="order">
                                    <hr class="my-4">

                                    <div class="row mb-4 d-flex justify-content-between align-items-center">
                                        <div class="col-md-3 col-lg-3 col-xl-3">
                                            <h6 class="text-black mb-0">Mã: ${order.id}</h6>
                                        </div>

                                        <div class="col-md-3 col-lg-3 col-xl-3">
                                            <h6 class="text-black mb-0">Tổng tiền: ${order.totalPrice}$</h6>
                                        </div>

                                        <div class="col-md-3 col-lg-2 col-xl-2 offset-lg-1 text-decoration-underline order-detail">
                                            <h6 class="mb-0" data-bs-toggle="dropdown" aria-expanded="false">
                                                Chi tiết đơn hàng
                                            </h6>
                                            <ul class="dropdown-menu">

                                                <c:forEach items="${orderDetailList}" var="orderDetail">
                                                    <c:if test="${orderDetail.orderID == order.id}">
                                                        <li>
                                                            <p class="dropdown-item info"
                                                               href="#">${orderDetail.productName} | Số lượng: ${orderDetail.quantity}</p>
                                                        </li>
                                                        <hr class="dropdown-divider info">
                                                    </c:if>
                                                </c:forEach>
                                            </ul>

                                        </div>

                                        <div class="col-md-3 col-lg-3 col-xl-2 d-flex">
                                            <h6 class="mb-0">Ngày đặt: ${order.orderDate.toLocalDate()}</h6>
                                        </div>

                                    </div>
                                </c:forEach>


                                <hr class="my-4">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

</body>
</html>

