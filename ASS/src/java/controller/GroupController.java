/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

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
public class GroupController extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int cid = Integer.parseInt(request.getParameter("id"));
        
        CourseDBContext dbco = new CourseDBContext();
        ArrayList<Course> course = dbco.list();
        request.setAttribute("course", course);
        
        GroupDBContext dbgroup = new GroupDBContext();
        ArrayList<Group> group = dbgroup.search(cid);

        request.setAttribute("group", group);
        request.getRequestDispatcher("student/group.jsp").forward(request, response);
    }
    
}
