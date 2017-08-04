/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mvc.controller;

import com.mvc.bean.SearchBus;
import com.mvc.dao.SearchDao;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author boude
 */
@WebServlet(name = "SearchServlet", urlPatterns = {"/SearchServlet"})
public class SearchServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String destination, departure;
        String username = (String)session.getAttribute("username");
        //String username=request.getParameter("username");
        response.setContentType("text/html;charset=UTF-8");
        SearchBus searchbean = new SearchBus();
        List<SearchBus> buslist = new ArrayList<>();
        departure = request.getParameter("From_address");
        destination = request.getParameter("To_address");
        searchbean.setFrom_address(departure);
        searchbean.setTo_address(destination);
        searchbean.setDate(request.getParameter("date"));
        searchbean.setRouteid(0);
        searchbean.setScheduleid(0);
        System.out.println(request.getParameter("date") + "-----" + request.getParameter("mark"));
        searchbean.setTravel_type(request.getParameter("mark"));
        SearchDao sd = new SearchDao();
        buslist = sd.SearchVehicle(searchbean);
        session.setAttribute("buslist", buslist);
        session.setAttribute("departure", departure);
        session.setAttribute("destination", destination);
        session.setAttribute("username", username);
//        session.setAttribute("date", request.getParameter("date"));
//        session.setAttribute("traveltype", request.getParameter("mark"));
        RequestDispatcher rd = request.getRequestDispatcher("commentpop.jsp");
        rd.forward(request, response);
//        HttpSession session = request.getSession();
//        session.setAttribute("buslist", buslist);
//        request.getRequestDispatcher("search_result1.jsp").forward(request, response);
        //try (PrintWriter out = response.getWriter()) {
//            /* TODO output your page here. You may use following sample code. */
//            out.println("<!DOCTYPE html>");
//            out.println("<html>");
//            out.println("<head>");
//            out.println("<title>Servlet SearchServlet</title>");            
//            out.println("</head>");
//            out.println("<body>");
//            out.println("<h1>Servlet SearchServlet at " + request.getContextPath() + "</h1>");
//            out.println("</body>");
//            out.println("</html>");
        //}
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
