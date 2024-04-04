<%-- 
    Document   : register
    Created on : Jan 17, 2024, 9:29:27 PM
    Author     : hien
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!doctype html>
<html class="no-js" lang="zxx">

    <!-- Mirrored from wphix.com/template/vue/vue/register.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 21 Oct 2023 08:30:50 GMT -->
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Co.Handmade - Register</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="manifest" href="site.html">
        <link rel="shortcut icon" type="image/x-icon" href="img/favicon.png">
        <!-- Place favicon.ico in the root directory -->

        <!-- CSS here -->
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/owl.carousel.min.css">
        <link rel="stylesheet" href="css/animate.min.css">
        <link rel="stylesheet" href="css/magnific-popup.css">
        <link rel="stylesheet" href="css/fontawesome-all.min.css">
        <link rel="stylesheet" href="css/flaticon.css">
        <link rel="stylesheet" href="css/meanmenu.css">
        <link rel="stylesheet" href="css/jquery-ui.css">
        <link rel="stylesheet" href="css/meanmenu.css">
        <link rel="stylesheet" href="css/slick.css">
        <link rel="stylesheet" href="css/default.css">
        <link rel="stylesheet" href="css/style.css">
        <link rel="stylesheet" href="css/responsive.css">
    </head>
    <body>

        <!-- header start -->
        <jsp:include page="header.jsp"></jsp:include>
            <!-- header end -->


            <main>

                <!-- breadcrumb-area-start -->
                <section class="breadcrumb-area" data-background="img/bg/page-title.png">
                    <div class="container">
                        <div class="row">
                            <div class="col-xl-12">
                                <div class="breadcrumb-text text-center">
                                    <h1>Register</h1>
                                    <ul class="breadcrumb-menu">
                                        <li><a href="Home">Home</a></li>
                                        <li><span>Register</span></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <!-- breadcrumb-area-end -->

                <!-- login Area Strat-->
                <section class="login-area pt-100 pb-100">
                    <div class="container">
                        <div class="row">
                            <div class="col-lg-8 offset-lg-2">
                                <div class="basic-login">
                                    <h3 class="text-center mb-60">Signup From Here</h3>
                                    <form method="get"action="register" onsubmit="return validateForm()">
                                        <label for="name">Username <span>**</span></label>
                                        <input id="name" type="text" placeholder="Enter Username..." name="username" oninput="checkTextField();"/>
                                        <label for="email-id">Email Address <span>**</span></label>
                                        <input id="email-id" type="email" placeholder="Enter Email address..." name="email" oninput="checkTextField();"/>
                                        <label for="pass">Password <span>**</span></label>
                                        <input id="pass" type="password" placeholder="Enter password..." name="password" oninput="checkTextField();"/>
                                        <label for="cpass">Confirm Password <span>**</span></label>
                                        <input id="cpass" type="password" placeholder="Enter confirm password..." name="password" oninput="checkTextField();"/>
                                        <div class="mt-10"></div>
                                        <button id="btn-register" class="btn theme-btn-2 w-100" disabled="">Register Now</button>
                                    </form>
                                    <div class="or-divide"><span>or</span></div>
                                    <button class="btn theme-btn w-100 white-btn" style="color: black; border-style: solid;" onclick="document.getElementById('gg-register').click()"><div href="https://accounts.google.com/o/oauth2/auth?scope=email profile&redirect_uri=&response_type=code
                                                                                                                                                                                           &client_id=&approval_prompt=force"class=""><i class="fab fa-google"></i> <a id="gg-register" href="https://accounts.google.com/o/oauth2/auth?scope=email profile&redirect_uri=http://localhost:8080/SWP391_JavaWebAppFinalPrj/GoogleLoginServlet&response_type=code
                                                                                                                    &client_id=499463704763-03misrvo3p2d4f08tsr3c430k921auk9.apps.googleusercontent.com&approval_prompt=force">Continue with Google</a></div></button>
                                    <div class="text-center mt-30">Have an account? <a href="register.jsp" style="text-decoration: underline;">Login</a></div>

                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <!-- login Area End-->


            </main>

            <!-- footer start -->
        <jsp:include page="footer.jsp"></jsp:include>
        <!-- footer end -->

        <script>

            function checkTextField() {
                if ($.trim($('#name').val()) != "" &&
                        $.trim($('#email-id').val()) != "" &&
                        $('#pass').val() != "" &&
                        $('#cpass').val() != "")
                {
                    $('#btn-register').removeAttr("disabled");
                } else {
                    $("#btn-register").prop("disabled", true);
                }
            }
            function validateForm() {
                var newPassword = document.getElementById('pass').value;
                var reenterPassword = document.getElementById('cpass').value;
                if (newPassword !== reenterPassword) {
                    alert('Passwords do not match. Please reenter your new password.');
                    document.getElementById('cpass').focus();
                    return false; // Prevent form submission
                } else {
                    return true;
                }
                // If the passwords match, the form will be submitted
            }
        </script>
    </body>

    <!-- Mirrored from wphix.com/template/vue/vue/register.html by HTTrack Website Copier/3.x [XR&CO'2014], Sat, 21 Oct 2023 08:30:50 GMT -->
</html>

