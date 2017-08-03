package com.mvc.dao;

import java.sql.*;
import com.mvc.bean.RegisterBean;
import com.mvc.util.DBConnection;

public class RegisterDao {

    public String registerUser(RegisterBean registerBean) {
        String username=registerBean.getUsername();
        String email = registerBean.getEmail();
        String phone = registerBean.getPhone();
        String password = registerBean.getPassword();
        System.out.println("registerservlet for reg"+username+email+phone+password);
        PreparedStatement preparedStatement;
        Connection con;
        ResultSet rs;
        con = DBConnection.getConnection();
        try {
            PreparedStatement stmt = con.prepareStatement("select * from users where email=?");
            stmt.setString(1, email);
            ResultSet r = stmt.executeQuery();
            boolean hasRows = false;
            while (r.next()) {
                hasRows = true;
                System.out.println("llllllllooooollllll");
               return "failed";
            }
            if (!hasRows) {
                System.out.println("empty record so inserting");
                String query = "insert into users(id,username,email,phone,password,address) values (null,'ram',?,?,?,'ktm')"; //Insert user details into the table 'USERS'
                preparedStatement = con.prepareStatement(query); //Making use of prepared statements here to insert bunch of data
                preparedStatement.setString(1, email);
                preparedStatement.setString(2, phone);
                preparedStatement.setString(3, password);
                int i = preparedStatement.executeUpdate();
                if (i != 0) //Just to ensureexecuteUpdate data has been inserted into the database
                {
                    return "SUCCESS";
                }

            } else {
                return "failed";
            }
        } catch (SQLException e) {
        }
        return "failed";
    }
}
