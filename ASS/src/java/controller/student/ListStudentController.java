/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.student;

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
public class ListStudentController extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
         int id = Integer.parseInt(request.getParameter("id"));
        StudentDBContext dbs = new StudentDBContext();
//        ArrayList<Student> stu = dbs.search(id);
        
        String raw_code = request.getParameter("code");
        String code = (raw_code!=null && raw_code.length()>0)?raw_code:null;
        ArrayList<Student> st = dbs.getList(code, id);
        int count =1;
        GroupDBContext db = new GroupDBContext();
        ArrayList<Group> group = db.list();
        request.setAttribute("group", group);
        request.setAttribute("count", count);
        request.setAttribute("id", id);
        request.setAttribute("st", st);
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
    @Override
    public String getServletInfo() {
        return "Short description";
    }
}
