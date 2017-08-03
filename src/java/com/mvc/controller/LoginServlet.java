/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mvc.controller;

import com.mvc.bean.LoginBean;
import com.mvc.dao.LoginDao;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

/**
 *
 * @author boude
 */
@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

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
            HttpSession session = request.getSession();
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            LoginBean loginBean = new LoginBean(); //creating object for LoginBean class, which is a normal java class, contains just setters and getters. Bean classes are efficiently used in java to access user information wherever required in the application.
            loginBean.setEmail(email); //setting the username and password through the loginBean object then only you can get it in future.
            loginBean.setPassword(password);
            LoginDao loginDao = new LoginDao(); //creating object for LoginDao. This class contains main logic of the application.
            LoginBean userValidate = loginDao.authenticateUser(email, password); //Calling authenticateUser function
            if (userValidate != null) //If function returns success string then user will be rooted to Home page
            {
                System.out.println("Login Servlet\n"
                        + userValidate.getUserName()
                        + "\n" + userValidate.getEmail() + "\n"
                        + userValidate.getPhone() + "\n"
                        + userValidate.getAddress());
                session.setAttribute("username", userValidate.getUserName());
                session.setAttribute("email", userValidate.getEmail());
                session.setAttribute("phone", userValidate.getPhone());
                session.setAttribute("address", userValidate.getAddress());
               // out.print("Welcome\t" + userValidate.getUserName() + "!");
                out.print(userValidate.getUserName());
                out.flush();
                out.close();
            } else {
                session.setAttribute("username", null);
                out.write("FAILED");
            }
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
