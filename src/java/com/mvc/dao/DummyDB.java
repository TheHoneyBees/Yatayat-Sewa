/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mvc.dao;
import com.mvc.util.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
/**
 *
 * @author boude
 */
public class DummyDB {
    public List<String> searchDepartLocation(String name) throws SQLException {
        ArrayList<String>Locations=new ArrayList<>();
        //System.out.println(what + "-----------------------------------=--==-=-=-=-=-=-=-=-=-=-=");
        try {
            Connection con = DBConnection.getConnection();
            String query = "select distinct(departure) from schedule where departure like ?  ";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setString(1, name + "%");
            ResultSet resultSet = pst.executeQuery();
            while (resultSet.next()) {
                String temp=resultSet.getString("departure");
               Locations.add(temp);
                System.out.println(temp + "***************");
            }
            return Locations;
        } catch (SQLException e) {
        }
        return null;
    }
}
