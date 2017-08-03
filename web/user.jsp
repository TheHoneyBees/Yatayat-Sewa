<!DOCTYPE html>
<html>
    <head><meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="css/jquery.autocomplete.css" rel="stylesheet" type="text/css"/>
        <script src="js/jquery.min.js" type="text/javascript"></script>
        <script src="js/jquery.autocomplete.js" type="text/javascript"></script>
        <link rel="shortcut icon" type="image/png" href="assets/images/titlelogo.png"/>
        <title>Yatayat Sewa-Online Ticket Booking</title>
        <link href="assets/css/bootstrap.css" rel="stylesheet">
        <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->
        <link href="assets/css/bus.css" rel="stylesheet">
        <link href="assets/css/parsley.css" rel="stylesheet">
        <link href="assets/css/datepick.css" rel="stylesheet">
        <style>
            [ng\:cloak], [ng-cloak], [data-ng-cloak], [x-ng-cloak], .ng-cloak, .x-ng-cloak {
                display: none !important;
            }
        </style>
          
     
       
       <script src="assets/js/jquery.js"></script>       
    </head>
    <body >
        <%String error=(String)session.getAttribute("error");
            String username=(String)session.getAttribute("username");%>
        <!--HEADER-BAR-->
        <div class="tb_header">
            <div class="container">
                <div class="col-md-6" style="padding:0;">
                    <div class="tb_logo"> <a href="user.jsp"><img src="assets/images/yatayat_logo.png"> </a> </div>
                </div>
                <div class="col-md-4" style="padding:0;">
                    <div class="tb_navbar">
                        <ul>
                            <li><a href="user.html">Home &nbsp;<span style="color:#f0a2a3;"> |</span></a></li>

                            <li><a href="cancellation.html">Easy Cancel/Refund</a> </li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-2" style="padding:0;">

                    <div class="signin_up">
                        <ul>
                            <li><a  data-target="#myModals">Welcome  <%=username%></a>  <span style="color:#f0a2a3;">/</span></li>
                            <li><a href="index.jsp" >Logout</a></li>
                        </ul>
                    </div>
                    <!------logged end---------------->
                </div>
            </div>
            <div class="shadow"><img src="assets/images/shadow.png"></div>
        </div>
        
        
        
        
        <!--HEADER-BAR-END-->
        <!-- Modal -->
        <div class="modal fade" id="myModals" role="dialog">
            <div class="modal-dialog">
                <!-- Modal content-->
                <button type="button" class="close_lft" data-dismiss="modal">&times;</button>
                <form action="LoginServlet" method="post" >
                    <div class="login-block">
                        <h1>Login</h1>
                        <input type="text" name="email" placeholder="Email" class ="username" required=""/>
                        <input type="password" class="password" name="password" placeholder="Password" id="password" required=""/>
<!--                        <input type="checkbox" id="checkbox3" class="css-checkbox" name="rememberme"/>
                        <label for="checkbox3" >Remember Me</label>-->

                        <input  type="submit" value="Login" style="position: relative;" ></form>
                        <br>
                        <div class="small_loader" style="text-align:center;display:none"><img src="assets/images/loader-small.gif"></div>
                        <div class="login_res" style="text-align:center;"></div>
                        <br>
                        <div class="forgot"><a data-dismiss="modal" href="#myModalf"data-toggle="modal" data-target="#myModalf">Forgot Password?</a></div>
                        <div class="sign_in"><a  data-dismiss="modal" href="#myModal" data-toggle="modal" data-target="#myModal">Sign Up</a></div>
                    </div>

            </div>
        </div>
       
        
        <div class="modal fade" id="myModal" role="dialog">
            <div class="modal-dialog">
                <!-- Modal content-->
                <button type="button" class="close_lft" data-dismiss="modal">&times;</button>
                <form id="RegisterServlet" action="RegisterServlet" method="post" data-parsley-validate="">
                    <div class="login-block">
                        <h1>Sign Up</h1>
                        <input type="email" class ="username" placeholder="Email" name="email"  required/>
                        <input type="text" class="mobile" name="mobile" minlength="10" placeholder="Mobile"required/>
                        <input type="password" value=""class="password" placeholder="Password" id="dfdfd" name="password" type="password" data-parsley-maxlength="15" data-parsley-minlength="6"required=""/>
                        <input type="password" name="repassword"data-parsley-maxlength="15" data-parsley-minlength="6" data-parsley-equalto="#dfdfd" data-parsley-equalto-message="Password confirmation must match the password." class ="password"  required="" placeholder="Repeat Password" id="password" required/><br>
                        <span class="terms_tb">By signing up, you agree to our <a class="cond_tb" href="#">Terms and Conditions.</a></span> <br>
                        <br>
                       
                        <input  type="submit" value="Sign up" style="position: relative;"/>
                        <br>
                        <div class="small_loader" style="text-align:center;display:none"><img src="assets/images/loader-small.gif"></div>
                        <div class="signup_res" style="text-align:center;"></div>
                        <br>
                        <div class="account"><a data-dismiss="modal" href="#myModals"data-toggle="modal" data-target="#myModals">Already have an account?</a></div>
                        <div class="sign_in"><a data-dismiss="modal" href="#myModals"data-toggle="modal" data-target="#myModals">Sign In</a></div>
                    </div>
                </form>
            </div>
        </div>



        <div class="modal fade" id="myModalf" role="dialog">
            <div class="modal-dialog">
                <!-- Modal content-->
                <button type="button" class="close_lft" data-dismiss="modal">&times;</button>
                <form id="forgot" data-parsley-validate="">
                    <div class="login-block">
                        <h1>Forgot Password</h1>
                        <input type="email" name="email" placeholder="Email" class="username" />

                        <span class="terms_tb">By signing up, you agree to our <a class="cond_tb" href="#">Terms and Conditions.</a></span> <br>
                        <br>

                        <input  type="button" value="SEND EMAIL" style="position: relative;" onclick="Forgot()">

                        <br>
                        <div class="small_loader" style="text-align:center;display:none"><img src="assets/images/loader-small.gif"></div>
                        <div class="forgot_res" style="text-align:center;"></div>
                        <br>
                        <div class="account"><a href="#">Already have an account?</a></div>
                        <div class="sign_in"><a data-dismiss="modal" href="#myModals"data-toggle="modal" data-target="#myModals">Sign In</a></div>
                    </div>
                </form>
            </div>
        </div>
        
        
        
        <!--SEARCH-BAR-->
        <div class="container" ng-controller="search">
            <div class="row" style="min-height:400px;margin-top:120px;">
                <div class="col-md-6">

                    <form action="SearchServlet" id="myForm" method="post" data-parsley-validate="" >
                        <input type="hidden" id="userid" name="username" value=" <%=username%>"/>
                        <section id="Search" class="LB XXCN  P20">
                            <h1 class="bookTic XCN TextSemiBold" >Online Bus Tickets Booking with Zero Booking Fees</h1>
                            <div class="searchRow clearfix">
                                <div class="LB">
                                    <label class="inputLabel">From</label>
                                    <input type="text" id="source"  name="From_address" placeholder="Enter source city name" autocomplete="on"  tabindex="1" required/>
                                    
                                    <div class="errorMessageFixed"> </div>
                                </div>
                                <span class="switchButton" id="switchButton"></span>
                                <div class="searchRight NoPaddingRight">
                                    <label class="inputLabel">To</label>
                                    <input id="Destination" name="To_address" class="XXinput searching" placeholder="Enter destination city name" type="text" tabindex="2" data-id="drop_point"  autocomplete="on" data-parsley-error-message="Please select a destination city" required />
                                    <div class="errorMessageFixed"> </div>
                                </div>
                            </div>
                            <div class="searchRow clearfix">
                                <div class="LB">
                                    <label class="inputLabel">Date of Journey</label>
                                    <span class="blackTextSmall"></span>
                                    <input name="date"  placeholder="yyyy-mm-dd" type="date" title="Date in the format yyyy-mm-dd"  tabindex="3" />
                                    <br><br><div id="radioGroup">
                                        Day
                                        <input type="radio" name="mark" id="day" value="day" checked="checked" />
                                        &nbsp;&nbsp;Night
                                        <input type="radio" name="mark"  value="night" />
                                        &nbsp;&nbsp;Both
                                        <input type="radio" name="mark" id="both" value="both" /><br><br>
                                        <input type="submit" value="Search Buses" id="searchBtn" />
                                    </div>
                                </div>

                            </div>

                        </section>
                    </form>
                </div>
                <div class="col-md-6">
                    <div class="tb_bus">
                        <img src="assets/images/bus.png">
                    </div>
                </div>
            </div>
        </div>
        
        
        
        
        <!--SEARCH-BAR-END-->
        <!--operator-BAR-->
        <div class="tb_operator">
            <div class="container">
                <div class="tb_inner">
                    <div class="row">
                        <div class="wrapper">
                            <div class="col-md-4 col-sm-12 col-xs-12">
                                <div class="tb_operator">
                                    <img src="assets/images/vehicles.png"> &nbsp;<span class="tb_operator1">100 <small class="smalls"> VEHICLES</small></span>
                                </div>
                            </div>
                            <div class="col-md-4  col-sm-12 col-xs-12">
                                <div class="tb_operator left"> 
                                    <img src="assets/images/gps.png">  &nbsp;<span class="tb_operator2"><small class="smalls"> GPS MONITORING</small></span>
                                </div>
                            </div>
                            <div class="col-md-4  col-sm-12 col-xs-12">
                                <div class="tb_operator right"> 
                                    <img src="assets/images/routes.png">  &nbsp;<span class="tb_operator3">200 + <small class="smalls"> ROUTES</small></span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        
        
        <!--operator-BAR end-->
        <!--offers-BAR-->
        <div class="tb_offers">
            <div class="shadow"><img src="assets/images/shadow.png"></div>
            <div class="outer">
                <div class="container">
                    <div class="tb_inner">
                        <div class="row">
                            <div class="wrapper">
                                <div class="col-md-4">
                                    <div class="tb_offers1">
                                        <img src="assets/images/booking.png">
                                        <div class="tb_list_offer">
                                            <div class="ofer_list">BOOKING</div>

                                            <div class="ofer_list_normal">Select required seat and book ticket easily.</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="tb_offers1">
                                        <img src="assets/images/tick.png">

                                        <div class="ofer_list">CHOICE</div>

                                        <div class="ofer_list_normal">Access to more vehicles from different bus operators.</div>

                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="tb_offers3">
                                        <img src="assets/images/gur.png">

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
    </div><!--list-BAR-->
    
    
    <div class="container">
        <div class="rb_list">
            <div class="row">
                <div class="wrapper">
                    <div class="tb_inner">
                        <div class="col-md-3">
                            <div class="footer_main">
                                <h4 class="tb_head">Top Bus Routers</h4>
                                <div class="tb_route_list">
                                    <ul>
                                        <li><a href="#">Kathmandu to Pokhara</a></li>
                                        <li><a href="#">Kathmandu to Butwal </a></li>
                                        <li><a href="#">Pokhara to Gorkha</a></li>
                                        <li><a href="#">Kathmandu to Biratnagar </a> </li>
                                        <li><a href="#">Lalitpur to Nepaljung</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="footer_main">
                                <h4 class="tb_head">Top Cities</h4>
                                <div class="tb_route_list">
                                    <ul>
                                        <li><a href="#">Kathmandu</a></li>
                                        <li><a href="#">Butwal </a></li>
                                        <li><a href="#">Pokhara</a></li>
                                        <li><a href="#">Biratnagar </a> </li>
                                        <li><a href="#">Gorkha</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="footer_main">
                                <h4>Top Customers</h4>
                                <div class="tb_route_list">
                                    <ul>
                                        <li><a href="#">Bijay</a></li>
                                        <li><a href="#">Prahlad</a></li>
                                        <li><a href="#">Ramesh</a></li>
                                        <li><a href="#">Suzan </a> </li>
                                        <li><a href="#">Sagar</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="footer_main">
                                <h4 class="tb_head">Top Bus Operators</h4>
                                <div class="tb_route_list">
                                    <ul>
                                        <li><a href="#">Chitwan Safari</a></li>
                                        <li><a href="#">Greenline </a></li>
                                        <li><a href="#">Blue Moon</a></li>
                                        <li><a href="#">Aroma </a> </li>
                                        <li><a href="#">Agni</a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <hr class="border2">
        </hr>
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
                            <li>  <a href="#"><img src="assets/images/facebook.png"></a> </li> 
                            <li>  <a href="#"> <img src="assets/images/twitter.png"></a></li>
                            <li>  <a href="#">  <img src="assets/images/google.png"></a></li>
                        </ul>
                    </div>
                    <a href="#" id="back-to-top" title="Back to top">&uarr;</a>
                </div>
            </div>
        </div>
    </div>	
    
    <script>

        base_url = "index.html";

    </script>
    <!--   custom JavaScript -->
    <script src="assets/js/angular/angular.js"></script>
    <script src="assets/js/dirPagination.js"></script>
    <script src="assets/js/search.js"></script>
    <script src="assets/js/service.js"></script>
    <script src="assets/js/truebus.js"></script>
    <script src="assets/js/rating.js"></script>   
    <script src="assets/js/bootstrap.js"></script>
    <script src="../malsup.github.io/jquery.form.js"></script> 
    <script src="assets/js/custom.js"></script>

    <script src="assets/js/jquery-datepicker.html"></script>
    <script src="assets/js/parsley.min.js"></script>

    <!-- IE10 viewport hack for Surface/desktop Windows 8 bug -->

    <script>
        $(document).ready(function () {

            $('#pickDate').click(function (e) {
                $(this).next().datepicker('show');
            });
            $(".pickup_date").datepicker({

                minDate: 0//this option for allowing user to select from year range
            });


            $(".returnsd").datepicker({

                minDate: new Date($(".datetimepicker4").val())

                        //this option for allowing user to select from year range
            });
            $(".pickup_date").on('change', function (e) {

                $("#Calenderreturn").datepicker({

                    minDate: new Date($(".Calenderfrom").val())

                            //this option for allowing user to select from year range
                });
            });
            $(".date_of_birth").datepicker({
                changeYear: 'true',
                changeMonth: 'true'

            });
            $('ul.tabs li').click(function () {
                var id = $(this).data('id');
                //alert(id);
                var tab_id = $(this).attr('data-tab');

                $('ul.tabs li').removeClass('current');
                $('.tab-content').removeClass('current');

                $(this).addClass('current');
                $("#" + tab_id).addClass('current');

                $('#pament_option').val(id);
            });
        });
    </script>
    
</body>
</html>
