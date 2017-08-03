/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mvc.dao;

import com.mvc.util.DBConnection;
import java.sql.PreparedStatement;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Connection;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 *
 * @author boude
 */
public class insertReview {

    String email;
    String username;
    String bus_number;
    String comment;
    String remark;

    public insertReview(String email, String username, String bus_number, String comment, String remark) {
        this.email = email;
        this.username = username;
        this.bus_number = bus_number;
        this.comment = comment;
        this.remark = remark;
        Date d = new Date();
        DateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
        String date = sdf.format(d);
        PreparedStatement pst;
        ResultSet rs;
        Connection con = DBConnection.getConnection();
        String query = "insert into comment(id,username,email_id,bus_number,description,comment_date,remark) values (null,?,?,?,?,?,?)";
        try {
            pst = con.prepareStatement(query);
            pst.setString(1, username);
            pst.setString(2, email);
            pst.setString(3, bus_number);
            pst.setString(4, comment);
            pst.setString(5, date);
            pst.setString(6, remark);
            pst.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(insertReview.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
