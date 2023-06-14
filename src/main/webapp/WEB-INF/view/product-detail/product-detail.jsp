<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport"
          content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Chi tiết sản phẩm</title>

    <style>
        .bg-grey {
            background-color: #eae8e8;
            border-top-right-radius: 16px;
            border-bottom-right-radius: 16px;
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

<%--header nav--%>
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

<%--product detail--%>
<div class="container mt-5 mb-5">
    <div class="row">
        <div class="col-md-10">
            <div class="card" style="border-radius: 16px;">
                <div class="row">
                    <c:if test="${product != null}">
                        <div class="col-md-7">
                            <div class="img-fluid p-3">
                                <img src=${product.imgURL}>
                            </div>
                        </div>
                        <div class="col-md-5 bg-grey">
                            <div class="p-4">
                                <a href="product?action=back" class="text-decoration-none text-dark">
                                    <i class="fa fa-long-arrow-left"></i>
                                    <span class="ml-1 ms-2">Về Trang Chủ</span>
                                </a>
                            </div>

                            <form method="post" action="product?action=addToCart">
                                <input type="hidden" name="cartID" value="${userCart.id}">
                                <input type="hidden" name="productID" value="${product.id}">
                                <input type="hidden" name="price" value="${product.price}">
                                <div class="mt-5 ps-2">
                                    <div style="height: 400px">
                                        <h3 class="mt-5 text-center">${product.name}</h3>
                                        <p class="mt-5 text-end pe-5">Loại: ${product.type}</p>
                                        <p class="text-danger text-end fs-2 pe-5">Giá: ${product.price}$</p>
                                    </div>
                                    <div>
                                        <input type="number" name="quantity" min="1" value="1" style="width: 100px"
                                               placeholder="Số lượng">
                                        <c:if test="${user != null}">
                                            <button type="submit" class="btn btn-danger text-uppercase">Thêm vào giỏ
                                                hàng
                                            </button>
                                        </c:if>
                                        <c:if test="${user == null}">
                                            <button type="button" class="btn btn-danger text-uppercase">Thêm vào giỏ
                                                hàng
                                            </button>
                                        </c:if>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </c:if>

                </div>
            </div>
        </div>
    </div>
</div>


</body>
</html>
