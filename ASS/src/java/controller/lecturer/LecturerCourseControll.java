/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.lecturer;

import dal.CourseDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import model.Course;

/**
 *
 * @author Trung Duc
 */
public class LecturerCourseControll extends HttpServlet{

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
//        int lid = Integer.parseInt(request.getParameter("lid"));
        CourseDBContext dbsub = new CourseDBContext();
        int lid =5;
        ArrayList<Course> leccourse = dbsub.searchlecturers(lid);
                
        request.setAttribute("lid", lid);     
        request.setAttribute("leccourse", leccourse);
        request.getRequestDispatcher("lecturer/leccourse.jsp").forward(request, response);
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
