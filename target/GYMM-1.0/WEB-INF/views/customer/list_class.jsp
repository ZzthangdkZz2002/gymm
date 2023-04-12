<%--
  Created by IntelliJ IDEA.
  User: a5nam
  Date: 4/6/2023
  Time: 12:05 AM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<section class="wrapper">
    <div class="container-fostrap">
        <div>
            <h1 class="heading">
                Lớp học
            </h1>
        </div>
        <div class="content">
            <div class="container">
                <div id="show-ticket-class">
                    <div class="row" id="show-class">

                        <c:forEach items="${tickets}" var="tickets">
                            <c:if test="${tickets.tt_id == 3}">
                                <div class="col-xs-12 col-sm-4">
                                    <div class="card">
                                        <h4 class="ticket_class_id" style="display: none" aria-readonly="true">${tickets.t_id}</h4>
                                        <a class="img-card" href="http://www.fostrap.com/2016/03/bootstrap-3-carousel-fade-effect.html">
                                            <img src="https://1.bp.blogspot.com/-Bii3S69BdjQ/VtdOpIi4aoI/AAAAAAAABlk/F0z23Yr59f0/s640/cover.jpg" />
                                        </a>
                                        <div class="card-content">
                                            <h4 class="card-title">
                                                <a href="http://www.fostrap.com/2016/03/bootstrap-3-carousel-fade-effect.html"> ${tickets.t_name}</a>
                                            </h4>
                                            <p class="">
                                                - Số người tham đã tham gia: <br/>
                                                - loại vé: Vé tập với lớp <br/>
                                                - Thời gian sử dụng: ${tickets.t_total_days} Ngày <br/>
                                                <c:forEach items="${allTicketClass}" var="allTicketClass">
                                                <c:if test="${(tickets.t_id) == (allTicketClass.ticket_id)}">
                                            <td class="text-center">- Giá vé: <span class="class-price">${allTicketClass.t_price_min}</span> - <span class="class-price">${allTicketClass.t_price_max}</span></td><br/>
                                            </c:if>
                                            </c:forEach>
                                            - Có hỗ trợ huấn luyện viên cá nhân <br/>
                                            </p>
                                        </div>
                                        <div class="card-read-more">
                                            <a class="btn btn-link btn-block bookInTicketClass" onclick="handleOpenModalClass(this)" tid=${tickets.t_id} t_name="${tickets.t_name}" t_total_day=${tickets.t_total_days}
                                                    type="button" data-bs-toggle="modal" data-bs-target="#classModal">
                                                Mua vé ngay
                                            </a>
                                            <div class="modal fade" id="classModal">
                                                <div class="modal-dialog"  style="max-width: 82%;">
                                                    <div class="modal-content">
                                                        <div class="modal-header">
                                                            <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                        </div>
                                                        <p class="text-dark h2 text-center">Mua vé</p>
                                                        <div class="modal-body">
                                                            <div class="py-5">
                                                                <div class="container">
                                                                    <p id="title_ticket_class_form" class="text-dark h2 text-center"></p>
                                                                    <p hidden style="display: none" id="ticket_class_id"></p>
                                                                    <div class="form-group">
                                                                        <div class="row d-flex justify-content-center">
                                                                            <label class="form-label col-sm-2 mt-3" for="total_day_class">Tổng số ngày:</label>
                                                                            <div class="col-sm-6">
                                                                                <input type="text" class="form-control" id="total_day_class" readonly required/>
                                                                            </div>
                                                                        </div>
                                                                    </div>

                                                                    <div class="form-group">
                                                                        <div class="row d-flex justify-content-center">
                                                                            <label class="form-label col-sm-2 mt-3" for="start_date_class">Ngày bắt đầu:</label>
                                                                            <div class="col-sm-6">
                                                                                <input type="date" class="form-control" id="start_date_class" readonly/>
                                                                            </div>
                                                                        </div>
                                                                    </div>

                                                                    <div class="form-group">
                                                                        <div class="row d-flex justify-content-center">
                                                                            <label class="form-label col-sm-2 mt-3" for="stop_date_class">Ngày kết thúc:</label>
                                                                            <div class="col-sm-6">
                                                                                <input type="date" class="form-control" id="stop_date_class" readonly required/>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                    <div class="form-group">
                                                                        <div class="row d-flex justify-content-center">
                                                                            <label class="form-label col-sm-2 mt-3" for="pt_class_name">Chọn HLV:</label>
                                                                            <div class="col-sm-6">
                                                                                <select class="form-select"  id="pt_class_name" style="width: 82%;float:left;">
                                                                                        <%--<option disabled selected hidden>Chọn HLV</option>--%>
                                                                                </select>
                                                                                <button type="button" style="text-align: center; float:right;" class="btn btn-primary">Lịch trình</button>
                                                                            </div>
                                                                        </div>
                                                                    </div>

                                                                    <div class="form-group">
                                                                        <div class="row d-flex justify-content-center">
                                                                            <label class="form-label col-sm-2 mt-3">Số người đã tham gia:</label>
                                                                            <div class="col-sm-6" id="totalAttendees">
                                                                                    <%--<input type="number" class="form-control" id="year" readonly required/>--%>
                                                                            </div>
                                                                        </div>
                                                                    </div>

                                                                    <div class="form-group">
                                                                        <div class="row d-flex justify-content-center">
                                                                            <label class="form-label col-sm-2 mt-3">Thời gian tập:</label>
                                                                            <div class="col-sm-6" id="time">
                                                                                    <%--<input type="number" class="form-control" id="year" readonly required/>--%>
                                                                            </div>
                                                                        </div>
                                                                    </div>

                                                                    <div class="form-group">
                                                                        <div class="row d-flex justify-content-center">
                                                                            <label class="form-label col-sm-2 mt-3">Giá gói:</label>
                                                                            <div class="col-sm-6" id="classPrice">
                                                                                    <%--<input type="number" min="1" class="form-control" id="price" readonly required/>--%>
                                                                            </div>
                                                                        </div>
                                                                    </div>

                                                                    <div class="form-group">
                                                                        <div class="row d-flex justify-content-center">
                                                                            <button onclick="handleBookingClass()" style="background: #d8d8da;border-color: #d8d8da; width: 730px; margin-left: 20px; margin-right: 20px; margin-top: 10px;"
                                                                                    id="btnShedule"  class="btn btn-primary btn-block mt-5">
                                                                                Mua vé ngay
                                                                            </button>
                                                                            <a id="getPriceClass" style="display: none"></a>
                                                                                <%--<a onclick="handleBooking()" class="btn btn-link btn-block bookInModal" type="button" data-bs-toggle="modal" style="background: #d8d8da; max-width: 730px">--%>
                                                                                <%--Mua vé ngay--%>
                                                                                <%--</a>--%>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:if>
                        </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script>
        // click "Mua vé ngay"
        function handleOpenModalClass(event) {
            // document.getElementById("stop_date")
            // đưa data lên để hiển thị
            document.getElementById("title_ticket_class_form").innerText = event.getAttribute("t_name");
            document.getElementById("ticket_class_id").innerText = event.getAttribute("tid");
            document.getElementById("total_day_class").value = event.getAttribute("t_total_day") + " Ngày";
        }

        var end_date_class;
        var check_total_attendees = "";
        // click vào mua ở modal
        function handleBookingClass() {
            var classID = document.getElementById("btnShedule").value;
            if (check_total_attendees === "full") {
                Swal.fire({
                    title: 'Hiện tại lớp đã đủ học viên',
                    icon: 'success',
                    text: 'Vui lòng chọn lớp khác',
                });
             }
             else{
                $.ajax(
                    {
                        type: "GET",
                        contentType: false,
                        url: "/customer/BookingTicketClass/Check_ticket_exists?" + "classID=" + parseInt(classID),
                        success: function (result) {
                            console.log(result);
                            if (result === 'true'){
                                var price_class = document.getElementById("getPriceClass").innerHTML;
                                console.log("giá: " + price_class);
                                var ticket_id = sessionStorage.getItem("ticket_id");
                                var end_date_ticket = sessionStorage.getItem("end_date_ticket");
                                var ticket_class_id = document.getElementById("ticket_class_id").textContent;
                                if (ticket_id != null) {
                                    Swal.fire('Bạn đã thêm ticket vào giỏ thành công', '', 'success');
                                    window.location.href = '<c:url value="/CustomerUser/saveTickerUser?" />' + "ticket_id=" + ticket_id + "&end_date_ticket=" + end_date_ticket + "&price=" + price_class+ "&ticket_pt_id=" + ticket_class_id + "&end_date_ticket_personal=" + end_date_class;
                                    sessionStorage.removeItem('ticket_id');
                                    sessionStorage.removeItem('end_date_ticket');
                                }else {
                                    Swal.fire('Bạn đã thêm ticket vào giỏ thành công', '', 'success');
                                    window.location.href = '<c:url value="/CustomerUser/saveTickerUser?" />' + "ticket_id=" + 0 + "&end_date_ticket=" + 0 + "&price=" + price_class+ "&ticket_pt_id=" + ticket_class_id + "&end_date_ticket_personal=" + end_date_class;
                                }
                            } else {
                                Swal.fire('Bạn đã tham gia vào lớp này', '', 'success')
                            }
                        },
                        error: function () {
                            console.log("check");
                            Swal.fire('Lỗi hệ thống', '', 'warning')
                        }
                    }
                );
            }


        }

        $(document).ready(function () {
            $("#show-ticket-class").on('click', '.bookInTicketClass', function () {
                var ids = $(this).parent().siblings(".ticket_class_id").text();
                $.ajax(
                    {
                        type: "GET",
                        contentType: false,
                        url: "/customer/booking/checkEndDateTicket?" + "ticket_type_id=" + 3,
                        success: function (resultAPI) {
                            // lấy end date để lưu vào database
                            end_date_class = resultAPI;
                            if (resultAPI === ""){
                                loadDataTicketClass(ids);
                            }else{
                                Swal.fire({
                                    title: 'Bạn có tiếp tục tham gia vé lớp này không?',
                                    showDenyButton: true,
                                    confirmButtonText: 'Có',
                                    denyButtonText: 'Không',
                                    icon: 'question',
                                    text: 'Bạn đã có vé lớp',
                                }).then((result) => {
                                    if(result.isConfirmed){
                                    loadDataTicketClass(ids);
                                }else if (result.isDenied) {
                                    $('#classModal').modal('hide');
                                    var show = document.getElementById("show-class");
                                    show.scrollIntoView();
                                }
                            })
                            }
                        },

                        error: function () {
                            console.log("mua vé ngay");
                            Swal.fire('Lỗi hệ thống', '', 'warning')
                        }
                    });
            })
        });

        function loadDataTicketClass(ids) {
            console.log("loadDataTicketClass: " + ids);
            $.ajax({
                type : "GET",
                // contentType: false,
                url: '<c:url value="/customer/BookingTicketClass?" />' + "ids=" + ids,
                success: function (result1) {
                    var start_date = document.getElementById("start_date_class");
                    var stop_date = document.getElementById("stop_date_class");
                    var name = document.getElementById("pt_class_name");
                    var totalAttendees = document.getElementById("totalAttendees");
                    var time_class = document.getElementById("time");
                    var price = document.getElementById("classPrice");

                    start_date.innerHTML = "";
                    stop_date.innerHTML = "";
                    name.innerHTML = "";
                    totalAttendees.innerHTML = "";
                    time_class.innerHTML = "";
                    price.innerHTML = "";


                    var optionHLV = document.createElement("option");
                    optionHLV.innerText = "Chọn HLV";
                    optionHLV.disabled = true;
                    optionHLV.selected = true;
                    optionHLV.hidden = true;
                    name.appendChild(optionHLV);

                    result1.forEach(function(ticket_class) {
                        console.log("name: " + ticket_class.c_trainer_name);
                        var name_trainer = document.createElement("option");
                        name_trainer.id = ticket_class.c_trainer_id;
                        name_trainer.innerText = ticket_class.c_trainer_name;
                        name.appendChild(name_trainer);
                        name.addEventListener("change", function() {
                            var selectedOption = this.options[this.selectedIndex];
                            if (selectedOption.id == ticket_class.c_trainer_id) {
                                start_date.innerHTML = "";
                                stop_date.innerHTML = "";
                                totalAttendees.innerHTML = "";
                                time_class.innerHTML = "";
                                price.innerHTML = "";

                                var optionHLV = document.createElement("option");
                                optionHLV.innerText = "Chọn HLV";
                                optionHLV.disabled = true;
                                optionHLV.selected = true;
                                optionHLV.hidden = true;
                                name.appendChild(optionHLV);

                                // set start date
                                var dateObj = new Date(ticket_class.c_start_date);
                                var year = dateObj.getFullYear();
                                var month = String(dateObj.getMonth() + 1).padStart(2, '0');
                                var day = String(dateObj.getDate()).padStart(2, '0');
                                var formattedDate = year + '-' + month + '-' + day;
                                start_date.value = formattedDate;

                                // set end date
                                var dateObj = new Date(ticket_class.c_end_date);
                                var year = dateObj.getFullYear();
                                var month = String(dateObj.getMonth() + 1).padStart(2, '0');
                                var day = String(dateObj.getDate()).padStart(2, '0');
                                var formattedEndDate = year + '-' + month + '-' + day;
                                stop_date.value = formattedEndDate;

                                // set số người đã tham gia
                                var total_attendees = document.createElement("input");
                                total_attendees.classList = "form-control " + ticket_class.total_attendees;
                                total_attendees.id = "total_attendees" + ticket_class.total_attendees;
                                total_attendees.readOnly = true;
                                total_attendees.required = true;
                                // total_attendees.type = "number";
                                total_attendees.value = ticket_class.total_attendees + "/" + ticket_class.max_member;
                                total_attendees.style.display = "inline";
                                totalAttendees.appendChild(total_attendees);

                                //set time
                                var timeClass = document.createElement("input");
                                timeClass.classList = "form-control " + ticket_class.class_id;
                                timeClass.id = "time" + ticket_class.class_id;
                                timeClass.readOnly = true;
                                timeClass.required = true;
                                // timeClass.type = "number";
                                timeClass.value = ticket_class.start_time + " - " + ticket_class.end_time;
                                timeClass.style.display = "inline";
                                time_class.appendChild(timeClass);

                                //set price
                                var class_price = document.createElement("input");
                                class_price.classList = "form-control " + ticket_class.class_id;
                                class_price.id = "trainerPrice" + ticket_class.class_id;
                                class_price.readOnly = true;
                                class_price.required = true;
                                class_price.type = "number";
                                // set value cho input để hieent thị data
                                class_price.value =  ticket_class.c_price;
                                class_price.style.display = "inline";
                                price.appendChild(class_price);
                                document.getElementById("getPriceClass").innerText = ticket_class.c_price;

                                //btnShedule
                                if (ticket_class.total_attendees === ticket_class.max_member) {
                                    check_total_attendees = "full";
                                }else {
                                    check_total_attendees = "notfull";
                                }
                                document.getElementById("btnShedule").value = ticket_class.class_id;
                            }
                        });
                    });
                },
                error: function (error) {
                    console.log("loadDataTicketClass");
                    Swal.fire('Lỗi hệ thống', '', 'warning')
                    console.log(error);
                }
            });
        }

    </script>
</section>


