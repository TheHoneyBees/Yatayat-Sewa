package com.mvc.dao;

import com.mvc.bean.SearchBus;
import java.sql.*;
import java.util.ArrayList;
import com.mvc.util.DBConnection;
import java.util.List;

public class SearchDao {

    ArrayList<SearchBus> buslist = new ArrayList();
    SearchBus bus_detail;
    String query = null;
    PreparedStatement pst = null;
    ResultSet resultSet = null;
    int routeid;

    public List<SearchBus> SearchVehicle(SearchBus bus) {
        try {
            Connection con = DBConnection.getConnection();
            String myquery = "select * from routes where source=? and destination=? ";
            pst = con.prepareStatement(myquery);
            pst.setString(1, bus.getFrom_address());
            pst.setString(2, bus.getTo_address());
            ResultSet r = pst.executeQuery();
            while (r.next()) {
                routeid = r.getInt("route_id");
            }
            if ("both".equals(bus.getTravel_type())) {
                query = "select * from schedule where departure=? and destination=? and departure_date=? and available_seats>=1";
                pst = con.prepareStatement(query);
                pst.setString(1, bus.getFrom_address());
                pst.setString(2, bus.getTo_address());
                pst.setString(3, bus.getDate());
            } else {
                query = "select * from schedule where travel_type=? and departure=? and destination=? and departure_date=?  and available_seats>=1";
                pst = con.prepareStatement(query);
                pst.setString(1, bus.getTravel_type());
                pst.setString(2, bus.getFrom_address());
                pst.setString(3, bus.getTo_address());
                pst.setString(4, bus.getDate());
            }
            resultSet = pst.executeQuery();
            while (resultSet.next()) // Until next row is present otherwise it return false
            {
                bus_detail = new SearchBus();
                bus_detail.setRouteid(routeid);
                bus_detail.setScheduleid(resultSet.getInt("schedule_id"));
                bus_detail.setFrom_address(resultSet.getString("departure"));
                bus_detail.setTo_address(resultSet.getString("destination"));
                bus_detail.setName(resultSet.getString("bus_name"));
                bus_detail.setBus_number(resultSet.getString("bus_number"));
                bus_detail.setDate(resultSet.getString("departure_date"));
                bus_detail.setTime(resultSet.getString("departure_time"));
                bus_detail.setTravel_type(resultSet.getString("travel_type"));
                bus_detail.setSeats(resultSet.getInt("available_seats"));
                bus_detail.setFare(resultSet.getInt("fare"));
                buslist.add(bus_detail);
            }
            return buslist;
        } catch (SQLException e) {
        }
        return null;
    }
}
