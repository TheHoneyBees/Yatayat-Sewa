/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mvc.controller;

import com.mvc.util.DBConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.text.DateFormat;
import java.util.Date;
import java.util.function.Consumer;

/**
 *
 * @author boude
 */
@WebServlet(name = "book_now", urlPatterns = {"/book_now"})
public class book_now extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        Date date = new Date();
        DateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
        SimpleDateFormat timeFormatter = new SimpleDateFormat("hh:mm a");
        String dateAsString = sdf.format(date);
        String timeAsString = timeFormatter.format(date);
        String total = request.getParameter("total");
        String bookedseats = request.getParameter("bookedseats");
        HttpSession session = request.getSession(false);
        String bus_id = (String) session.getAttribute("bus_id");
        HttpSession lastSession = request.getSession();
        lastSession.setAttribute("username", lastSession.getAttribute("username"));
        lastSession.setAttribute("email", lastSession.getAttribute("email"));
        lastSession.setAttribute("phone", lastSession.getAttribute("phone"));
        lastSession.setAttribute("address", lastSession.getAttribute("address"));
        lastSession.setAttribute("busname", lastSession.getAttribute("busname"));
        lastSession.setAttribute("bus_id", lastSession.getAttribute("bus_id"));
        lastSession.setAttribute("deptime", lastSession.getAttribute("deptime"));
        lastSession.setAttribute("traveltype", lastSession.getAttribute("traveltype"));
        lastSession.setAttribute("dep", lastSession.getAttribute("dep"));
        lastSession.setAttribute("des", lastSession.getAttribute("des"));
        lastSession.setAttribute("total", total);
        lastSession.setAttribute("bookedseats", bookedseats);
        int count = 0;
        List<String> seatList = Arrays.asList(bookedseats.split(","));//split seat to arraylist
        ArrayList<String> failedseats = new ArrayList<>();
        try (PrintWriter out = response.getWriter()) {
            Connection con = DBConnection.getConnection();
            PreparedStatement pst;
            for (int i = 0; i < seatList.size(); i++) {
                String myquery = "update \t" + bus_id + " set status='1' where seatname=? and status='0' ";
                pst = con.prepareStatement(myquery);
                pst.setString(1, seatList.get(i).trim());
                int j = pst.executeUpdate();
                if (j == 1) {
                    count++;
                } else {
                    failedseats.add(seatList.get(i));
                }
            }
            if (count == seatList.size()) {
                String bookquery = "insert into booking (ticket_no,book_date,book_time,customer_email,bus_number,booked_seats,amount)"
                        + "values(null,?,?,?,?,?,?)";
                pst = con.prepareStatement(bookquery);
                pst.setString(1, dateAsString);
                pst.setString(2, timeAsString);
                pst.setString(3, (String) lastSession.getAttribute("email"));
                pst.setString(4, (String) lastSession.getAttribute("bus_id"));
                pst.setString(5, bookedseats);
                pst.setString(6, total);
                pst.execute();
                con.close();
                RequestDispatcher rd = request.getRequestDispatcher("receipt.jsp");
                rd.forward(request, response);
            } else {
                out.print("Seats ");
                failedseats.forEach((String s) -> {
                    out.print(s+",");
                });
                out.print(" are just booked. Please try again");
                return;
            }
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(book_now.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(book_now.class.getName()).log(Level.SEVERE, null, ex);
        }
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
