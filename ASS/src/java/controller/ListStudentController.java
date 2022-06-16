/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller;

import dal.GroupDBContext;
import dal.StudentDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import model.Group;
import model.Student;

/**
 *
 * @author Trung Duc
 */
public class ListStudentController extends HttpServlet{

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
         int id = Integer.parseInt(request.getParameter("id"));
         StudentDBContext db = new StudentDBContext();
        ArrayList<Student> st = db.search(id);
        int count = 1;
        GroupDBContext gdb = new GroupDBContext();
        ArrayList<Group> gr = gdb.list();
        request.setAttribute("st", st );
        request.setAttribute("gr", gr);
        request.getRequestDispatcher("view/list.jsp").forward(request, response);
        }
   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        StudentDBContext db = new StudentDBContext();
//        ArrayList<Student> student = db.list();
//        request.setAttribute("student", student);
//        request.getRequestDispatcher("view/list.jsp").forward(request, response);
        processRequest(request, response);
    }
    
    
    
}
