<%-- 
    Document   : newjsp
    Created on : Jul 18, 2017, 6:48:11 PM
    Author     : boude
--%>

<%@page import="java.io.IOException"%>
<%@page import="com.mvc.dao.insertReview"%>
<%@page import="opennlp.tools.doccat.DocumentCategorizer"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="opennlp.tools.doccat.DocumentCategorizerME"%>
<%@page import="java.io.BufferedOutputStream"%>
<%@page import="opennlp.tools.doccat.DoccatModel"%>
<%@page import="opennlp.tools.doccat.DoccatFactory"%>
<%@page import="opennlp.tools.util.TrainingParameters"%>
<%@page import="opennlp.tools.doccat.DocumentSampleStream"%>
<%@page import="opennlp.tools.util.MarkableFileInputStreamFactory"%>
<%@page import="opennlp.tools.util.PlainTextByLineStream"%>
<%@page import="opennlp.tools.util.ObjectStream"%>
<%@page import="opennlp.tools.util.InputStreamFactory"%>
<%@page import="java.io.File"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String commentstatus;
            String comment = request.getParameter("comment");
            String email = request.getParameter("email");
            System.out.println(comment + email);
            try {
                // read the training data
 //            InputStreamFactory dataIn = new MarkableFileInputStreamFactory(new File("train" + File.separator + "comment.txt"));
                InputStreamFactory dataIn = new MarkableFileInputStreamFactory(new File("C:\\Users\\boude\\Documents\\NetBeansProjects\\Yatayat Sewa\\train\\comment.txt"));
                ObjectStream lineStream = new PlainTextByLineStream(dataIn, "UTF-8");
                ObjectStream sampleStream = new DocumentSampleStream(lineStream);
                // define the training parameters
                TrainingParameters params = new TrainingParameters();
                params.put(TrainingParameters.ITERATIONS_PARAM, 10 + "");
                params.put(TrainingParameters.CUTOFF_PARAM, 0 + "");
                params.put(TrainingParameters.ALGORITHM_PARAM, "MAXENT");
                // create a model from traning data
                DoccatModel model = DocumentCategorizerME.train("en", sampleStream, params, new DoccatFactory());
                // save the model to local
                BufferedOutputStream modelOut = new BufferedOutputStream(new FileOutputStream("C:\\Users\\boude\\Documents\\NetBeansProjects\\Yatayat Sewa\\model\\modelfile.bin"));
                model.serialize(modelOut);
                // test the model file by subjecting it to prediction
                DocumentCategorizer doccat = new DocumentCategorizerME(model);
                String[] docWords = comment.replaceAll("[^A-Za-z]", " ").split(" ");
                double[] aProbs = doccat.categorize(docWords);
                if (doccat.getBestCategory(aProbs).equalsIgnoreCase("1")) {
                    System.out.println("The comment is positive :) ");
                    commentstatus = "1";

                } else {
                    System.out.println("The comment is negative :( ");
                    commentstatus = "0";
                }
                new insertReview("1", "ba_1_kha_1111", comment, commentstatus);
            } catch (IOException e) {
                e.printStackTrace();
            }
        %>
    </body>
</html>
