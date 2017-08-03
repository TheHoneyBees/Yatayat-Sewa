/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tracking;

import com.mvc.util.DBConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONObject;
import org.json.JSONArray;

/**
 *
 * @author boude
 */
@WebServlet(name = "track_servlet", urlPatterns = {"/track_servlet"})
public class track_servlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {

            Connection con = DBConnection.getConnection();
            PreparedStatement stmt;
            String lat, lon, date = "2017-05-29";
            //   JSONArray ja=new JSONArray();
            try {
                JSONArray ja = new JSONArray();
                //stmt = con.prepareStatement("select lat, lon, date_format(recorded_datetime, '%M %d %Y %h:%i %p') as recorded_time from current_location order by id desc limit 1");
                 stmt = con.prepareStatement("select lat, lon, date_format(recorded_datetime, '%M %d %Y %h:%i %p') as recorded_date,date_format(recorded_datetime, '%h:%i:%s %p') as recorded_time from current_location where STR_TO_DATE(recorded_datetime,'%Y-%m-%d')='"+date+"'order by id" );
                ResultSet rs = stmt.executeQuery();
                while (rs.next()) {
                    lat = rs.getString("lat");
                    lon = rs.getString("lon");
                    date = rs.getString("recorded_date");
                    JSONObject jo = new JSONObject();
                    jo.put("lat", lat);
                    jo.put("lon", lon);
                    jo.put("date", date);
                    jo.put("time", date);
                    System.out.println(lat + lon + date+"hello");
                    ja.put(jo);
                }
                out.print(ja);
            } catch (SQLException ex) {
                Logger.getLogger(track_servlet.class.getName()).log(Level.SEVERE, null, ex);
            }

        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
        //String date = request.getParameter("date");
//        String query = "select lat, lon, date_format(recorded_datetime, '%M %d %Y %h:%i %p') as recorded_time from current_location order by id desc limit 1";
//        Connection con;
//        PreparedStatement preparedStatement;
//        ResultSet rs;
//         JSONObject obj = null;
//        con = DBConnection.getConnection();
//        try {
//            PreparedStatement stmt = con.prepareStatement(query);
////            stmt.setString(1, email);
//            rs = stmt.executeQuery();
//            if (!rs.next()) {
//            String lat = rs.getString("lat");
//            String lon = rs.getString("lon");
//            String date = rs.getString("date");
//            String time = rs.getString("time");
//           obj = new JSONObject();
//            obj.put("lat", lat);
//            obj.put("lon", lon);
//            obj.put("data", date);
//            obj.put("time", time); 
//        }
//             try (PrintWriter out = response.getWriter()) {
//             out.println(String.valueOf(obj));
//             }
//
//    }
//    catch (SQLException e) {}

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
