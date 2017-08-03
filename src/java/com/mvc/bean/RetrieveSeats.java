/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mvc.bean;

import com.mvc.util.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author boude
 */
public class RetrieveSeats {

    public ArrayList<String> getSeat(String bus_id) {
        PreparedStatement pst;
        ResultSet resultSet;
        ArrayList<String> emptyseats = new ArrayList<>();
        int i = 0;
        int status=0;
        try {
            Connection con = DBConnection.getConnection();
            String qry = "select seatname from "+bus_id+" where status='1'";
            pst = con.prepareStatement(qry);
            resultSet = pst.executeQuery();
            while (resultSet.next()) 
            {
                emptyseats.add(resultSet.getString("seatname"));
                i++;
                System.out.println("i ko value on retrieve="+i);
            }
           
            return emptyseats;
        } catch (SQLException exception) {
        }
        return null;
    }

}
