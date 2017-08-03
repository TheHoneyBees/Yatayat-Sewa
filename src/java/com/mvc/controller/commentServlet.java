/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mvc.controller;

import com.mvc.dao.insertReview;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import opennlp.tools.util.InputStreamFactory;
import opennlp.tools.util.ObjectStream;
import opennlp.tools.util.PlainTextByLineStream;
import opennlp.tools.util.MarkableFileInputStreamFactory;
import opennlp.tools.doccat.DocumentSampleStream;
import opennlp.tools.doccat.DoccatFactory;
import opennlp.tools.util.TrainingParameters;
import opennlp.tools.doccat.DocumentCategorizerME;
import opennlp.tools.doccat.DoccatModel;
import java.io.BufferedOutputStream;
import java.io.File;
import opennlp.tools.doccat.DocumentCategorizer;
import java.io.FileOutputStream;

/**
 *
 * @author boude
 */
@WebServlet(name = "commentServlet", urlPatterns = {"/commentServlet"})
public class commentServlet extends HttpServlet {

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
            String commentstatus;
            String email = request.getParameter("useremail");
            String username = request.getParameter("username");
            String busid = request.getParameter("busid");
            String comment = request.getParameter("comment");

            System.out.println(username
                    + comment + busid + email + "here you go!");
            InputStreamFactory dataIn = new MarkableFileInputStreamFactory(new File("C:\\Users\\boude\\Documents\\NetBeansProjects\\Yatayat Sewa\\train\\comment.txt"));
            ObjectStream lineStream = new PlainTextByLineStream(dataIn, "UTF-8");
            ObjectStream sampleStream = new DocumentSampleStream(lineStream);
            // define the training parameters
            TrainingParameters params = new TrainingParameters();

            params.put(TrainingParameters.ITERATIONS_PARAM,
                    10 + "");
            params.put(TrainingParameters.CUTOFF_PARAM,
                    0 + "");
            params.put(TrainingParameters.ALGORITHM_PARAM,
                    "MAXENT");
            // create a model from traning data
            DoccatModel model = DocumentCategorizerME.train("en", sampleStream, params, new DoccatFactory());
            // save the model to local
            BufferedOutputStream modelOut = new BufferedOutputStream(new FileOutputStream("C:\\Users\\boude\\Documents\\NetBeansProjects\\Yatayat Sewa\\model\\modelfile.bin"));

            model.serialize(modelOut);
            // test the model file by subjecting it to prediction
            DocumentCategorizer doccat = new DocumentCategorizerME(model);
            String[] docWords = comment.replaceAll("[^A-Za-z]", " ").split(" ");
            double[] aProbs = doccat.categorize(docWords);

            if (doccat.getBestCategory(aProbs)
                    .equalsIgnoreCase("1")) {
                System.out.println("The comment is positive :) ");
                commentstatus = "1";

            } else {
                System.out.println("The comment is negative :( ");
                commentstatus = "0";
            }
            insertReview r = new insertReview(email,username, busid, comment, commentstatus);
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
