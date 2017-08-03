/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mvc.controller;

import com.mvc.bean.RetrieveSeats;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "SeatServlet", urlPatterns = {"/SeatServlet"})
public class SeatServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String oneA = null, oneB = null, twoA = null, twoB = null, threeA = null, threeB = null, fourA = null, fourB = null, fiveA = null, fiveB = null, sixA = null, sixB = null, sevenA = null, sevenB = null, eightA = null, eightB = null, nineA = null, nineB = null,
                tenA = null, tenB = null, elevenA = null, elevenB = null, twelveA = null, twelveB = null, thirtA = null, thirtB = null, fourtA = null, fourtB = null, lastOne = null, lastTwo = null, lastThree = null, lastFour = null, lastFive = null;
        String dis = "disabled";
        RetrieveSeats retrieveSeats;
        ArrayList<String> emptyseats;
        try (PrintWriter out = response.getWriter()) {
            retrieveSeats = new RetrieveSeats();
            emptyseats = retrieveSeats.getSeat(request.getParameter("bus_id"));
            String dep = request.getParameter("dep");
            String des = request.getParameter("des");
            String deptime = request.getParameter("deptime");
            String bus_id = request.getParameter("bus_id");
            String fare = request.getParameter("fare");
            String busname = request.getParameter("busname");
            String traveltype = request.getParameter("traveltype");
            System.out.println(dep + des + bus_id + fare + busname + traveltype);
            HttpSession s = request.getSession(false);
            HttpSession newsession = request.getSession();
            newsession.setAttribute("username", s.getAttribute("username"));
            newsession.setAttribute("email", s.getAttribute("email"));
            newsession.setAttribute("phone", s.getAttribute("phone"));
            newsession.setAttribute("address", s.getAttribute("address"));
            newsession.setAttribute("dep", dep);
            newsession.setAttribute("des", des);
            newsession.setAttribute("bus_id", bus_id);
            newsession.setAttribute("fare", fare);
            newsession.setAttribute("busname", busname);
            newsession.setAttribute("traveltype", traveltype);
            newsession.setAttribute("deptime", deptime);
            System.out.println((String) newsession.getAttribute("traveltype") + (String) newsession.getAttribute("busname") + (String) newsession.getAttribute("fare") + (String) newsession.getAttribute("bus_id") + (String) newsession.getAttribute("dep") + newsession.getAttribute("des") + "assign==============" + newsession.getAttribute("username") + newsession.getAttribute("email") + newsession.getAttribute("phone") + newsession.getAttribute("address"));
            for (int i = 0; i < emptyseats.size(); i++) {
                System.out.println(i);
                System.out.println("seat haruk o list" + emptyseats.get(i));
                switch (emptyseats.get(i)) {
                    case "1A":
                        oneA = dis;
                        break;
                    case "1B":
                        oneB = dis;
                        break;
                    case "2A":
                        twoA = dis;
                        break;
                    case "2B":
                        twoB = dis;
                        break;
                    case "3A":
                        threeA = dis;
                        break;
                    case "3B":
                        threeB = dis;
                        break;
                    case "4A":
                        fourA = dis;
                        break;
                    case "4B":
                        fourB = dis;
                        break;
                    case "5A":
                        fiveA = dis;
                        break;
                    case "5B":
                        fiveB = dis;
                        break;
                    case "6A":
                        sixA = dis;
                        break;
                    case "6B":
                        sixB = dis;
                        break;
                    case "7A":
                        sevenA = dis;
                        break;
                    case "7B":
                        sevenB = dis;
                        break;
                    case "8A":
                        eightA = dis;
                        break;
                    case "8B":
                        eightB = dis;
                        break;
                    case "9A":
                        nineA = dis;
                        break;
                    case "9B":
                        nineB = dis;
                        break;
                    case "10A":
                        tenA = dis;
                        break;
                    case "10B":
                        tenB = dis;
                        break;
                    case "11A":
                        elevenA = dis;
                        break;
                    case "11B":
                        elevenB = dis;
                        break;
                    case "12A":
                        twelveA = dis;
                        break;
                    case "12B":
                        twelveB = dis;
                        break;
                    case "13A":
                        thirtA = dis;
                        break;
                    case "13B":
                        thirtB = dis;
                        break;
                    case "14A":
                        fourtA = dis;
                        break;
                    case "14B":
                        fourtB = dis;
                        break;
                    case "L1":
                        lastOne = dis;
                        break;
                    case "L2":
                        lastTwo = dis;
                        break;
                    case "L3":
                        lastThree = dis;
                        break;
                    case "L4":
                        lastFour = dis;
                        break;
                    case "L5":
                        lastFive = dis;
                        break;

                }

            }
            request.setAttribute("oneA", oneA);
            request.setAttribute("oneB", oneB);
            request.setAttribute("twoA", twoA);
            request.setAttribute("twoB", twoB);
            request.setAttribute("threeA", threeA);
            request.setAttribute("threeB", threeB);
            request.setAttribute("fourA", fourA);
            request.setAttribute("fourB", fourB);
            request.setAttribute("fiveA", fiveA);
            request.setAttribute("fiveB", fiveB);
            request.setAttribute("sixA", sixA);
            request.setAttribute("sixB", sixB);
            request.setAttribute("sevenA", sevenA);
            request.setAttribute("sevenB", sevenB);
            request.setAttribute("eightA", eightA);
            request.setAttribute("eightB", eightB);
            request.setAttribute("nineA", nineA);
            request.setAttribute("nineB", nineB);
            request.setAttribute("tenA", tenA);
            request.setAttribute("tenB", tenB);
            request.setAttribute("elevenA", elevenA);
            request.setAttribute("elevenB", elevenB);
            request.setAttribute("twelveA", twelveA);
            request.setAttribute("twelveB", twelveB);
            request.setAttribute("thirtA", thirtA);
            request.setAttribute("thirtB", thirtB);
            request.setAttribute("fourtA", fourtA);
            request.setAttribute("fourtB", fourtB);
            request.setAttribute("lastOne", lastOne);
            request.setAttribute("lastTwo", lastTwo);
            request.setAttribute("lastThree", lastThree);
            request.setAttribute("lastFour", lastFour);
            request.setAttribute("lastFive", lastFive);

            RequestDispatcher rd = request.getRequestDispatcher("seat layout/book_seat.jsp");
            rd.forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
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
