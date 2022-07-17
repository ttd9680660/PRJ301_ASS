/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.student;

import dal.AssessmentDBContext;
import dal.CourseDBContext;
import dal.ExamDBContext;
import dal.TranscriptDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import model.Assessment;
import model.Course;
import model.Exam;
import model.Transcript;

/**
 *
 * @author Trung Duc
 */
public class ViewTransController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int sid = Integer.parseInt(request.getParameter("sid"));
        int cid = Integer.parseInt(request.getParameter("cid"));
        TranscriptDBContext dbt = new TranscriptDBContext();
        Transcript transcript = dbt.getget(sid, cid);
        request.setAttribute("transcript", transcript);

        CourseDBContext dbc = new CourseDBContext();
        ArrayList<Course> course = dbc.search(sid);
        ExamDBContext dbexam = new ExamDBContext();
        ArrayList<Exam> search = dbexam.search(sid, cid);
        AssessmentDBContext dbass = new AssessmentDBContext();
        ArrayList<Assessment> search1 = dbass.search(cid);
        
        float sum = 0;
        for (Exam assessment : search) {
            sum = sum + assessment.getScore()*assessment.getAssessment().getWeight()/100;
        }
        
        request.setAttribute("course", course);
        request.setAttribute("sid", sid);
        request.setAttribute("search", search);
        request.setAttribute("search1", search1);
        request.setAttribute("sum", sum);
      

        request.getRequestDispatcher("student/transcript.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
