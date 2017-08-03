<!DOCTYPE html>
<html>
    <head>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <!-- load autocomplete-->
        <script type="text/javascript" src="js/jquery.min.js"></script>

        <script src="js/jquery.autocomplete.js"></script> 
        <link rel="stylesheet" type="text/css" href="css/jquery.autocomplete.css" />
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
        <script type="text/javascript">
            $(document).ready(function () {
                $("#check").click(function () {
                    $.ajax({
                        url: "LoginServlet",
                        type: "POST",
                        data: {
                            email: $('#login_email').val(),
                            password: $('#login_password').val()
                        },
                        success: function (responseText) {

                            if (responseText === "FAILED") {
                                alert("Invalid Username or Password");
                            } else {
                                $("#first").hide();
                                //$("#ok").val(responseText);
                                $("#second").show();
                                $("#bookbtnfirst").hide();
                                $("#bookbtn").show();
                                $("#ok").text(responseText);
                                $('#forsubmitreview').val(responseText);
                                $('#myModals').fadeOut();
                                // $('body').removeClass('modal-open');
                                $('.modal-backdrop').remove();
                            }

                            // $( "#login_close_btn" ).trigger( "click" );
                        },

                        error: function (responseText) {
                            alert("Sorry, there was a problem!" + responseText);
                        }
                    });

                });


                $('#test').delay(2000).fadeOut();
            });
        </script>
    </head>
    <body>
        <%String username = null;
            username = (String) session.getAttribute("username");
        %>
        <input type="hidden" id="forsubmitreview" value="<%=username%>">
        <div class="tb_header">
            <div class="container">
                <div class="col-md-6" style="padding:10;">
                    <div class="tb_logo"> <a href="homeLoginSession"><img src="assets/images/yatayat_logo.png"> </a> </div>
                </div>
                <div class="col-md-4" style="padding:0;">
                    <div class="tb_navbar">
                        <ul>
                            <li><a href="homeLoginSession">Home &nbsp;<span style="color:#f0a2a3;"> |</span></a></li>

                            <li><a href="#">Easy Cancel/Refund</a> </li>
                        </ul>
                    </div>
                </div>
                <div class="col-md-2" style="padding:0;">

                    <div class="signin_up">
                        <ul>
                            <%if (username == null) {%>
                            <div id="first">

                                <li><a href="#myModals" id="forlogin" data-toggle="modal" data-target="#myModals">&nbsp;&nbsp;Sign In</a>
                                    <span style="color:#f0a2a3;">/</span></li>
                                <li><a  data-dismiss="modal" href="#myModal" data-toggle="modal" data-target="#myModal">Sign Up</a></li>
                                    <%} else {%>
                                &nbsp;
                                <li><a href="#" >Welcome  <%=username%></a>  <span style="color:#f0a2a3;">/</span></li>
                                <li><a href="logout">Logout</a></li>
                                    <%}%>
                            </div>
                            <div id="second" hidden="true">
                                <li><z href="#" id="ok" ></z>
                                <span style="color:#f0a2a3;">/</span></li>
                                <li><a   href="logout" >Logout</a></li>
                            </div>


                        </ul>
                    </div>

                </div>
                <div class="shadow"><img src="${pageContext.request.contextPath}/assets/images/shadow.png"></div>
            </div>

        </div>


        <!--HEADER-BAR-END-->
        <!-- Modal -->
        <div class="modal fade" id="myModals" role="dialog">
            <div class="modal-dialog">
                <!-- Modal content-->
                <button type="button" class="close_lft" data-dismiss="modal">&times;</button>
                <div class="login-block">
                    <form action="LoginServlet" method="post" autocomplete="off" >
                        <h1 >Login</h1>
                        <input type="text" name="email" id="login_email" placeholder="Email" class ="username" required/>
                        <input type="password" class="password" name="password" placeholder="Password" id="login_password" required/>
                        <!--                        <input type="checkbox" id="checkbox3" class="css-checkbox" name="rememberme"/>
                                                <label for="checkbox3" >Remember Me</label>-->

                        <input type="button" value="Login" id="check"  ></form>
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

                        <input  type="submit" value="Sign up" style="position: relative; "onclick="Signup()"/>
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




        <!--   custom JavaScript -->
        <script src="assets/js/angular/angular.js"></script>
        <script src="assets/js/dirPagination.js"></script>
        <script src="assets/js/search.js"></script>
        <script src="assets/js/service.js"></script>
        <script src="assets/js/bus.js"></script>
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
