<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" href="stylec.css">
        <script>
            var request;
            function postComment() {
                var comment = document.commentform.comment.value;
                var email = document.commentform.email.value;
                alert(comment + email);
                var url = "newjsp.jsp?comment=" + comment + "&email=" + email;
                if (window.XMLHttpRequest) {
                    request = new XMLHttpRequest();
                } else if (window.ActiveXObject) {
                    request = new ActiveXObject("Microsoft.XMLHTTP");
                }
                try {
                    request.onreadystatechange = function () {
                        if (request.readyState === 4) {
                            var val = request.responseText;
                            document.getElementById('mylocation').innerHTML = val;
                        }
                    };//end of function
                    request.open("GET", url, true);
                    request.send();
                } catch (e) {
                    alert("Unable to connect to server");
                }

            }




            $(document).ready(function () {
                $("#check").click(function () {
                    alert();
                    $.ajax({
                        url: "CommentServlet",
                        type: "POST",
                        data: {
                            bus_id: 'ba_1_kha_7886'
//                            email: $('#login_email').val(),
//                            password: $('#login_password').val()
                        },
                        success: function (responseText) {
                            $('#commentBox').val(responseText);
                        }
//                            if (responseText === "FAILED") {
//                                alert("Invalid Username or Password");
//                            } else {
//                                $("#first").hide();
//                                //$("#ok").val(responseText);
//                                $("#second").show();
//                                $("#refundCancel").show();
//                                $("#ok").text(responseText);
//                                $('#myModals').fadeOut();
//                                // $('body').removeClass('modal-open');
//                                $('.modal-backdrop').remove();
//                            }

                        // $( "#login_close_btn" ).trigger( "click" );
                    });
                });
            });
        </script>
    </head>
    <body><button id="check"></button>
        <div id="commentBox"></div>
        <div>
<!--            <a href="#popup1">Let me Pop up</a>-->
        </div>
        <div id="popup1" class="overlayc">
            <div class="popup">
                <a class="closec" href="#">&times;</a>
                <div class="content">
                    <h1>Comment Form</h1>
                    <form name="commentform">
                        Enter Comment:<br/>
                        <textarea id="commentBox" name="comment" style="width:800px;height:50px" required></textarea>
                        <br/>
                        Enter Email:<br/>
                        <input type="text" name="email" required/><br/><br/>

                        <input type="button" value="Post Comment" onclick="postComment()">
                    </form>

                    <span id="mylocation"></span>
                    <%@ page import="java.sql.*" %>
                    <%
                        Class.forName("com.mysql.jdbc.Driver");
                        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/yatayat", "root", "");
                        PreparedStatement ps2 = con.prepareStatement("select * from comment");
                        ResultSet rs = ps2.executeQuery();
                        out.print("<hr/><h2>Comments:</h2>");
                        while (rs.next()) {
                            out.print("<p>" + rs.getString("Description") + "</p>");
                            out.print("<p><strong>By: " + rs.getString("Customer_id") + "</strong></p>");
                            out.print("</div>");
                        }
                    %>
                </div>
            </div>
        </div>
    </body>
</html>