<%-- 
    Document   : shopchat
    Created on : Mar 21, 2024, 8:34:19 PM
    Author     : DELL
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
    
    <body onload="loadChatList()">
        
<!--HEADER, skip this-->
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
                                            <ul class="submenu" style="margin-left: -150px;">

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
                                            

    <!--CHAT SCREEN START FROM HERE-->

        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-3 col-xl-3 chat" style="padding-right: 0; padding-left: 0;"><div class="card mb-sm-3 mb-md-0 contacts_card">
                        
                        <!--SEARCH BAR: Cancelled-->
                        <!--
                        <div class="card-header" style="background: #fff">
                            <div class="input-group">
                                <input type="text" placeholder="Tìm kiếm..." name="SearchTextbox" class="form-control search" onfocus="checkTextField()">
                                <div class="input-group-prepend">
                                    <span class="input-group-text search_btn"><i class="fas fa-search"></i></span>
                                </div>
                            </div>
                        </div>
                        -->
<!--DISPLAY SENDER LIST-->
                        
                        <div class="card-body contacts_body">
                            <ui class="contacts" id="chatlist">
                                
                                <!-- CHAT LIST HERE -->
                                
                                
                                
                            </ui>
                        </div>
                        <div class="card-footer"></div>
                    </div></div>
                
<!--MAIN CHAT BOX-->
                <div class="col-lg-9 col-xl-9 chat" style="padding-right: 0; padding-left: 0;">
                    <div class="card">
                        
                        <!--INFO OF SENDER WHOSE CHAT MESSAGES ARE DISPLAYED-->
                        <div class="card-header" id="msg_head" style="background: #fff">
                            
                            
                        </div>
                        
<!--DISPLAY MESSAGE-->
                        <div class="card-body" id="msg_card_body">
                            <div id="endOfChatBox"></div>
                        </div>
                        
                        
<!--MESSAGE INPUT BOX-->
                        <div class="card-footer">
                            <div class="input-group">
                                
                                <!--IF NEED, ADD INPUT FILE-->
                                <div class="input-group-append">
                                    <span class="input-group-text attach_btn"><i class="fas fa-paperclip"></i></span>
                                </div>
                                
                                <!--TYPE MESSAGE HERE-->
                                <textarea name="" class="form-control" id="type_msg" placeholder="Nhập nội dung tin nhắn..."></textarea>
                                
                                <!--SEND BUTTON-->
                                <div class="input-group-append" onclick="send_msg()">
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
            let thisUserID = -1;

            function loadChatList() {
                $.ajax({
                    url: "/SWP391_JavaWebAppFinalPrj/ShopLoadChatController",
                    type: "POST",
                    data: {
                        Action: "LoadChatList"
                    },
                    success: function(result){
                        document.getElementById("chatlist").innerHTML = result;
                    },
                    error: function (xhr) {
                        //Do Something to handle error
                    }
                });
            }

            function send_msg() {
                var message = document.getElementById("type_msg").value;
                $.ajax({
                    url: "/SWP391_JavaWebAppFinalPrj/ShopChatController",
                    type: "POST",
                    data: {
                        Action: "SendChat",
                        user_id: thisUserID,
                        messageText: message
                    },
                    success: function(result){
                        var endBox = document.getElementById("endOfChatBox");
                        endBox.outerHTML = result;
                        document.getElementById("type_msg").value = "";
                    },
                    error: function (xhr) {
                        //Do Something to handle error
                    }
                });
            }

            function changeChat(userId) {
                thisUserID = userId;
                $.ajax({
                    url: "/SWP391_JavaWebAppFinalPrj/ShopLoadChatController",
                    type: "POST",
                    data: {
                        Action: "LoadChat",
                        user_id: thisUserID
                    },
                    success: function(result){
                        var messageBox = document.getElementById("msg_card_body");
                        messageBox.innerHTML = result;
                    },
                    error: function (xhr) {
                        //Do Something to handle error
                    }
                });
                loadChatInfo();
            }

            function checkUnseen() {
                loadChatList();
                if (thisUserID !== -1) {
                    $.ajax({
                        url: "/SWP391_JavaWebAppFinalPrj/ShopLoadChatController",
                        type: "POST",
                        data: {
                            Action: "LoadChatUnseen",
                            user_id: thisUserID
                        },
                        success: function(result){
                            var endBox = document.getElementById("endOfChatBox");
                            endBox.outerHTML = result;
                        },
                        error: function (xhr) {
                            //Do Something to handle error
                        }
                    });
                }
            }
            
            function loadChatInfo() {
                $.ajax({
                    url: "/SWP391_JavaWebAppFinalPrj/ShopLoadChatController",
                    type: "POST",
                    data: {
                        Action: "LoadChatInfo",
                        user_id: thisUserID
                    },
                    success: function(result){
                        var infoBox = document.getElementById("msg_head");
                        infoBox.innerHTML = result;
                    },
                    error: function (xhr) {
                        //Do Something to handle error
                    }
                });
            }
            
            var myVar = setInterval(checkUnseen, 2500);
        </script>
</html>
