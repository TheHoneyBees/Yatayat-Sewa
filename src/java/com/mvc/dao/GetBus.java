package com.mvc.dao;

import com.mvc.bean.Board_PointBean;
import com.mvc.bean.CommentBean;
import com.mvc.bean.ScheduleBean;
import com.mvc.util.DBConnection;
import java.sql.*;
import java.util.ArrayList;

/**
 *
 * @author boude
 */
public class GetBus {

    public ScheduleBean getSchedule(int scheduleid) {
        System.out.println("busnumber in get" + scheduleid);
        String query;
        PreparedStatement pst;
        ResultSet resultSet;
        ScheduleBean busSchedule = new ScheduleBean();
        try {
            Connection con = DBConnection.getConnection();
            query = "select * from schedule where schedule_id=?";
            pst = con.prepareStatement(query);
            pst.setInt(1, scheduleid);
            resultSet = pst.executeQuery();
            while (resultSet.next()) // Until next row is present otherwise it return false
            {
                busSchedule.setScheduleid(scheduleid);
                busSchedule.setBus_name(resultSet.getString("bus_name"));
                busSchedule.setBus_number(resultSet.getString("bus_number"));
                busSchedule.setDeparture_date(resultSet.getString("departure_date"));
                busSchedule.setDeparture_time(resultSet.getString("departure_time"));
                busSchedule.setDeparture(resultSet.getString("departure"));
                busSchedule.setDestination(resultSet.getString("destination"));
                busSchedule.setDestination_time(resultSet.getString("destination_time"));
                busSchedule.setTravel_type(resultSet.getString("travel_type"));
                busSchedule.setFare(resultSet.getString("fare"));
                busSchedule.setAvailable_seats(resultSet.getString("available_seats"));
                busSchedule.setTotal_seats(resultSet.getString("total_seats"));
            }
            return busSchedule;
        } catch (SQLException e) {
        }
        return null;
    }

    public int getRouteId(String source, String destination) {
        String query;
        PreparedStatement pst;
        ResultSet resultSet;
        int routeid = 0;
        try {
            Connection con = DBConnection.getConnection();
            query = "select route_id from routes where source=? and destination=?";
            pst = con.prepareStatement(query);
            pst.setString(1, source);
            pst.setString(2, destination);
            resultSet = pst.executeQuery();
            while (resultSet.next()) // Until next row is present otherwise it return false
            {
                routeid = resultSet.getInt("route_id");
            }
            return routeid;
        } catch (SQLException e) {
        }
        return 0;
    }

    public ArrayList<Board_PointBean> getBoardPoints(int routeid, int scheduleid) {
        String query;
        PreparedStatement pst;
        ResultSet resultSet;
        ArrayList<Board_PointBean> a = new ArrayList<>();
        try {
            Connection con = DBConnection.getConnection();
            query = "select * from bpoints where route_id=? and schedule_id=?";
            pst = con.prepareStatement(query);
            pst.setInt(1, routeid);
            pst.setInt(2, scheduleid);
            resultSet = pst.executeQuery();
            while (resultSet.next()) // Until next row is present otherwise it return false
            {
                Board_PointBean b = new Board_PointBean(resultSet.getString("boarding_points"), resultSet.getString("time"));
                a.add(b);
            }
            return a;
        } catch (SQLException e) {
        }
        return null;
    }

    public ArrayList<CommentBean> getComments(String bus_number) {
        String query;
        PreparedStatement pst;
        ResultSet resultSet;
        ArrayList<CommentBean> a = new ArrayList<>();
        try {
            Connection con = DBConnection.getConnection();
            query = "select * from comment where bus_number=?";
            pst = con.prepareStatement(query);
            pst.setString(1, bus_number);
            resultSet = pst.executeQuery();
            while (resultSet.next()) // Until next row is present otherwise it return false
            {
                CommentBean cb = new CommentBean();
                cb.setEmail_id(resultSet.getString("email_id"));
                cb.setBus_number(resultSet.getString("bus_number"));
                cb.setDescription(resultSet.getString("description"));
                cb.setComment_date(resultSet.getString("comment_date"));
                cb.setRemark(resultSet.getString("remark"));
                a.add(cb);
            }
            return a;
        } catch (SQLException e) {
        }
        return null;
    }
}
