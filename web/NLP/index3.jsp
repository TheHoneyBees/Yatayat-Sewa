<!DOCTYPE html>
<html>
    <head>
        <style>
            v.box2{margin:2px;border:1px solid pink;padding:10px;background-color:#e3e3e3}
        </style>
        <link rel="stylesheet" href="stylec.css"> 
    </head>
    <body>
        <%@ page import="java.sql.*" %>
        <%
            String comment = request.getParameter("comment");
            String email = request.getParameter("email");
            try {
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/yatayat", "root", "");
                PreparedStatement ps = con.prepareStatement("insert into comment(comment,user_name) values(?,?)");
                ps.setString(1, comment);
                ps.setString(2, email);
                int i = ps.executeUpdate();
                con.close();
            } catch (Exception e) {
                out.print(e);
            }
        %>
    </body>
</html>