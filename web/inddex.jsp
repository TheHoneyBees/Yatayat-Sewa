<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.mvc.bean.SearchBus"%>
<!DOCTYPE html>
<html >
    <head>
        <meta charset="UTF-8">
        <link rel="shortcut icon" type="image/png" href="assets/images/titlelogo.png"/>
        <title>Yatayat Sewa - Search Result</title>
        <script src="http://s.codepen.io/assets/libs/modernizr.js" type="text/javascript"></script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/5.0.0/normalize.min.css">
        <link rel="stylesheet" href="css/style.css">
        <!--        <script>
                    
                    function checklogin() {
                        document.getElementById('checkk').click();
                    }
                    function test() {
                        alert("Please Login !");
                        document.getElementById('forlogin').click();
                    }
                </script>-->
        <script>
            $(document).ready(function () {

                $('.busgroup').click(function () {
                    var id = this.id;
                    alert(id);
                    var textbox = document.getElementById('testbox');
                    textbox.value = id;
                    $.ajax({
                        url: "RetrieveBusDetail",
                        type: "POST",
                        data: {
                            number: $('#testbox').val()
                        },
                        success: function (responseText) {
                            alert(responseText);
                        },

                        error: function (responseText) {
                            alert("Sorry, there was a problem!" + responseText);
                        }
                    });
                    document.getElementById('testbox').value(id);
                    $('#vechileDetailWrapper').fadeIn(300);
                    $('#vechileDetail').slideDown(400);
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
            }
            function test() {
                alert("Please Login !");
                document.getElementById('forlogin').click();
            }

        </script>

        <script src='http://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>

    </head>
    <body>
        <%@ include file="pleaselogin.jsp" %>
        <br><br><br><br>
        <% int i = 1;
            username = (String) session.getAttribute("username");
            List<SearchBus> buslist = (ArrayList) request.getAttribute("buslist");
            String dep = (String) request.getAttribute("departure");
            String des = (String) request.getAttribute("destination");
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
            </tr> <%  for (SearchBus bus : buslist) {%>
            <tr><td data-th="Bus"><%=i%></td>
                <td data-th="Bus"><a href="test?deptime=<%=bus.getTime()%>&dep=<%=dep%>&des=<%=des%>&busname=<%= bus.getName()%>&traveltype=<%= bus.getTravel_type()%>&username=<%=username%>&bus_id=<%= bus.getBus_number()%>&fare=<%= bus.getFare()%>"><%= bus.getName()%></a></td>
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
        <div id="vechileDetailWrapper">
            <div class="mask"></div>
            <div id="vechileDetail">
                <div class="header">
                    <span class="head">Vehicle Details</span>
                    <span class="close">x</span>
                </div>
                <div class="busDetail">
                    <div class="busName">Bus Name: Kalika Deluxe</div>
                    <div class="dateTime">
                        <span class="date">
                            July 21, 2017
                        </span>
                        <span class="time">
                            08:00 AM
                        </span>
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
                        <tr>
                            <td>Urlabari</td>
                            <td>7:00 AM</td>
                        </tr>
                        <tr>
                            <td>Gorkha</td>
                            <td>11:00 AM</td>
                        </tr>
                    </table>
                </div>
                <div class="review">
                    <div class="heading">
                        Add Review
                    </div>
                    <div class="comment">
                        <ul>
                            <li class="textarea">
                                <textarea placeholder="Enter your review..  "></textarea>
                            </li>
                            <li class="button">
                                <span class="viewReview">View all Reviews</span>
                                <button>Submit</button>

                            </li>
                            <li class="userReview good">
                                <div class="heading">
                                    <span class="userName">
                                        @rameshPahalman
                                    </span>
                                    <span class="date">
                                        2073/04/06
                                    </span>
                                </div>
                                <div class="reviewBody">
                                    I travel through the bus and found that the service was really good.
                                </div>
                            </li>
                            <li class="userReview bad">
                                <div class="heading">
                                    <span class="userName">
                                        @gorkheMaharaj
                                    </span>
                                    <span class="date">
                                        2074/04/06
                                    </span>
                                </div>
                                <div class="reviewBody">
                                    The seat was narrow and felt uncomfortable.
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

        <script src="js/index.js"></script>
        <%@ include file="footer.jsp" %>
    </body>
</html>
