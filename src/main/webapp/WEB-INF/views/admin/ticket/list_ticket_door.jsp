<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
    <title>Danh sách vé vào cửa</title>
    <%@include file="/WEB-INF/views/layouts/admin/head_tag.jsp" %>
</head>

<body id="page-top">
<div id="wrapper">
    <div class="d-flex flex-column" id="content-wrapper">
        <div id="content">
            <%@include file="/WEB-INF/views/layouts/admin/header.jsp" %>
            <div class="container-fluid">
                <div class="card shadow">
                    <div class="card-header py-3" style="display: flex;">
                        <p class="text-primary m-0 fw-bold" style="width: 90%;/*font-weight: 400;*/text-align: left;margin-top: auto;margin-bottom: auto;">Danh sách vé vào cửa</p>
                        <a class="btn btn-primary" a data-bs-toggle="modal" data-bs-target="#ticket-door" style="font-weight: 700;">Thêm mới </a>
                    </div>
                    <div class="card-body">
                        <div class="row">
                            <div class="col-md-6 text-nowrap">
                                <div id="dataTable_length" class="dataTables_length" aria-controls="dataTable">
                                    <label class="form-label">Show&nbsp;
                                        <select class="d-inline-block form-select form-select-sm">
                                            <option value="10" selected="">10</option>
                                            <option value="25">25</option>
                                            <option value="50">50</option>
                                            <option value="100">100</option>
                                        </select>&nbsp;
                                    </label>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="text-md-end dataTables_filter" id="dataTable_filter"><label class="form-label"><input type="search" class="form-control form-control-sm" aria-controls="dataTable" placeholder="Search"></label></div>
                            </div>
                        </div>
                        <div class="table-responsive table mt-2" id="dataTable" role="grid" aria-describedby="dataTable_info">
                            <table class="table my-0" id="dataTable">
                                <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Tên vé</th>
                                    <th>Loại vé</th>
                                    <th>Giá vé</th>
                                    <th>Hạn sử dụng</th>
                                    <th>Trạng thái</th>
                                    <th>Ngày tạo</th>
                                    <th>Thao tác</th>
                                </tr>
                                </thead>
                                <tbody>
                                <c:if test="${not empty tickets}">

                                    <c:forEach items="${tickets}" var="tickets">

                                        <tr>
                                            <td class="ticket_id"><count></count></td>
                                            <td class="ticket_name">${tickets.t_name}</td>
                                            <td>${tickets.tt_name}</td>
                                            <td class="ticket_price">${tickets.t_price}</td>
                                            <td class="ticket_day"><span>${tickets.t_total_days}</span> ngày</td>
                                            <td>
                                                <c:if test="${tickets.t_status == 1}">Đang bán</c:if>
                                            </td>
                                            <td class="ticket_date">${tickets.create_date}</td>

                                            <td>
                                                <c:if test="${tickets.tt_id != 1}">
                                                    <a class="ticket-add">
                                                        <i class="fas fa-plus-circle fa-lg fa-fw me-2 text-primary" title="Thêm HLV"></i></a>
                                                    <a class="ticket-add">
                                                        <i class="fas fa-bookmark fa-lg fa-fw me-2 text-primary" title="Thêm HLV"></i></a>
                                                </c:if>
                                                <a class="ticket-delete">
                                                    <i class="fas fa-trash fa-lg fa-fw me-2 text-danger" title="Xóa vé"></i></a>
                                            </td>
                                        </tr>

                                    </c:forEach>
                                </c:if>
                                </tbody>
                            </table>
                        </div>
                        <div class="row">
                            <div class="col-md-6 align-self-center">
                                <p>Tổng số bản ghi: 4</p>
                            </div>
                            <div class="col-md-6">

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%--<%@include file="/WEB-INF/views/layouts/admin/modal_tickets.jsp"%>--%>
        <%@include file="/WEB-INF/views/layouts/admin/footer.jsp"%>
    </div>
</div>

</body>
<script src="<c:url value='/assets/js/jquery.min.js'/>"></script>
<script>

    $(document).ready(function () {

        $("#ticket_table").on('click', '.ticket_delete', function () {
            var ids = $(this).parent().siblings('.ticket_id').text();
            const row = $(this).closest('tr');
            Swal.fire({
                title: 'Bạn muốn xóa vé này chứ?',
                showDenyButton: true,
                confirmButtonText: 'Xóa',
                denyButtonText: 'Hoạc tác',
            }).then((result) => {
                /* Read more about isConfirmed, isDenied below */
                if(result.isConfirmed){
                $.ajax({
                    type: 'DELETE',
                    url: '<c:url value="/admin/ticket-management/" />' + ids,
                    success: function (result) {
                        row.remove();
                        Swal.fire('Vé đã được xóa!', '', 'success')
                    },
                    error: function (error) {
                        Swal.fire('Lỗi hệ thống', '', 'warning')
                        console.log(error);
                    }
                });
            }else if (result.isDenied) {
                Swal.fire('Hành động của bạn đã được thu hồi', '', 'info')
            }
        })
        });

    })

</script>

</html>


