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
        <link href="styleforcomment.css" rel="stylesheet" type="text/css"/>    
        <script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>



        <link rel="shortcut icon" type="image/png" href="assets/images/titlelogo.png"/>
        <title>Yatayat Sewa - Search Result</title>
        <script src="http://s.codepen.io/assets/libs/modernizr.js" type="text/javascript"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
        <link rel="stylesheet" href="css/style.css">

        <script>
            $(document).ready(function () {
//                var name = 'rating';
//                var SelectdValue = '2.5';
//                $('input[name="' + name + '"][value="' + SelectdValue + '"]').prop('checked', true);
//                $("input[name='rating']").change(function () {
//                    alert($("input[name='rating']:checked").val());
//                });
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
                        }
                    });
                }
            }

        </script>
        <style>
            @import url(//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.css);

            fieldset, label { margin-top:0px; padding: 0; }
            /*            body{ margin: 20px; }
                        h1 { font-size: 1.5em; margin: 10px; }*/

            /****** Style Star Rating Widget *****/

            .ratingclass { 
                border: none;
                float: left;
            }
            .ratingclass > input { display: none; } 
            .ratingclass > label:before { 
                margin: 4px;
                font-size: 1.25em;
                font-family: FontAwesome;
                display: inline-block;
                content: "\f005";
            }

            .ratingclass > .half:before { 
                content: "\f089";
                position: absolute;
            }

            .ratingclass > label { 
                color: #ddd; 
                float: right; 
            }

            /***** CSS Magic to Highlight Stars on Hover *****/

            .ratingclass > input:checked ~ label, /* show gold star when clicked */
            .ratingclass:not(:checked) > label:hover, /* hover current star */
            .ratingclass:not(:checked) > label:hover ~ label { color: crimson;  } /* hover previous stars in list */

            .ratingclass > input:checked + label:hover, /* hover current star when changing rating */
            .ratingclass > input:checked ~ label:hover,
            .ratingclass > label:hover ~ input:checked ~ label, /* lighten current selection */
            .ratingclass > input:checked ~ label:hover ~ label { color: #FFED85;  } 
        </style>

    </head>
    <body>
        <form name="formname" action="test" method="post">
            <input type="hidden" name="key" id="testbox">
        </form>
        <%@ include file="pleaselogin.jsp" %>
        <br><br><br><br>
        <% int i = 1;
            String[] check = new String[50];
            int loop = 1;
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
                <th width=150px>Rating</th>
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
                <td><fieldset class="ratingclass">
                        <%
                            int value = (int) bus.getRating();
                            System.out.println(bus.getBus_number() + "rating value is" + value);
                            if (value == 5) {
                                check[(i * 5) - 4] = "checked";
                            } else if (value == 4) {
                                check[(i * 5) - 3] = "checked";

                            } else if (value == 3) {
                                check[(i * 5) - 2] = "checked";
                                System.out.println("value 3 ko val" + ((i * 5) - 2) + check[8]);

                            } else if (value == 2) {
                                check[(i * 5) - 1] = "checked";

                            } else if (value == 1) {
                                check[(i * 5)] = "checked";
                                System.out.println("value 1 ko val" + (i * 5) + check[5] + check[10]);
                            }
                        %>
                        <input type="radio"  name="rating5" value="5" <%=check[loop]%>/><label class = "full" for="star5" title="Awesome - 5 stars"></label>
                        <%loop++;%>

                        <!--<input type="radio" id="star4half" name="rating" value="4.5"   /><label class="half" for="star4half" title="Pretty good - 4.5 stars"></label>-->
                        <input type="radio"  name="rating4" value="4" <%=check[loop]%>/><label class = "full" for="star4" title="Pretty good - 4 stars"></label>
                        <%loop++;%><!--<input type="radio" id="star3half" name="rating" value="3.5" /><label class="half" for="star3half" title="Meh - 3.5 stars"></label>-->
                        <input type="radio" name="rating3" value="3"  <%=check[loop]%>/><label class = "full" for="star3" title="Meh - 3 stars"></label>
                        <%loop++;%> <!--<input type="radio" id="star2half" name="rating" value="2.5" /><label class="half" for="star2half" title="Kinda bad - 2.5 stars"></label>-->
                        <input type="radio"  name="rating2" value="2"  <%=check[loop]%>/><label class = "full" for="star2" title="Kinda bad - 2 stars"></label>
                        <%loop++;%> <!--<input type="radio" id="star1half" name="rating" value="1.5"  /><label class="half" for="star1half" title="Meh - 1.5 stars"></label>-->
                        <input type="radio" name="rating1" value="1"  <%=check[loop]%>/><label class = "full" for="star1" title="Sucks big time - 1 star"></label>
                        <%System.out.println(check[loop] + "/////********"); %><%loop++;%> <!--<input type="radio" id="starhalf" name="rating" value="0.5" /><label class="half" for="starhalf" title="Sucks big time - 0.5 stars"></label>-->
                    </fieldset></td>
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
            <div id="vechileDetail" >
                <div class="header" >
                    <span class="head">Vehicle Details</span>
                    <span class="close">x</span>
                </div>
                <div class="busDetail" >
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
                <div class="busDetail">
                    <fieldset class="ratingclass">
                        <h4>Rate me !</h4>
                        <input type="radio"  name="rating" value="5"/><label class = "full" for="star5" title="Awesome - 5 stars"></label>
                        <input type="radio"  name="rating" value="4"/><label class = "full" for="star4" title="Pretty good - 4 stars"></label>
                        <input type="radio"  name="rating" value="3"/><label class = "full" for="star3" title="Meh - 3 stars"></label>
                        <input type="radio"  name="rating" value="2"/><label class = "full" for="star2" title="Kinda bad - 2 stars"></label>
                        <input type="radio"  name="rating" value="1"/><label class = "full" for="star1" title="Sucks big time - 1 star"></label>
                    </fieldset>
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
                            <li class="button1">

                                <button class="btn" onclick="test()" id="submitReview">Submit</button>
                                <span class="viewReview">View all Reviews</span>
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
