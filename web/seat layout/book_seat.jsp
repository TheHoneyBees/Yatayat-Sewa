<%-- 
    Document   : newjsp
    Created on : May 29, 2017, 6:58:36 PM
    Author     : boude
--%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.ArrayList"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head><link rel="shortcut icon" type="image/png" href="${pageContext.request.contextPath}/assets/images/titelogo.png" />
        <link href="${pageContext.request.contextPath}/assets/css/parsley.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/assets/css/datepick.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/assets/css/bus.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/assets/css/bootstrap.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/seat layout/seatcss.css" rel="stylesheet" />
        <title>Seat Book </title><style>
            [ng\:cloak], [ng-cloak], [data-ng-cloak], [x-ng-cloak], .ng-cloak, .x-ng-cloak {
                display: none !important;
            }
        </style>

    </head>
    <body>
        <div class="tb_header">
            <div class="container">
                <div class="col-md-6" style="padding:0;">
                    <div class="tb_logo"> <a href="homeLoginSession"><img src="${pageContext.request.contextPath}/assets/images/yatayat_logo.png"> </a> </div>
                </div>
                <div class="col-md-4" style="padding:0;">
                    <div class="tb_navbar">
                        <ul>
                            <li><a href="${pageContext.request.contextPath}/index.jsp">Home &nbsp;<span style="color:#f0a2a3;"> |</span></a></li>

                            <li><a href="${pageContext.request.contextPath}/cancellation.html">Easy Cancel/Refund</a> </li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-2" style="padding:0;">

                    <div class="signin_up">
                        <ul>
                            <%
                                if ((String) session.getAttribute("username") == null) {%>
                            <li><a href="#myModals" id="forlogin" data-toggle="modal" data-target="#myModals">Sign In</a>
                                <span style="color:#f0a2a3;">/</span></li>
                            <li><a  data-dismiss="modal" href="#myModal" data-toggle="modal" data-target="#myModal">Sign Up</a></li>
                                <%} else {
                                %>
                            <li><a href="#" >Welcome  <%=(String) session.getAttribute("username")%></a>  <span style="color:#f0a2a3;">/</span></li>
                            <li><a  data-dismiss="modal" href="logout" data-toggle="modal" data-target="#myModal">Logout</a></li>
                                <%}%>

                        </ul>
                    </div>

                </div>
            </div>
            <div class="shadow"><img src="${pageContext.request.contextPath}/assets/images/shadow.png"></div>
        </div>

        <script>
            var fare = <%=session.getAttribute("fare")%>;
            var bookedSeatArray = [];
            var val = 0;
            var count = 0;
            var max_book = 5;
            function validateForm() {
                var x = document.forms["form"]["total"].value;
                if (x === "0") {
                    alert("Seat must be selected");
                    return false;
                }
            }
            // call onload or in script segment below form
            function attachCheckboxHandlers() {
                // get reference to element containing seat_layout checkboxes
                var el = document.getElementById('seat_layout');

                // get reference to input elements in seat_layout container element
                var tops = el.getElementsByTagName('input');
                // assign updateTotal function to onclick property of each checkbox
                for (var i = 0, len = tops.length; i < len; i++) {
                    if (tops[i].type === 'checkbox') {
                        tops[i].onclick = updateTotal;
                    }
                }
            }
            // called onclick of seat_layout checkboxes
            function updateTotal() {

                // 'this' is reference to checkbox clicked on
                var form = this.form;

                // get current value in total text box, using parseFloat since it is a string
                val = parseFloat(form.elements['total'].value);

                // if check box is checked, add its value to val, otherwise subtract it
                var seat = this.id;
                if (this.checked) {
                    if (count > max_book) {
                        alert("Seat limit is " + (max_book + 1));
                        this.checked = false;
                        return;
                    }
                    bookedSeatArray.push(seat);
                    count++;
                    val += parseFloat(fare);
                    form.elements['bookedseats'].value = bookedSeatArray;

                } else {
                    for (i = 0; i < bookedSeatArray.length; i++) {
                        if (bookedSeatArray[i] === seat) {
                            bookedSeatArray.splice(i, 1);
                            break;
                        }
                    }
                    count--;
                    val -= parseFloat(fare);
                    form.elements['bookedseats'].value = bookedSeatArray;
                }
                // format val with correct number of decimal places
                // and use it to update value of total text box
                form.elements['total'].value = val;
            }
        </script>
        <span style="display:block; height: 100px;"></span>
        <form name="form" action="book_now" method="post" onsubmit="return validateForm()">
            <div id="seat_layout" style="margin-top: 10px;">
                <div class="plane">
                    <div class="cabin">
                        Please select your seats
                    </div>
                    <ol class="fuselage">
                        <li class="row row--1">
                            <ol class="seats" type="A">
                                <li class="seat">
                                    <input type="checkbox"  <%=request.getAttribute("oneA")%> id="1A" />
                                    <label for="1A">1A</label>
                                </li>
                                <li class="seat">
                                    <input type="checkbox" <%=request.getAttribute("twoA")%> id="2A" />
                                    <label for="2A">2A</label>
                                </li>
                                <li class="seat">
                                    <input type="checkbox"  <%=request.getAttribute("oneB")%>  id="1B" />
                                    <label for="1B">1B</label>
                                </li>
                                <li class="seat">
                                    <input type="checkbox" <%=request.getAttribute("twoB")%> id="2B" />
                                    <label for="2B">2B</label>
                                </li>
                            </ol>
                        </li>
                        <li class="row row--2">
                            <ol class="seats" type="A">
                                <li class="seat">
                                    <input type="checkbox"  <%=request.getAttribute("threeA")%> id="3A" />
                                    <label for="3A">3A</label>
                                </li>
                                <li class="seat">
                                    <input type="checkbox"  <%=request.getAttribute("fourA")%>  id="4A" />
                                    <label for="4A">4A</label>
                                </li>
                                <li class="seat">
                                    <input type="checkbox" <%=request.getAttribute("threeB")%> id="3B" />
                                    <label for="3B">3B</label>
                                </li>
                                <li class="seat">
                                    <input type="checkbox" <%=request.getAttribute("fourB")%>  id="4B" />
                                    <label for="4B">4B</label>
                                </li>
                            </ol>
                        </li>
                        <li class="row row--3">
                            <ol class="seats" type="A">
                                <li class="seat">
                                    <input type="checkbox" <%=request.getAttribute("fiveA")%>  id="5A" />
                                    <label for="5A">5A</label>
                                </li>
                                <li class="seat">
                                    <input type="checkbox" <%=request.getAttribute("sixA")%> id="6A" />
                                    <label for="6A">6A</label>
                                </li>
                                <li class="seat">
                                    <input type="checkbox" <%=request.getAttribute("fiveB")%> id="5B" />
                                    <label for="5B">5B</label>
                                </li>
                                <li class="seat">
                                    <input type="checkbox"  <%=request.getAttribute("sixB")%>  id="6B" />
                                    <label for="6B">6B</label>
                                </li>
                            </ol>
                        </li>
                        <li class="row row--4">
                            <ol class="seats" type="A">
                                <li class="seat">
                                    <input type="checkbox" <%=request.getAttribute("sevenA")%> id="7A" />
                                    <label for="7A">7A</label>
                                </li>
                                <li class="seat">
                                    <input type="checkbox"  <%=request.getAttribute("eightA")%> id="8A" />
                                    <label for="8A">8A</label>
                                </li>
                                <li class="seat">
                                    <input type="checkbox"  <%=request.getAttribute("sevenB")%>  id="7B" />
                                    <label for="7B">7B</label>
                                </li>
                                <li class="seat">
                                    <input type="checkbox"  <%=request.getAttribute("eightB")%> id="8B" />
                                    <label for="8B">8B</label>
                                </li>
                            </ol>
                        </li>
                        <li class="row row--5">
                            <ol class="seats" type="A">
                                <li class="seat">
                                    <input type="checkbox" <%=request.getAttribute("nineA")%>  id="9A" />
                                    <label for="9A">9A</label>
                                </li>
                                <li class="seat">
                                    <input type="checkbox" <%=request.getAttribute("tenA")%> id="10A" />
                                    <label for="10A">10A</label>
                                </li>
                                <li class="seat">
                                    <input type="checkbox"  <%=request.getAttribute("nineB")%> id="9B" />
                                    <label for="9B">9B</label>
                                </li>
                                <li class="seat">
                                    <input type="checkbox" <%=request.getAttribute("tenB")%> id="10B" />
                                    <label for="10B">10B</label>
                                </li>
                            </ol>
                        </li>
                        <li class="row row--6">
                            <ol class="seats" type="A">
                                <li class="seat">
                                    <input type="checkbox" <%=request.getAttribute("elevenA")%>  id="11A" />
                                    <label for="11A">11A</label>
                                </li>
                                <li class="seat">
                                    <input type="checkbox"  <%=request.getAttribute("twelveA")%> id="12A" />
                                    <label for="12A">12A</label>
                                </li>
                                <li class="seat">
                                    <input type="checkbox" <%=request.getAttribute("elevenB")%>  id="11B" />
                                    <label for="11B">11B</label>
                                </li>
                                <li class="seat">
                                    <input type="checkbox" <%=request.getAttribute("twelveB")%>  id="12B" />
                                    <label for="12B">12B</label>
                                </li>
                            </ol>
                        </li>
                        <li class="row row--7">
                            <ol class="seats" type="A">
                                <li class="seat">
                                    <input type="checkbox" <%=request.getAttribute("thirtA")%> id="13A" />
                                    <label for="13A">13A</label>
                                </li>
                                <li class="seat">
                                    <input type="checkbox"  <%=request.getAttribute("fourtA")%> id="14A" />
                                    <label for="14A">14A</label>
                                </li>
                                <li class="seat">
                                    <input type="checkbox" <%=request.getAttribute("thirtB")%> id="13B" />
                                    <label for="13B">13B</label>
                                </li>
                                <li class="seat">
                                    <input type="checkbox" <%=request.getAttribute("fourtB")%> id="14B" />
                                    <label for="14B">14B</label>
                                </li>
                            </ol>
                        </li>
                        <li class="row row--8">
                            <ol class="seats" type="A">
                                <li class="seatlast">
                                    <input type="checkbox" <%=request.getAttribute("lastOne")%> id="L1" />
                                    <label for="L1">L1</label>
                                </li>
                                <li class="seatlast">
                                    <input type="checkbox"  <%=request.getAttribute("lastTwo")%> id="L2" />
                                    <label for="L2">L2</label>
                                </li>
                                <li class="seatlast">
                                    <input type="checkbox" <%=request.getAttribute("lastThree")%> id="L3" />
                                    <label for="L3">L3</label>
                                </li>
                                <li class="seatlast">
                                    <input type="checkbox" <%=request.getAttribute("lastFour")%> id="L4" />
                                    <label for="L4">L4</label>
                                </li>
                                <li class="seatlast">
                                    <input type="checkbox" <%=request.getAttribute("lastFive")%> id="L5" />
                                    <label for="L5">L5</label>
                                </li>
                            </ol>
                        </li>    
                    </ol>
                </div>
            </div>
            <p></p>
            <p>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp; 
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <label>Selected Seats <input type="text" name="bookedseats" value="" readonly="readonly" /></label>  &emsp;&emsp;&emsp; &emsp;&emsp;&emsp;
                <label> Total: Rs <input type="text" name="total"  value="0" readonly="readonly" /></label>
                <input type="submit" value="Book Now">
            </p>
        </form>
        <script>attachCheckboxHandlers();</script>
        <span style="display:block; height: 150px;"></span>
        <!--operator-BAR end-->
        <!--offers-BAR-->
        <div class="tb_offers">
            <div class="shadow"><img src="${pageContext.request.contextPath}/assets/images/shadow.png"></div>
            <div class="outer">
                <div class="container">
                    <div class="tb_inner">
                        <div class="row">
                            <div class="wrapper">
                                <div class="col-md-4">
                                    <div class="tb_offers1">
                                        <img src="${pageContext.request.contextPath}/assets/images/booking.png">
                                        <div class="tb_list_offer">
                                            <div class="ofer_list">BOOKING</div>

                                            <div class="ofer_list_normal">Select required seat and book ticket easily.</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="tb_offers1">
                                        <img src="${pageContext.request.contextPath}/assets/images/tick.png">

                                        <div class="ofer_list">CHOICE</div>

                                        <div class="ofer_list_normal">Access to more vehicles from different bus operators.</div>

                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="tb_offers3">
                                        <img src="${pageContext.request.contextPath}/assets/images/gur.png">

                                        <div class="ofer_list"> LOWEST PRICE GURANTEE</div>

                                        <div class="ofer_list_normal">Guranteed lowest price among all bus operators.</div>
                                    </div
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <hr class="border">
                </hr>
            </div>
        </div>
        <!--list-BAR end-->
        <!--footer-BAR-->
        <div class="container">
            <div class="row">
                <div class="tb_inner">
                    <div class="col-md-9">
                        <div class="tb_footer">
                            <ul>
                                <li><a href="#">About Yatayat Sewa &nbsp;|</a></li>
                                <li><a href="#">FAQ   &nbsp;|</a></li>
                                <li><a href="#">Careers  &nbsp;|</a></li>
                                <li><a href="#">Contact Us   &nbsp;|</a></li>
                                <li><a href="#">Terms of Use   &nbsp;|</a></li>
                                <li><a href="#">Privacy Policy   &nbsp;|</a></li>
                            </ul>
                        </div>
                        <div class="footer_con">  &#169;  2016</div>
                    </div>
                    <div class="col-md-3">
                        <div class="tb_social">
                            <ul>
                                <li>  <a href="#"><img src="${pageContext.request.contextPath}/assets/images/facebook.png"></a> </li> 
                                <li>  <a href="#"> <img src="${pageContext.request.contextPath}/assets/images/twitter.png"></a></li>
                                <li>  <a href="#">  <img src="${pageContext.request.contextPath}/assets/images/google.png"></a></li>
                            </ul>
                        </div>
                        <a href="#" id="back-to-top" title="Back to top">&uarr;</a>
                    </div>
                </div>
            </div>
        </div>	
    </body>
</html>
