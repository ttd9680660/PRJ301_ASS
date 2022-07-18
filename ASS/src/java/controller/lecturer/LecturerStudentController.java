/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package controller.lecturer;

import dal.AssessmentDBContext;
import dal.CourseDBContext;
import dal.ExamDBContext;
import dal.GroupDBContext;
import dal.StudentDBContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import model.Assessment;
import model.Course;
import model.Exam;
import model.Group;
import model.Student;

/**
 *
 * @author Trung Duc
 */
public class LecturerStudentController extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int lid = Integer.parseInt(request.getParameter("lid"));
        int cid = Integer.parseInt(request.getParameter("cid"));
        int gid = Integer.parseInt(request.getParameter("gid"));
        
        GroupDBContext dbgro = new GroupDBContext();
        ArrayList<Group> groLecCour = dbgro.searchlecturers(lid, gid);
        
        AssessmentDBContext dbass = new AssessmentDBContext();
        ArrayList<Assessment> assessment = dbass.search(cid);
        
        StudentDBContext dbstu = new StudentDBContext();
        ArrayList<Student> student = dbstu.search(gid);
        
        ExamDBContext dbexam = new ExamDBContext();
        ArrayList<Exam> listMark = dbexam.listmark(cid);
        
        CourseDBContext db = new CourseDBContext();
        ArrayList<Course> lecsub = db.searchlecturers(lid);
        
        request.setAttribute("lecsub", lecsub);
        request.setAttribute("lid", lid);
        request.setAttribute("subid", cid);
        request.setAttribute("listMark", listMark);
        request.setAttribute("groLecCour", groLecCour);
        request.setAttribute("assessment", assessment);
        request.setAttribute("student", student);
        request.getRequestDispatcher("lecturer/updatetrans.jsp").forward(request, response);
    }
    
}
