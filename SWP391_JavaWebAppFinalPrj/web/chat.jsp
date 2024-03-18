<%-- 
    Document   : chat
    Created on : Mar 18, 2024, 3:26:37 PM
    Author     : hien
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Co.Handmade</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="manifest" href="site.html">
        <link rel="shortcut icon" type="image/x-icon" href="img/favicon.png">
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
        <!-- Bootstrap -->
        <!-- CSS -->
        <link rel="stylesheet" href="css/style_chat.css">
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

        <header>
            <div id="header-sticky" class="header-area box-90 pt-1 pb-1">
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
                                        <c:if test="${user.role == 2}">
                                        <li><a href="SellerCentre"><i class="flaticon-employee"></i> Shop của tôi</a></li>
                                        </c:if>
                                </ul>
                                <h4>Danh mục</h4>
                                <ul>
                                    <c:forEach var="cate" items="${sessionScope.main_category_list}">
                                        <li><a href="SearchProduct?cate=${cate.id}"><i class="flaticon-shopping-cart-1"></i> ${cate.name}</a></li>
                                        </c:forEach>

                                </ul>
                            </div>
                        </div>
                        <div class="col-xl-7 col-lg-6 col-md-6 col-5 col-sm-7 pl-0">
                            <div class="header-right f-right">
                                <ul>
                                    <li class="search-btn">
                                        <form autocomplete="off" action="SearchProduct" class="shop-search">
                                            <div class="autocomplete" style="width: 500px;">
                                                <input id="myInput" type="text" name='kw' placeholder="Tìm kiếm..." style="width: 500px;height: 50px" value="${sessionScope.kw}" oninput="checkTextField()">
                                            </div>
                                            <button id="btn-search" type="submit" style="height: 50px; width: 50px" disabled="">
                                                <i class="fa fa-search"></i>
                                            </button>
                                        </form>
                                    </li>
                                    <li class="login-btn">
                                        <c:if test="${sessionScope.user == null}">
                                            <a href="login.jsp"><i class="far fa-user"></i></a>
                                            <ul class="submenu">

                                                <li >
                                                    <a href="login.jsp">Login</a>
                                                </li>
                                                <li>
                                                    <a href="register.jsp">Register</a>
                                                </li>

                                            </ul>
                                        </c:if>
                                        <c:if test="${sessionScope.user != null}">
                                            <a href="profile.jsp"><i class="far fa-user"></i></a>
                                            <ul class="submenu" style="margin-left: -150px;">
                                                <li  style="font-size: 16px;">Chào <b>${sessionScope.user.username}</b>!</li>
                                                <li>
                                                    <a href="profile.jsp">Tài khoản</a>
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
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-3 col-xl-3 chat" style="padding-right: 0; padding-left: 0;"><div class="card mb-sm-3 mb-md-0 contacts_card">
                        <div class="card-header" style="background: #fff">
                            <div class="input-group">
                                <input type="text" placeholder="Tìm kiếm..." name="" class="form-control search">
                                <div class="input-group-prepend">
                                    <span class="input-group-text search_btn"><i class="fas fa-search"></i></span>
                                </div>
                            </div>
                        </div>
                        <div class="card-body contacts_body">
                            <ui class="contacts">
                                <li class="active">
                                    <div class="d-flex bd-highlight">
                                        <div class="img_cont">
                                            <img src="https://cdn.sforum.vn/sforum/wp-content/uploads/2023/10/avatar-trang-4.jpg" class="rounded-circle user_img">
                                        </div>
                                        <div class="user_info">
                                            <span>A</span>
                                            <p>text</p>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="d-flex bd-highlight">
                                        <div class="img_cont">
                                            <img src="https://cdn.sforum.vn/sforum/wp-content/uploads/2023/10/avatar-trang-4.jpg" class="rounded-circle user_img">
                                        </div>
                                        <div class="user_info">
                                            <span>B</span>
                                            <p>text</p>
                                        </div>
                                    </div>
                                </li>

                            </ui>
                        </div>
                        <div class="card-footer"></div>
                    </div></div>
                <div class="col-lg-9 col-xl-9 chat" style="padding-right: 0; padding-left: 0;">
                    <div class="card">
                        <div class="card-header msg_head" style="background: #fff">
                            <div class="d-flex bd-highlight">
                                <div class="img_cont">
                                    <img src="https://cdn.sforum.vn/sforum/wp-content/uploads/2023/10/avatar-trang-4.jpg" class="rounded-circle user_img">
                                </div>
                                <div class="user_info">
                                    <span>A</span>
                                </div>
                            </div>
                            <span id="action_menu_btn"><i class="fas fa-ellipsis-v"></i></span>
                            <div class="action_menu">
                                <ul>
                                    <li></li>
                                </ul>
                            </div>
                        </div>
                        <div class="card-body msg_card_body">
                            <div class="d-flex justify-content-start mb-4">
                                <div class="img_cont_msg">
                                    <img src="https://cdn.sforum.vn/sforum/wp-content/uploads/2023/10/avatar-trang-4.jpg" class="rounded-circle user_img_msg">
                                </div>
                                <div class="msg_cotainer">
                                    HI
                                    <span class="msg_time">5:57</span>
                                </div>
                            </div>
                            <div class="d-flex justify-content-end mb-4">
                                <div class="msg_cotainer_send">
                                    HI
                                    <span class="msg_time_send">5:57</span>
                                </div>
                                <div class="img_cont_msg">
                                    <img src="https://cdn.sforum.vn/sforum/wp-content/uploads/2023/10/avatar-trang-4.jpg" class="rounded-circle user_img_msg">
                                </div>
                            </div>
                        </div>
                        <div class="card-footer">
                            <div class="input-group">
                                <div class="input-group-append">
                                    <span class="input-group-text attach_btn"><i class="fas fa-paperclip"></i></span>
                                </div>
                                <textarea name="" class="form-control type_msg" placeholder="Nhập nội dung tin nhắn..."></textarea>
                                <div class="input-group-append">
                                    <span class="input-group-text send_btn"><i class="fas fa-location-arrow"></i></span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </body>
    <!-- JS here -->
    <script src="js/vendor/jquery-1.12.4.min.js"></script>
    <script src="js/jquery-ui.js"></script>
    <script src="js/popper.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
    <script src="js/owl.carousel.min.js"></script>
    <script src="js/isotope.pkgd.min.js"></script>
    <script src="js/slick.min.js"></script>
    <script src="js/jquery.meanmenu.min.js"></script>
    <script src="js/ajax-form.js"></script>
    <script src="js/wow.min.js"></script>
    <script src="js/jquery.scrollUp.min.js"></script>
    <script src="js/jquery.final-countdown.min.js"></script>
    <script src="js/imagesloaded.pkgd.min.js"></script>
    <script src="js/jquery.magnific-popup.min.js"></script>
    <script src="js/plugins.js"></script>
    <script src="js/main.js"></script>
    <script>
        var suggestion = [];
        <c:forEach var="scate" items="${sessionScope.shop_category_list}">
        suggestion.push("${scate.name}");
        </c:forEach>
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

        var input = document.getElementById("myInput");
        input.addEventListener("keydown", function (event) {
            if (event.keyCode == 13) {
                event.preventDefault();
                document.getElementById("btn-search").click();
            }
        });

        function checkTextField() {
            if ($.trim($('#myInput').val()) !== "")
            {
                $('#btn-search').removeAttr("disabled");
            } else {
                $("#btn-search").prop("disabled", true);
            }
        }
    </script>
</html>

