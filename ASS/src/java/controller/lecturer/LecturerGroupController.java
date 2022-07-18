/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.lecturer;

import dal.CourseDBContext;
import dal.GroupDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import model.Course;
import model.Group;

/**
 *
 * @author Trung Duc
 */
public class LecturerGroupController extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
                
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int lid = Integer.parseInt(request.getParameter("lid"));
        int cid = Integer.parseInt(request.getParameter("cid"));       
        GroupDBContext dbgroup = new GroupDBContext();
        ArrayList<Group> grouplecturers = dbgroup.searchlecturers(lid, cid);
        
//        CourseDBContext db = new CourseDBContext();
//        ArrayList<Course> lecsub = db.searchlecturers(lid);
//        
//        request.setAttribute("lecsub", lecsub);
        request.setAttribute("grouplecturers", grouplecturers);
        request.setAttribute("lid", lid);
        request.setAttribute("cid", cid);
        request.getRequestDispatcher("lecturer/lecgroup.jsp").forward(request, response);
    }
    
}
