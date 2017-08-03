<%-- 
    Document   : commentpop
    Created on : Jul 27, 2017, 4:49:03 PM
    Author     : AreKhatry
--%>
<%@page import="com.mvc.bean.CommentBean"%>
<%@page import="com.mvc.bean.ScheduleBean"%>
<%@page import="com.mvc.bean.Board_PointBean"%>
<%@page import="java.sql.*"%>
<%@page import="com.mvc.util.DBConnection"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.mvc.bean.SearchBus"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="stylecomment.css" rel="stylesheet" type="text/css"/>    
        <script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>



        <link rel="shortcut icon" type="image/png" href="assets/images/titlelogo.png"/>
        <title>Yatayat Sewa - Search Result</title>
        <script src="http://s.codepen.io/assets/libs/modernizr.js" type="text/javascript"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
        <link rel="stylesheet" href="css/style.css">

        <script>
            $(document).ready(function () {
                $('#vechileDetailWrapper').fadeIn(300);
                $('#vechileDetail').slideDown(400);
                $('.busgroup').click(function () {
                    var id = this.id;
                    var textbox = document.getElementById('testbox');
                    textbox.value = id;
                    document.formname.key.value = id;
                    document.formname.submit();
//                    $.ajax({
//                        url: "RetrieveBusDetail",
//                        type: "POST",
//                        data: {
//                            number: $('#testbox').val()
//                        },
//                        success: function (responseText) {
//                                alert(responseText);
//                        },
//
//                        error: function (responseText) {
//                            alert("Sorry, there was a problem!" + responseText);
//                        }
//                    });
                    //document.getElementById('testbox').value(id);

                });
                $('.close').click(function () {
                    $('#vechileDetailWrapper').fadeOut(300);
                    $('#vechileDetail').slideUp(400);

                    $('.busDetail').show();
                    $('.textarea').show();
                    $('.button').show();
                    $('.review .heading').show();
                    $('#vechileDetail .header .head').text('Vehicle Details');
                });
                $('.mask').click(function () {
                    $('#vechileDetailWrapper').fadeOut(300);
                    $('#vechileDetail').slideUp(400);

                    $('.busDetail').show();
                    $('.textarea').show();
                    $('.button').show();
                    $('.review .heading').show();
                    $('#vechileDetail .header .head').text('Vehicle Details');
                });
                $('.viewReview').click(function () {
                    $('.busDetail').hide();
                    $('.textarea').hide();
                    $('.button').hide();
                    $('.review .heading').hide();
                    $('#vechileDetail .header .head').text('Reviews');
                });
            });
            function checklogin() {
                document.getElementById('checkk').click();
                location.reload();
            }
            function test() {
                var d = document.getElementById('forsubmitreview').value;
                //alert("d value is"+d);
                if (d === "null") {
                    document.getElementById('forlogin').click();
                } else {
                    d = document.getElementById('txtAreaReview').value;
                    //alert(d);
                    $.ajax({
                        url: "commentServlet",
                        type: "POST",
                        data: {
                            useremail: $('#login_email').val(),
                            username: $('#forsubmitreview').val(),
                            busid: $('#tempbusid').val(),
                            comment: $('#txtAreaReview').val()
                        },
                        success: function (responseText) {

                            if (responseText === "FAILED") {
                                alert("Error Occured");
                            } else {
                                location.reload();
                            }
                        },
                    });
                }
            }

        </script>

    </head>
    <body>
        <form name="formname" action="test" method="post">
            <input type="hidden" name="key" id="testbox">

        </form>

        <%@ include file="pleaselogin.jsp" %>
        <br><br><br><br>
        <% int i = 1;
            String tempBusName = null;
            username = (String) session.getAttribute("username");
            ArrayList<SearchBus> buslist = (ArrayList) session.getAttribute("buslist");
            String dep = (String) session.getAttribute("departure");
            String des = (String) session.getAttribute("destination");
            Connection c = DBConnection.getConnection();
            SearchBus singlebus = null;
            String query = null;
            PreparedStatement pst = null;
            ResultSet resultSet = null;
        %>
      
        <h1>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;&nbsp;&nbsp;&nbsp;
            Search results for <%=dep%> to <%=des%></h1>  
        <table class="rwd-table">
            <%if (buslist.isEmpty()) {%>
            "No records found"
            <%} else {%>
            <tr><th width=50px>S.N</th>
                <th width=150px>Bus Name</th>
                <th width=150px>Bus Number</th>
                <th width=120px>Travel Type</th>
                <th width=150px>Departure Time</th>
                <th width=100px>Seats Available</th>
                <th width=120px>Fare</th>
                <th width=100px>Remarks</th>
            </tr> <%  for (SearchBus bus : buslist) {
                    tempBusName = bus.getName();
            %>
            <tr><td data-th="Bus"><%=i%></td>
                <td data-th="Bus"><a id="<%=bus.getScheduleid()%>" href="#" class="busgroup"><%= bus.getName()%></a></td>
                <td data-th="Bus"><%= bus.getBus_number()%></td>
                <td data-th="Bus"><%= bus.getTravel_type()%></td>
                <td data-th="Departure"><%= bus.getTime()%></td>
                <td data-th="Seats"><%= bus.getSeats()%></td>
                <td data-th="Fare"><%= bus.getFare()%></td>
                <td data-th="Remarks">
                    <%if (username == null) {%>
                    <a  href="#" onclick="test()" id="bookbtnfirst">Book Now !</a>
                    <a id="bookbtn" href="SeatServlet?deptime=<%=bus.getTime()%>&dep=<%=dep%>&des=<%=des%>&busname=<%= bus.getName()%>&traveltype=<%= bus.getTravel_type()%>&username=<%=username%>&bus_id=<%= bus.getBus_number()%>&fare=<%= bus.getFare()%>" hidden="true">Book Now !</a>
                    <%} else {%>
                    <a href="SeatServlet?deptime=<%=bus.getTime()%>&dep=<%=dep%>&des=<%=des%>&busname=<%= bus.getName()%>&traveltype=<%= bus.getTravel_type()%>&username=<%=username%>&bus_id=<%= bus.getBus_number()%>&fare=<%= bus.getFare()%>">Book Now !</a>
                    <% }%> </td>
            </tr>
            <% i++;
                    }
                }%>
        </table>
        <script src="js/index.js"></script>
        <%@ include file="footer.jsp" %>


        <div id="vechileDetailWrapper">
            <div class="mask"></div>
            <div id="vechileDetail">
                <div class="header">
                    <span class="head">Vehicle Details</span>
                    <span class="close">x</span>
                </div>
                <div class="busDetail">
                    <div class="busName">
                        <%
                            ScheduleBean sb = (ScheduleBean) request.getAttribute("sbean");
                        %>
                        <b><%= sb.getBus_name()%></b>
                        <input type="hidden" id="tempbusid" value="<%=sb.getBus_number()%>">
                        <br>  Route: <%=sb.getDeparture()%> to <%=sb.getDestination()%> 
                    </div>
                    <div class="dateTime">
                        <span class="date">
                            Departure Date: <%= sb.getDeparture_date()%>

                        </span>
                        <span class="time">
                            Departure Time: <%= sb.getDeparture_time()%>
                        </span>
                        <br>Approx Destination Time: <%=sb.getDestination_time()%>
                    </div>
                </div>
                <div class="busDetail">
                    <div class="heading">
                        Boarding Points
                    </div>
                    <table>
                        <tr>
                            <th>Address</th>
                            <th>Time</th>
                        </tr>
                        <% ArrayList<Board_PointBean> bpoints = (ArrayList<Board_PointBean>) request.getAttribute("bpoints");
                            for (Board_PointBean b : bpoints) {%>
                        <tr>
                            <td> <%=b.getBpname()%></td>
                            <td> <%=b.getTime()%></td>
                        </tr>
                        <% } %>
                    </table>
                </div>
                <div class="review">
                    <div class="heading">
                        Add Review
                    </div>
                    <div class="comment">
                        <ul>
                            <li class="textarea">
                                <textarea id="txtAreaReview" placeholder="Enter your review..  "></textarea>
                            </li>
                            <li class="button">
                                <span class="viewReview">View all Reviews</span>
                                <button onclick="test()" id="submitReview">Submit</button>

                            </li>
                            <% ArrayList<CommentBean> cb = (ArrayList<CommentBean>) request.getAttribute("commentlist");
                                for (CommentBean com : cb) {
                                    if (com.getRemark().equals("1")) {%>
                            <li class="userReview good">
                                <div class="heading">
                                    <span class="userName">
                                        <%=com.getEmail_id()%>
                                    </span>
                                    <span class="date">
                                        <%=com.getComment_date()%>
                                    </span>
                                </div>
                                <div class="reviewBody">
                                    <%=com.getDescription()%>
                                </div>
                            </li>
                            <%  } else {%>
                            <li class="userReview bad">
                                <div class="heading">
                                    <span class="userName">
                                        <%=com.getEmail_id()%>
                                    </span>
                                    <span class="date">
                                        <%=com.getComment_date()%>
                                    </span>
                                </div>
                                <div class="reviewBody">
                                    <%=com.getDescription()%>
                                </div>
                            </li>
                            <% }
                                }%>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

    </body>
</html>
