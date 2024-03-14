<%-- 
    Document   : header
    Created on : Jan 17, 2024, 10:42:57 PM
    Author     : hien
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="//fonts.googleapis.com/css?family=Open+Sans:400,700" rel="stylesheet" type="text/css" media="all">
        <link href="https://fonts.googleapis.com/css?family=Montserrat:300,300i,400,400i,500,500i,600,600i,700,700i,900,900i&amp;subset=vietnamese" rel="stylesheet">
        <!-- CSS here -->
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/owl.carousel.min.css">
        <link rel="stylesheet" href="css/animate.min.css">
        <link rel="stylesheet" href="css/magnific-popup.css">
        <link rel="stylesheet" href="css/fontawesome-all.min.css">
        <link rel="stylesheet" href="css/flaticon.css">
        <link rel="stylesheet" href="css/meanmenu.css">
        <link rel="stylesheet" href="css/slick.css">
        <link rel="stylesheet" href="css/default.css">
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/responsive.css">
        <style>
            .autocomplete{
                position: relative;
                display: inline-block;
            }

            .autocomplete-items {
                width: 460px;
                position: absolute;
                border: 1px solid #d4d4d4;
                border-bottom: none;
                border-top: none;
                z-index: 99;
                top: 100%;
                left: 0;
                right: 0;
            }

            .autocomplete-items div {
                padding: 15px;
                cursor: pointer;
                background-color: #fff;
            }
            .autocomplete-items div:hover {
                background-color: #e9e9e9;
            }
            .autocomplete-active {
                background-color: #e9e9e9 !important;
                color: #ffffff;
            }

        </style>
    </head>
    <body>
        <!-- preloader -->
        <div id="preloader">
            <div class="preloader">
                <span></span>
                <span></span>
            </div>
        </div>
        <!-- preloader end  -->
        <header>
            <div id="header-sticky" class="header-area box-90 pt-35 pb-35">
                <div class="container-fluid">
                    <div class="row align-items-center">
                        <div class="col-xl-5 col-lg-6 col-md-6 col-7 col-sm-5 d-flex align-items-center pos-relative">
                            <div class="basic-bar cat-toggle">
                                <span class="bar1"></span>
                                <span class="bar2"></span>
                                <span class="bar3"></span>
                            </div>
                            <div class="logo">
                                <a href="Home"><img src="img/logo/coco.png" style="height:60px;width:300px;margin-left:20px" alt=""></a>
                            </div>

                            <div class="category-menu">
                                <h4>Kênh bán hàng</h4>
                                <ul style="margin-bottom: 0;">
                                    <c:if test="${user.role != 2}">
                                        <li><a href="becomeseller.jsp"><i class="flaticon-employee"></i> Bắt đầu bán hàng</a></li>
                                        </c:if>
                                        <c:if test="${user.role eq 2}">
                                        <li><a href="#"> Xem tổng quan phân tích bán hàng</a></li>
                                        <li><a href="productcontroller"> Quản lý sản phẩm của shop</a></li>
                                        <li><a href="sellersvouchercontroller"> Quản lý voucher của shop</a></li>
                                        <li><a href="shopcategorycontroller"> Quản lý danh mục của shop</a></li>
                                        <li><a href="#"> Quản lý đơn hàng sản phẩm theo yêu cầu của shop</a></li>
                                        <li><a href="#"> Chat</a></li>
                                        </c:if>
                                </ul>
                                <c:if test="${user.role != 2}">

                                    <h4>Danh mục</h4>
                                    <ul>
                                        <c:forEach var="cate" items="${sessionScope.main_category_list}">
                                            <li><a href="SearchProduct?cate=${cate.id}"><i class="flaticon-shopping-cart-1"></i> ${cate.name}</a></li>
                                            </c:forEach>
                                    </ul>
                                </c:if>

                            </div>
                        </div>
                        <div class="col-xl-7 col-lg-6 col-md-6 col-5 col-sm-7 pl-0">
                            <div class="header-right f-right">
                                <ul>
                                    <li class="search-btn">
                                        <form autocomplete="off" action="SearchProduct" class="shop-search">
                                            <div class="autocomplete" style="width: 500px;">
                                                <input id="myInput" type="text" name='kw' placeholder="Tìm kiếm..." style="width: 500px;height: 50px" value="${sessionScope.kw}">
                                            </div>
                                            <button type="submit" style="height: 50px; width: 50px">
                                                <i class="fa fa-search"></i>
                                            </button>
                                        </form>
                                    </li>
                                    <li class="login-btn">
                                        <c:if test="${sessionScope.user == null}">
                                            <a href="login.jsp"><i class="far fa-user"></i></a>
                                            <ul class="submenu">

                                                <li >
                                                    <a href="login.jsp">Đăng nhập</a>
                                                </li>
                                                <li>
                                                    <a href="register.jsp">Đăng ký</a>
                                                </li>

                                            </ul>
                                        </c:if>
                                        <c:if test="${sessionScope.user != null}">
                                            <a href="profile.jsp"><i class="far fa-user"></i></a>
                                            <ul class="submenu">
                                                <li  style="font-size: 16px;">Chào <b>${sessionScope.user.username}</b>!</li>
                                                <li>
                                                    <a href="profile.jsp">Hồ sơ của bạn</a>
                                                </li>
                                                <li>
                                                    <a href="#">Đơn mua</a>
                                                </li>
                                                <li>
                                                    <a href="logout">Đăng xuất</a>
                                                </li>
                                            </ul>
                                        </c:if>

                                    </li>
                                    <li class="d-shop-cart">
                                        <a href="Cart">
                                            <i class="flaticon-shopping-cart"></i>
                                            <c:if test="${sessionScope.user.role == 1}">
                                                <span class="cart-count">3</span>
                                            </c:if>
                                        </a>
                                        <c:if test="${sessionScope.user.role == 1}">
                                            <ul class="minicart">
                                                <li>
                                                    <div class="cart-img">
                                                        <a href="product-details.html">
                                                            <img src="img/product/pro1.jpg" alt="" />
                                                        </a>
                                                    </div>
                                                    <div class="cart-content">
                                                        <h3>
                                                            <a href="product-details.html">Black & White Shoes</a>
                                                        </h3>
                                                        <div class="cart-price">
                                                            <span class="new">$ 229.9</span>
                                                            <span>
                                                                <del>$239.9</del>
                                                            </span>
                                                        </div>
                                                    </div>
                                                    <div class="del-icon">
                                                        <a href="#">
                                                            <i class="far fa-trash-alt"></i>
                                                        </a>
                                                    </div>
                                                </li>
                                            </ul>
                                        </c:if>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-12 d-xl-none">
                            <div class="mobile-menu"></div>
                        </div>
                    </div>
                </div>
            </div>
        </header>

        <script>
            var suggestion = ["túi xách", "cài áo", "bông tai", "khăn thêu", "áo sơ mi", "áo thun", "áo dài"];
            function autocomplete(inp, arr) {
                var currentFocus;
                inp.addEventListener("input", function (e) {
                    var a, s, b, i, val = this.value;
                    closeAllLists();
                    if (!val) {
                        return false;
                    }
                    currentFocus = -1;
                    a = document.createElement("DIV");
                    a.setAttribute("id", this.id + "autocomplete-list");
                    a.setAttribute("class", "autocomplete-items");
                    this.parentNode.appendChild(a);
                    s = document.createElement("DIV");
                    s.innerHTML = "<span style='color: #fe4536;'> Tìm shop '" + val + "'<span>";
                    s.addEventListener("click", function (e) {
                        location.href = "SearchShop?kw=" + val;
                    });
                    a.appendChild(s);
                    for (i = 0; i < arr.length; i++) {
                        if (arr[i].substr(0, val.length).toUpperCase() == val.toUpperCase()) {
                            b = document.createElement("DIV");
                            b.innerHTML = "<strong>" + arr[i].substr(0, val.length) + "</strong>";
                            b.innerHTML += arr[i].substr(val.length);
                            b.innerHTML += "<input type='hidden' value='" + arr[i] + "'>";
                            b.addEventListener("click", function (e) {
                                location.href = "SearchProduct?kw=" + this.getElementsByTagName("input")[0].value;
                                closeAllLists();
                            });
                            a.appendChild(b);
                        }
                    }
                });
                inp.addEventListener("keydown", function (e) {
                    var x = document.getElementById(this.id + "autocomplete-list");
                    if (x)
                        x = x.getElementsByTagName("div");
                    if (e.keyCode == 40) {
                        currentFocus++;
                        addActive(x);
                    } else if (e.keyCode == 38) {
                        currentFocus--;
                        addActive(x);
                    } else if (e.keyCode == 13) {
                        e.preventDefault();
                        if (currentFocus > -1) {
                            if (x)
                                x[currentFocus].click();
                        }
                    }
                });
                function addActive(x) {
                    if (!x)
                        return false;
                    removeActive(x);
                    if (currentFocus >= x.length)
                        currentFocus = 0;
                    if (currentFocus < 0)
                        currentFocus = (x.length - 1);
                    x[currentFocus].classList.add("autocomplete-active");
                }
                function removeActive(x) {
                    for (var i = 0; i < x.length; i++) {
                        x[i].classList.remove("autocomplete-active");
                    }
                }
                function closeAllLists(elmnt) {
                    var x = document.getElementsByClassName("autocomplete-items");
                    for (var i = 0; i < x.length; i++) {
                        if (elmnt != x[i] && elmnt != inp) {
                            x[i].parentNode.removeChild(x[i]);
                        }
                    }
                }
                document.addEventListener("click", function (e) {
                    closeAllLists(e.target);
                });
            }

            autocomplete(document.getElementById("myInput"), suggestion);
        </script>
    </body>
</html>
