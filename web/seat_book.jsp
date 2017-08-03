
<!DOCTYPE html>
<html>
<head>
<link rel="shortcut icon" type="image/png" href="assets/images/titlelogo.png"/>
<title>Yatayat Sewa - Seat Book</title>
<link rel="stylesheet" type="text/css" href="css/jquery.seat-charts.css">
<link href="css/style_seat.css" rel="stylesheet" type="text/css" media="all" />
<script src="js/jquery-1.11.0.min.js"></script>
<script src="js/jquery.seat-charts.js"></script>
	<link href="assets/css/bus.css" rel="stylesheet">
	<link href="assets/css/parsley.css" rel="stylesheet">
		<link href="assets/css/bootstrap.css" rel="stylesheet">
</head>
<body>
 <!--HEADER-BAR-->
<div class="tb_header">
      <div class="container">
		<div class="col-md-6" style="padding:0;">
			<div class="tb_logo"> <a href="index.html"><img src="assets/images/yatayat_logo.png"> </a> </div>
		</div>
		<div class="col-md-4" style="padding:0;">
		<div class="tb_navbar">
			<ul>
		                   <li><a href="index.html">Home &nbsp;<span style="color:#f0a2a3;"> |</span></a></li>
				</ul>
			</div>
		</div>				
      </div>
      <div class="shadow"><img src="assets/images/shadow.png"></div>
</div>
        
<div class="content">
	<div class="main">
		<h2>Book Your Seat Now?</h2>
                <%=session.getAttribute("username")%>
		<div class="wrapper">
			<div id="seat-map">
				<div class="front-indicator"><h3>Front</h3></div>
			</div>
			<div class="booking-details">
						<div id="legend"></div>
						<h3> Selected Seats (<span id="counter">0</span>):</h3>
						<ul id="selected-seats" class="scrollbar scrollbar1"></ul>
						
						Total: <b>Rs.<span id="total">0</span></b>
						 
						<button class="checkout-button"><a href="receipt.jsp">Pay Now</a></button>
			</div>
			<div class="clear"></div>
		</div>
	</div>
</div>
<script src="js/jquery.seat.charts1.js"></script>		
<script src="js/jquery.nicescroll.js"></script>
<script src="js/scripts.js"></script>

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
<div class="container">
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
						<li><a href="#">Privacy Policy   &nbsp;</a></li>
						</ul>
					</div>
						<div class="footer_con">  &#169;  2016</div>
				</div>
					<div class="col-md-3">
						<div class="tb_social">
							<ul>
							<li>  <a href="http://facebook.com"><img src="assets/images/facebook.png"></a> </li> 
							<li>  <a href="http://twitter.com"> <img src="assets/images/twitter.png"></a></li>
							<li>  <a href="http://google.com">  <img src="assets/images/google.png"></a></li>
							</ul>
						</div>
						<a href="#" id="back-to-top" title="Back to top">&uarr;</a>
					</div>
			</div>
        </div>
    </div>	

</body>

</html>
