package com.mvc.dao;

import java.sql.*;
import com.mvc.bean.LoginBean;
import com.mvc.util.DBConnection;

public class LoginDao {

    public LoginBean authenticateUser(String email,String password) {
        Connection con;
        PreparedStatement statement;
        ResultSet resultSet;
        String passwordDB;
        try {
            con = DBConnection.getConnection(); //establishing connection
            String sql = "select * from users where email=? and password=? ";
            statement = con.prepareStatement(sql);//Statement is used to write queries. Read more about it.
            statement.setString(1, email);
            statement.setString(2, password);
            resultSet = statement.executeQuery();
            while (resultSet.next()) // Until next row is present otherwise it return false
            {
                LoginBean l = new LoginBean();
                l.setUserName(resultSet.getString("username"));
                l.setEmail(resultSet.getString("email"));
                l.setPhone(resultSet.getString("phone"));
                l.setAddress(resultSet.getString("address"));
                return l; ////If the user entered values are already present in database, which means user has already registered so I will return SUCCESS message.

            }
        } catch (SQLException e) {
        }
        return null; // Just returning appropriate message otherwise
    }
}
