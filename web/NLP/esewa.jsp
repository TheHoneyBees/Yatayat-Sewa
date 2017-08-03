<%-- 
    Document   : newjsp1
    Created on : Jul 18, 2017, 7:50:37 PM
    Author     : boude
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
       <form action="https://dev.esewa.com.np/epay/main" method="POST">
                Total Amount<input value="10" name="tAmt" type="text"><br> 
                Amount<input value="10" name="amt" type="text"><br>
                Tax Amount<input value="0" name="txAmt" type="text"><br>
                Product Service Charge<input value="0" name="psc" type="text"><br> 
                Product Delivery Charge<input value="0" name="pdc" type="text"><br> 
                Merchant Service Code<input value="eSewa_KEC" name="scd" type="hidden"><br>    
                Product Id<input value="XYZ-1234" name="pid" type="text"><br>   
                Success Url<input value="http://localhost:8080/Yatayat_Sewa/receipt.jsp" type="text" name="su"><br>   
                Failure Url<input value="http://localhost:8080/Yatayat_Sewa/error.jsp" type="text" name="fu"><br>
                Submit<input value="Submit" type="submit"><br> 
            </form>
    </body>
</html>
