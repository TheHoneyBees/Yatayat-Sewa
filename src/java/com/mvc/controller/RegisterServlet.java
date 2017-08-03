package com.mvc.controller;

import java.io.*;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import com.mvc.bean.RegisterBean;
import com.mvc.dao.RegisterDao;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        doPost(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         String username = request.getParameter("username");
        String email = request.getParameter("email");
        String phone = request.getParameter("mobile");
        String password = request.getParameter("password");
        RegisterBean registerBean = new RegisterBean();
        //Using Java Beans - An easiest way to play with group of related data
        registerBean.setUsername(username);
        registerBean.setEmail(email);
        registerBean.setPhone(phone);
        registerBean.setPassword(password);
        RegisterDao registerDao = new RegisterDao();
        String result = registerDao.registerUser(registerBean);
        if (result.equals("SUCCESS")) //On success, you can display a message to user on Home page
        {   HttpSession session=request.getSession();
        session.setAttribute("username", email);
         response.sendRedirect("index.jsp");
        } else {
            response.sendRedirect("index.jsp");
        }
    }

}
