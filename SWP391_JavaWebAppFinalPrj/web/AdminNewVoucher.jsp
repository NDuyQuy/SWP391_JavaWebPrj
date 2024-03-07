<%-- 
    Document   : AdminNewVoucher
    Created on : Mar 4, 2024, 3:41:58 PM
    Author     : DELL
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Co.Handmade Add New Voucher</title>
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
        <link rel="stylesheet" href="css/png.css">
    </head>
    <body>
        <jsp:include page="header.jsp"></jsp:include>
        
        <main>
                <!-- breadcrumb-area-start -->
                <section class="breadcrumb-area" data-background="img/bg/page-title.png">
                    <div class="container">
                        <div class="row">
                            <div class="col-xl-12">
                                <div class="breadcrumb-text text-center">
                                    <h1>Voucher Management</h1>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <!-- breadcrumb-area-end -->

                <!--  Area Strat-->
                <section class="login-area pt-100 pb-100">
                    <div class="container">
                    
                        <div>
                            <form method="post" action="AdminServlet?Action=AddNewVoucher">
                                <label for="code">Voucher Code<span>*</span>: </label>
                                <input id="code" type="text" placeholder="Enter Voucher Code" name="vouchercode" required/>
                                
                                <label for="amount">Discount Amount<span>*</span>: </label>
                                <input id="amount" type="number" name="amount" step="1000" required/>
                                
                                <label for="unit">Discount Unit<span>*</span>: </label>
                                <select id="unit" name="unit" onchange="changeUnit()" required>
                                    <option value="VND">VND</option>
                                    <option value="Percent">%</option>
                                </select>
                                
                                
                                <label for="expdate">Exp. Date<span>*</span>: </label>
                                <input id="expdate" type="datetime-local" name="expdate" required/>
                                
                                <label for="min">Min. Value of Bill<span>*</span>: </label>
                                <input id="min" type="number" name="min" step="10000" required/>
                                
                                <label for="count">Use Times Remaining<span>*</span>: </label>
                                <input id="count" type="number" name="count" step="1" required/>
                                
                                
                                <label for="addDescription">Description<span>*</span>: </label>
                                <textarea class="form-control" rows="4" id="addDescription" name="description" placeholder="Enter Description"></textarea>
                                
                                
                                <input type="hidden" name="categoryId" id="listCategoryId">
                                
                                <div class="mt-10"></div>
                                <button class="btn theme-btn-2 w-100">Update</button>
                            </form>
                        </div>
                    
                    
                    
                    
                    
                        
                        
                </div>

            </section>
            <!-- login Area End-->


        </main>
                    
        <jsp:include page="footer.jsp"></jsp:include>
        <!-- Bootstrap JS and jQuery -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
        <!-- JavaScript to control the display of the popups -->
        <script>
            
            
            function changeUnit() {
                var u;
                u = document.getElementById('unit').value;
                if (u === 'VND') {
                    document.getElementById('amount').value = 0;
                    document.getElementById('amount').setAttribute("step", 1000);
                }
                if (u === 'Percent') {
                    document.getElementById('amount').value = 0;
                    document.getElementById('amount').setAttribute("step", 1);
                }
            }
        </script>
        
        
    </body>
</html>
