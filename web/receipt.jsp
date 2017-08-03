<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<!doctype html>
<html>
    <head>
        <link rel="shortcut icon" type="image/png" href="assets/images/titlelogo.png"/>
        <title>Yatayat Sewa - Receipt</title>
        <style>
            .invoice-box{
                max-width:800px;
                margin:auto;
                padding:30px;
                border:1px solid #eee;
                box-shadow:0 0 10px rgba(0, 0, 0, .15);
                font-size:16px;
                line-height:24px;
                font-family:'Helvetica Neue', 'Helvetica', Helvetica, Arial, sans-serif;
                color:#555;
            }

            .invoice-box table{
                width:100%;
                line-height:inherit;
                text-align:left;
            }

            .invoice-box table td{
                padding:5px;
                vertical-align:top;
            }

            .invoice-box table tr td:nth-child(2){
                text-align:right;
            }

            .invoice-box table tr.top table td{
                padding-bottom:20px;
            }

            .invoice-box table tr.top table td.title{
                font-size:45px;
                line-height:45px;
                color:#333;
            }

            .invoice-box table tr.information table td{
                padding-bottom:40px;
            }

            .invoice-box table tr.heading td{
                background:#eee;
                border-bottom:1px solid #ddd;
                font-weight:bold;
            }

            .invoice-box table tr.details td{
                padding-bottom:20px;
            }

            .invoice-box table tr.item td{
                border-bottom:1px solid #eee;
            }

            .invoice-box table tr.item.last td{
                border-bottom:none;
            }

            .invoice-box table tr.total td:nth-child(2){
                border-top:2px solid #eee;
                font-weight:bold;
            }

            @media only screen and (max-width: 600px) {
                .invoice-box table tr.top table td{
                    width:100%;
                    display:block;
                    text-align:center;
                }

                .invoice-box table tr.information table td{
                    width:100%;
                    display:block;
                    text-align:center;
                }
            }
        </style>
    </head>

    <body>
        <%    Date date = new Date();
            DateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
            SimpleDateFormat timeFormatter = new SimpleDateFormat("HH:mm a");
            String dateAsString = sdf.format(date);
            String timeAsString = timeFormatter.format(date);
        %>
        <div class="invoice-box">
            <table cellpadding="0" cellspacing="0">
                <tr class="top">
                    <td colspan="2">
                        <table>
                            <tr>
                                <td class="title">
                                    <img src="assets/images/yatayat_logo.png" style="width:50%; max-width:200px;">
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>

                <tr class="information">
                    <td colspan="2">
                        <table>
                            <tr>
<!--                                productid:<%=request.getParameter("oid")%><br>
                            Total amt: <%=request.getParameter("amt")%><br>
                            Ref id:<%=request.getParameter("refId")%><br>-->
                                <td> 
                                    User: <%=session.getAttribute("username")%><br>
                                    Phone: <%=session.getAttribute("phone")%><br>
                                    Address: <%=session.getAttribute("address")%><br>
                                    Booked Date: <%=dateAsString%><br>
                                    Booked Time: <%=timeAsString%><br>
                                </td> 
                                <td>Departure: <%=session.getAttribute("dep")%><br>
                                    Destination: <%=session.getAttribute("des")%><br>
                                    Vehicle No: <%=session.getAttribute("bus_id")%><br>
                                    Vehicle Name: <%=session.getAttribute("busname")%><br>
                                    Travel Type: <%=session.getAttribute("traveltype")%>	<br>
                                    Departure Time: <%=session.getAttribute("deptime")%>	<br>

                                </td>                           
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr class="heading">
                    <td>
                        Seat No: 
                        <%=session.getAttribute("bookedseats")%>
                    </td>

                    <td>
                        Price:
                        <%=session.getAttribute("total")%>
                    </td>
                </tr>
            </table>
    </body>
</html>