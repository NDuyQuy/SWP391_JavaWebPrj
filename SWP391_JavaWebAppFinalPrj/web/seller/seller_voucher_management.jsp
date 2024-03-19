<%-- 
    Document   : shopcategory_management
    Created on : Feb 27, 2024, 8:49:17 PM
    Author     : ASUS
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js" lang="zxx">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <title>Co.Handmade Shop Vouchers Management</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="manifest" href="site.html">
        <link rel="shortcut icon" type="image/x-icon" href="../img/favicon.png">
        <!-- Place favicon.ico in the root directory -->

        <!-- CSS here -->
        <link rel="stylesheet" href="../css/bootstrap.min.css">
        <link rel="stylesheet" href="../css/owl.carousel.min.css">
        <link rel="stylesheet" href="../css/animate.min.css">
        <link rel="stylesheet" href="../css/magnific-popup.css">
        <link rel="stylesheet" href="../css/fontawesome-all.min.css">
        <link rel="stylesheet" href="../css/flaticon.css">
        <link rel="stylesheet" href="../css/meanmenu.css">
        <link rel="stylesheet" href="../css/jquery-ui.css">
        <link rel="stylesheet" href="../css/meanmenu.css">
        <link rel="stylesheet" href="../css/slick.css">
        <link rel="stylesheet" href="../css/default.css">
        <link rel="stylesheet" href="../css/style.css">
        <link rel="stylesheet" href="../css/responsive.css">
    </head>
    <body>
        <jsp:include page="../header.jsp"></jsp:include>
            <main>
                <section>
                    <div class="container">
                        <div class="row">
                            <div class="text-left">
                                <h3>Mã giảm giá của shop</h3>
                            </div>
                        </div>
                    </div>
                </section>
                <section>
                    <div>
                        <div class="d-flex bg-light p-3">
                            <div class="card" style="width: 20%; margin-right: 50px;" onclick="location.href = 'sellersvouchercontroller?open=create'">
                                <div class="card-body">
                                    <h5 class="card-title">Voucher toàn shop</h5>
                                    <p class="card-text">Voucher áp dụng cho tất cả sản phẩm trong shop của bạn</p>
                                    <a href="sellersvouchercontroller?open=create" class="btn btn-primary d-flex justify-content-center" style="width: 100%;">Tạo voucher</a>
                                </div>
                            </div>

                            <div class="card" style="width: 20%;" onclick="location.href = 'sellersvouchercontroller?open=create'">
                                <div class="card-body">
                                    <h5 class="card-title">Voucher sản phẩm</h5>
                                    <p class="card-text">Voucher chỉ áp dụng cho một sản phẩm cụ thể mà shop chọn</p>
                                    <a href="sellersvouchercontroller?open=create" class="btn btn-primary d-flex justify-content-center" style="width: 100%;">Tạo voucher</a>
                                </div>
                            </div>
                        </div>
                        <h3>Danh sách mã giảm giá</h3>
                        <nav class="navbar navbar-expand-sm bg-light navbar-light">
                            <ul class="navbar-nav">
                                <li class="nav-item">
                                    <a class="nav-link active" href="#">Tất cả</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#">Đang diễn ra</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#">Đã kết thúc</a>
                                </li>
                            </ul>
                        </nav>
                        <table class="table table-bordered">
                            <thead>
                                <tr> 
                                    <th>Mã Voucher</th>
                                    <th>Loại voucher</th>
                                    <th>Giảm giá</th>
                                    <th>Giá trị áp dụng tối thiểu</th>
                                    <th>Số lượt còn sử dụng tối đa</th>
                                    <th>Sửa</th>
                                    <th>Xóa</th>
                                </tr>
                            </thead>
                            <tbody> 
                            <c:forEach var="s" items="${sessionScope.vouchers}">
                                <tr> 
                                    <td><c:out value="${s.code.substring(2)}"/></td>
                                    <td><c:out value="${(s.type eq 2) ? 'Voucher sản phẩm' : 'Voucher toàn shop'}"/></td>
                                    <td><c:out value="${s.discount_amount}"/></td>
                                    <td><c:out value="${s.min_require}"/></td>
                                    <td><c:out value="${s.use_count}"/></td>
                                    <td>
                                        <a href="sellersvouchercontroller?open=edit&v_id=${s.voucher_id}" class="edit-link" style="color: blue; cursor: pointer;">Edit</a>
                                    </td>
                                    <td>
                                        <a class="delete-link" style="color: red; cursor: pointer;" onclick="openPopup('delete',${s.voucher_id})">Delete</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody> 
                    </table>
                </div>
            </section>
        </main>
        <jsp:include page="../footer.jsp"></jsp:include>
        <!-- Delete Category Popup-->
        <div class="modal" id="deletePopup">
            <div class="modal-dialog">
                <div class="modal-content">

                    <div class="modal-header">
                        <h4 class="modal-title">Delete Voucher</h4>
                        <button type="button" class="close" data-dismiss="modal" onclick="closePopup('delete')">&times;</button>
                    </div>

                    <div class="modal-body">
                        <form action="sellersvouchercontroller" method="post">
                            <div class="form-group">
                                <input type="hidden" name="act" value ="delete">
                                <p class="form-control">Do you sure you want to delete this voucher?</p>
                                <input type="hidden" name="voucherId" id="deleteVoucherId">
                            </div>
                            <button type="submit" class="btn btn-primary">Yes</button>
                            <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="closePopup('delete')">Cancel</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>  
    </body>
    <!-- JavaScript to control the display of the popups -->
    <script>
        function openPopup(type, voucherId) {
            if (type === 'delete') {
                document.getElementById('deleteVoucherId').setAttribute('value', voucherId);
            }
            $('#' + type + 'Popup').modal('show');
        }

        function closePopup(type) {
            $('#' + type + 'Popup').modal('hide');
        }
    </script>
    <script>
        document.addEventListener('DOMContentLoaded', function () {
            // Get all nav links
            var navLinks = document.querySelectorAll('.navbar-nav .nav-link');

            // Add click event listener to each nav link
            navLinks.forEach(function (link) {
                link.addEventListener('click', function () {
                    // Remove the 'active' class from all links
                    navLinks.forEach(function (navLink) {
                        navLink.classList.remove('active');
                    });

                    // Add the 'active' class to the clicked link
                    link.classList.add('active');
                });
            });
        });
    </script>

    <!-- JS here -->
    <script src="../js/vendor/jquery-1.12.4.min.js"></script>
    <script src="../js/jquery-ui.js"></script>
    <script src="../js/popper.min.js"></script>
    <script src="../js/bootstrap.min.js"></script>
    <script src="../js/owl.carousel.min.js"></script>
    <script src="../js/isotope.pkgd.min.js"></script>
    <script src="../js/slick.min.js"></script>
    <script src="../js/jquery.meanmenu.min.js"></script>
    <script src="../js/ajax-form.js"></script>
    <script src="../js/wow.min.js"></script>
    <script src="../js/jquery.scrollUp.min.js"></script>
    <script src="../js/jquery.final-countdown.min.js"></script>
    <script src="../js/imagesloaded.pkgd.min.js"></script>
    <script src="../js/jquery.magnific-popup.min.js"></script>
    <script src="../js/plugins.js"></script>
    <script src="../js/main.js"></script>
</html>


