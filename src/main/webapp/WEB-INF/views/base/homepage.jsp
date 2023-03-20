
<%--
  Created by IntelliJ IDEA.
  User: hieuhm
  Date: 20/02/2023
  Time: 5:34 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: hieuhm
  Date: 20/02/2023
  Time: 5:34 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Trang chủ</title>
    <link rel="stylesheet" href="<c:url value='/assets/bootstrap/css/bootstrap.min.css'/>">
    <link rel="stylesheet" href="<c:url value='/assets/css/homepagestyle.css'/>">
    <link rel="stylesheet" href="<c:url value='/assets/fonts/fontawesome-all.min.css'/>">
</head>
<body>
<nav class="navbar navbar-light navbar-expand-md fixed-top navbar-shrink py-3" id="mainNav">
    <div class="container"><a class="navbar-brand d-flex align-items-center" href="homepage.jsp"><img src="/assets/img/dogs/logo.png"></a><button data-bs-toggle="collapse" class="navbar-toggler" data-bs-target="#navcol-1"><span class="visually-hidden">Toggle navigation</span><span class="navbar-toggler-icon"></span></button>
        <div class="collapse navbar-collapse" id="navcol-1">
            <ul class="navbar-nav mx-auto">
                <li class="nav-item"><a class="nav-link active" href="homepage.jsp">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="#">PT-HLV</a></li>
                <li class="nav-item"><a class="nav-link" href="#">Sản Phẩm</a></li>
                <li class="nav-item"><a class="nav-link" href="#">Lịch Tập</a></li>
                <li class="nav-item"><a class="nav-link" href="#">Dịch vụ</a></li>
            </ul>
            <button class="btn btn-dark" onclick="checkIn()" style="width: 135px;">
                Check In <span class="tick">&#10004;</span>
            </button>
        </div>
        <div class="container-fluid">
            <ul class="navbar-nav flex-nowrap ms-auto">
                <div class="d-none d-sm-block topbar-divider"></div>
                <li class="nav-item dropdown no-arrow">
                    <div class="nav-item dropdown no-arrow">
                        <a class="dropdown-toggle nav-link" aria-expanded="false" data-bs-toggle="dropdown" href="#">
                            <span class="d-none d-lg-inline me-2 text-gray-600 small">Đức Lương</span>
                            <img class="border rounded-circle img-profile" src="/assets/img/avatars/avatar5.jpeg" />
                        </a>
                        <div class="dropdown-menu shadow dropdown-menu-end animated-grow-in">
                            <a class="dropdown-item" href="#">
                                <i class="fas fa-user fa-sm fa-sw me-2 text-gray-400"> Profile</i>
                            </a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">
                                <i class="fas fa-sign-out-alt fa-sm fa-fw me-2 text-gray-400"> Log out</i>
                            </a>
                        </div>
                    </div>
                </li>
            </ul>
        </div>
    </div>
</nav>
<header class="pt-5">
    <div class="container pt-4">
        <div class="col-md-8 text-center text-md-start mx-auto">
            <p class="text-light mb-5 h1">HÃY TĂNG CƯỜNG CƠ THỂ VÀ THỂ CHẤT CÙNG CÁC HLV CHUYÊN NGHIỆP</p>
            <button class="btn btn-primary">Đến Ngay</button>
        </div>
    </div>
</header>
<section class="navbar-brand">
    <div class="container py-4">
        <div class="py-1">
            <p class="text-dark float-start" style="font-size: 30px;">NHIỀU GÓI COMBO HẤP DẪN</p>
            <button class="btn btn-primary float-end">Đến ngay</button>
        </div>
    </div>
</section>
<section class="py-4">
    <div class="container pt-4">
        <div class="col-md-8 text-center text-md-start mx-auto">
            <p class="text-light mb-5 h1">NHỮNG DỊCH VỤ TỐT NHẤT CHO KHÁCH HÀNG</p>
            <button class="btn btn-primary">Đến Ngay</button>
        </div>
    </div>
</section>
<section class="py-5 bg-dark">
    <div class="container py-4 py-xl-5">
        <div class="row mb-5">
            <div class="col-md-8 col-xl-6 text-center mx-auto">
                <h2 class="display-6 fw-bold mb-4 text-light">GIÁ VÉ</h2>
            </div>
        </div>
        <div class="row gy-4 row-cols-1 row-cols-md-2 row-cols-lg-3">
            <div class="col vengay">
                <div class="card border-0 h-100">
                    <div class="card-body d-flex flex-column justify-content-between p-4">
                        <div>
                            <h6 class="fw-bold text-muted">Vé Ngày</h6>
                            <h4 class="display-5 fw-bold mb-4">$15</h4>
                            <ul class="list-unstyled">
                                <li class="d-flex mb-2"><span class="bs-icon-xs bs-icon-rounded bs-icon me-2"><svg
                                        xmlns="http://www.w3.org/2000/svg" width="1em" height="1em"
                                        viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none"
                                        stroke-linecap="round" stroke-linejoin="round"
                                        class="icon icon-tabler icon-tabler-check fs-5 text-primary">
                                                <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                                                <path d="M5 12l5 5l10 -10"></path>
                                            </svg></span><span>Trải nghiệm 24h</span></li>
                                <li class="d-flex mb-2"><span class="bs-icon-xs bs-icon-rounded bs-icon me-2"><svg
                                        xmlns="http://www.w3.org/2000/svg" width="1em" height="1em"
                                        viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none"
                                        stroke-linecap="round" stroke-linejoin="round"
                                        class="icon icon-tabler icon-tabler-check fs-5 text-primary">
                                                <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                                                <path d="M5 12l5 5l10 -10"></path>
                                            </svg></span><span>HLV cá nhân</span></li>
                                <li class="d-flex mb-2"><span class="bs-icon-xs bs-icon-rounded bs-icon me-2"><svg
                                        xmlns="http://www.w3.org/2000/svg" width="1em" height="1em"
                                        viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none"
                                        stroke-linecap="round" stroke-linejoin="round"
                                        class="icon icon-tabler icon-tabler-check fs-5 text-primary">
                                                <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                                                <path d="M5 12l5 5l10 -10"></path>
                                            </svg></span><span>Tủ đồ + Phòng tắm</span></li>
                            </ul>
                        </div><a class="btn btn-primary" id="btn_dayticket" role="button" data-bs-toggle="modal" data-bs-target="#dayticketinfor">ĐẶT NGAY</a>
                    </div>
                </div>
            </div>

            <div class="col vethang">
                <div class="card border-warning border-2 h-100">
                    <div class="card-body d-flex flex-column justify-content-between p-4"><span
                            class="badge bg-warning position-absolute top-0 end-0 rounded-bottom-left text-uppercase text-primary">Most
                                Popular</span>
                        <div>
                            <h6 class="fw-bold text-muted">Vé tháng</h6>
                            <h4 class="display-5 fw-bold mb-4">$38</h4>
                            <ul class="list-unstyled">
                                <li class="d-flex mb-2"><span class="bs-icon-xs bs-icon-rounded bs-icon me-2"><svg
                                        xmlns="http://www.w3.org/2000/svg" width="1em" height="1em"
                                        viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none"
                                        stroke-linecap="round" stroke-linejoin="round"
                                        class="icon icon-tabler icon-tabler-check fs-5 text-primary">
                                                <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                                                <path d="M5 12l5 5l10 -10"></path>
                                            </svg></span><span>Trải nghiệm 24h</span></li>
                                <li class="d-flex mb-2"><span class="bs-icon-xs bs-icon-rounded bs-icon me-2"><svg
                                        xmlns="http://www.w3.org/2000/svg" width="1em" height="1em"
                                        viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none"
                                        stroke-linecap="round" stroke-linejoin="round"
                                        class="icon icon-tabler icon-tabler-check fs-5 text-primary">
                                                <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                                                <path d="M5 12l5 5l10 -10"></path>
                                            </svg></span><span>HLV cá nhân</span></li>
                                <li class="d-flex mb-2"><span class="bs-icon-xs bs-icon-rounded bs-icon me-2"><svg
                                        xmlns="http://www.w3.org/2000/svg" width="1em" height="1em"
                                        viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none"
                                        stroke-linecap="round" stroke-linejoin="round"
                                        class="icon icon-tabler icon-tabler-check fs-5 text-primary">
                                                <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                                                <path d="M5 12l5 5l10 -10"></path>
                                            </svg></span><span>Tủ đồ + Phòng tắm</span></li>
                            </ul>
                        </div><a class="btn btn-warning" id="btn_monthticket" role="button" data-bs-toggle="modal" data-bs-target="#monthticketinfor">ĐẾN NGAY</a>
                    </div>
                </div>
            </div>
            <div class="col venam">
                <div class="card border-0 h-100">
                    <div class="card-body d-flex flex-column justify-content-between p-4">
                        <div class="pb-4">
                            <h6 class="fw-bold text-muted">Vé năm</h6>
                            <h4 class="display-5 fw-bold mb-4">$70</h4>
                            <ul class="list-unstyled">
                                <li class="d-flex mb-2"><span class="bs-icon-xs bs-icon-rounded bs-icon me-2"><svg
                                        xmlns="http://www.w3.org/2000/svg" width="1em" height="1em"
                                        viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none"
                                        stroke-linecap="round" stroke-linejoin="round"
                                        class="icon icon-tabler icon-tabler-check fs-5 text-primary">
                                                <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                                                <path d="M5 12l5 5l10 -10"></path>
                                            </svg></span><span>Trải nghiệm 24h</span></li>
                                <li class="d-flex mb-2"><span class="bs-icon-xs bs-icon-rounded bs-icon me-2"><svg
                                        xmlns="http://www.w3.org/2000/svg" width="1em" height="1em"
                                        viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none"
                                        stroke-linecap="round" stroke-linejoin="round"
                                        class="icon icon-tabler icon-tabler-check fs-5 text-primary">
                                                <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                                                <path d="M5 12l5 5l10 -10"></path>
                                            </svg></span><span>HLV cá nhân</span></li>
                                <li class="d-flex mb-2"><span class="bs-icon-xs bs-icon-rounded bs-icon me-2"><svg
                                        xmlns="http://www.w3.org/2000/svg" width="1em" height="1em"
                                        viewBox="0 0 24 24" stroke-width="2" stroke="currentColor" fill="none"
                                        stroke-linecap="round" stroke-linejoin="round"
                                        class="icon icon-tabler icon-tabler-check fs-5 text-primary">
                                                <path stroke="none" d="M0 0h24v24H0z" fill="none"></path>
                                                <path d="M5 12l5 5l10 -10"></path>
                                            </svg></span><span>Tủ đồ + Phòng tắm</span></li>
                            </ul>
                        </div><a class="btn btn-primary" id="btn_yearticket" role="button" data-bs-toggle="modal" data-bs-target="#yearticketinfor">ĐẾN NGAY</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="dayticketinfor" tabindex="-1" aria-labelledby="dayticketModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="dayticketModalLabel">VÉ NGÀY</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="row py-5">
                        <div class="col-md-4">
                            <label class="text-dark h5">Giá vé:</label>
                        </div>
                        <div class="col-md-6">
                            <p class="text-dark h5 ticket-price">${ticket.price} <span>VNĐ</span></p>
                        </div>
                    </div>
                    <div class="row py-5">
                        <div class="col-md-4">
                            <label class="text-dark h5">Ngày bắt đầu:</label>
                        </div>
                        <div class="col-md-6">
                            <span id="day-start-date" class="text-dark h5"></span>
                        </div>
                    </div>
                    <div class="row py-5">
                        <div class="col-md-4">
                            <label class="text-dark h5">Ngày kết thúc:</label>
                        </div>
                        <div class="col-md-6">
                            <span id="day-end-date" class="text-dark h5"></span>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary save">Save</button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="monthticketinfor" tabindex="-1" aria-labelledby="monthticketModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="monthticketModalLabel">VÉ THÁNG</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="row py-5">
                        <div class="col-md-4">
                            <label class="text-dark h5">Giá vé:</label>
                        </div>
                        <div class="col-md-6">
                            <p class="text-dark h5 ticket-price">${ticket.price}<span>VNĐ</span></p>
                        </div>
                    </div>
                    <div class="row py-5">
                        <div class="col-md-4">
                            <label class="text-dark h5">Ngày bắt đầu:</label>
                        </div>
                        <div class="col-md-6">
                            <span id="month-start-date" class="text-dark h5"></span>
                        </div>
                    </div>
                    <div class="row py-5">
                        <div class="col-md-4">
                            <label>Ngày kết thúc:</label>
                        </div>
                        <div class="col-md-6">
                            <span id="month-end-date" class="text-dark h5"></span>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary save">Save</button>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="yearticketinfor" tabindex="-1" aria-labelledby="yearticketModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h1 class="modal-title fs-5" id="yearticketModalLabel">VÉ NĂM</h1>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <div class="row py-5">
                        <div class="col-md-4">
                            <label class="text-dark h5">Giá vé:</label>
                        </div>
                        <div class="col-md-6">
                            <span class="text-dark h5 ticket-price">${ticket.price}<span>VNĐ</span></span>
                        </div>
                    </div>
                    <div class="row py-5">
                        <div class="col-md-4">
                            <label class="text-dark h5">Ngày bắt đầu:</label>
                        </div>
                        <div class="col-md-6">
                            <span id="year-start-date" class="text-dark h5"></span>
                        </div>
                    </div>
                    <div class="row py-5">
                        <div class="col-md-4">
                            <label class="text-dark h5">Ngày kết thúc:</label>
                        </div>
                        <div class="col-md-6">
                            <span id="year-end-date" class="text-dark h5"></span>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    <button type="submit" class="btn btn-primary save">Save</button>
                </div>
            </div>
        </div>
    </div>
</section>
<section class="py-5 bg-dark hlv">
    <div class="container py-4 py-xl-5">
        <div class="row mb-5">
            <div class="col-md-8 col-xl-6 text-center mx-auto">
                <h2 class="display-6 fw-bold mb-4 text-light">HLV CHUYÊN NGHIỆP</h2>
            </div>
        </div>
        <div class="row gy-4 row-cols-1 row-cols-md-2 row-cols-lg-3">
            <div class="col">
                <div class="d-flex justify-content-between p-4">
                    <div class="pb-4">
                        <img class="img-fluid" src="/assets/img/dogs/hlv1.jpg">
                        <h6 class="fw-bold text-light text-center text-bg-info py-2">Hoàng Hiếu</h6>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="d-flex justify-content-between p-4">
                    <div class="pb-4">
                        <img class="img-fluid" src="/assets/img/dogs/hlv2.jpg">
                        <h6 class="fw-bold text-light text-center text-bg-info py-2">Đức Lương</h6>
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="d-flex justify-content-between p-4">
                    <div class="pb-4">
                        <img class="img-fluid mx-auto" src="/assets/img/dogs/hlv3.jpg">
                        <h6 class="fw-bold text-light text-center text-bg-info py-2">Đại Dương</h6>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<footer class="bg-dark">
    <div class="container py-4">
        <div class="row">
            <div class="col-4">
                <img src="/assets/img/dogs/logo.png">
                <p class="text-light text-start h5 mt-3">Chúng tôi cung cấp khả năng thực hiện các hoạt động thể thao: Crossfit, Gym và các hoạt động khác
                    , nhằm cải thiện sức khỏe và sức đề kháng thể chất của bạn, thông qua hệ thống đào tạo chuyên nghiệp 100%.
                </p>
            </div>
            <div class="col-4">
                <p class="text-info text-center h2">INFORMATION</p>
                <p class="text-light text-center h5 mt-5">HOME</p>
                <p class="text-light text-center h5">PT-HLV</p>
                <p class="text-light text-center h5">SẢN PHẨM</p>
                <p class="text-light text-center h5">LỊCH TẬP</p>
                <p class="text-light text-center h5">DỊCH VỤ</p>
            </div>
            <div class="col-4">
                <p class="text-info text-center h2">SUBCRIBE</p>
                <div class="input-group mb-3">
                    <input type="text" class="form-control" placeholder="EMAIL" aria-label="Email" aria-describedby="basic-addon1">
                </div>
                <button class="btn btn-primary">Subcribe</button>
            </div>
        </div>
        <hr />
        <div class="d-flex justify-content-between">
            <p class="text-light">Copyright @ 2023</p>
            <p class="text-light">Hòa Lạc,Thạch Thất, Hà Nội</p>
            <p class="text-light">Hotline: +84 962103669</p>
        </div>
    </div>
</footer>
<script>
    function checkIn() {
        // Lấy thời gian hiện tại
        var now = new Date();

        // Hiển thị thông báo check in thành công và thời gian check in
        alert("Check in thành công! Thời gian check in là: " + now)
    }

</script>
<script src="<c:url value='/assets/bootstrap/js/bootstrap.min.js'/>"></script>
<script src="<c:url value='/assets/js/startup-modern.js'/> "></script>
<script src="<c:url value='/assets/js/ticket.js'/>"></script>
</body>
</html>
