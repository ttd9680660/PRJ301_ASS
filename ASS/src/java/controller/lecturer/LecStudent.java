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
public class LecStudent extends HttpServlet{

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String[] components = request.getParameterValues("component");        
        ArrayList<Exam> exams = new ArrayList<>();
        ExamDBContext dbexam = new ExamDBContext();
        for (String component : components) {
            int sid = Integer.parseInt(component.split("_")[0]);
            int aid = Integer.parseInt(component.split("_")[1]);
            int cid = Integer.parseInt(component.split("_")[2]);
            Exam e = new Exam();
            Student s = new Student();
            s.setSid(sid);
            Assessment a = new Assessment();
            a.setAid(aid);
            a.setCid(cid);
            e.setAssessment(a);
            e.setStu(s);
            String score = request.getParameter("score" + sid + "_" + aid);
            if (score.length() > 0) {
                {
                    e.setScore(Float.parseFloat(score));
                }
            } else {
                {
                    e.setScore(-1);
                }
            }
            String eid = request.getParameter("eid" + sid + "_" + aid);
            if (eid.length() > 0) {
                {
                    e.setEid(Integer.parseInt(eid));
                }
            } else {
                {
                    e.setEid(-1);
                }
            }
            exams.add(e);
        }
        dbexam.saveChanges(exams);
        
        response.sendRedirect("leccourse");
    }
    

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int lid = Integer.parseInt(request.getParameter("lid"));
        int cid = Integer.parseInt(request.getParameter("cid"));
        int gid = Integer.parseInt(request.getParameter("gid"));

        GroupDBContext dbgroup = new GroupDBContext();
        ArrayList<Group> grouplecturers = dbgroup.searchlecturers(lid, cid);

        AssessmentDBContext dbass = new AssessmentDBContext();
        ArrayList<Assessment> assessment = dbass.search(cid);

        StudentDBContext dbstu = new StudentDBContext();
        ArrayList<Student> student = dbstu.search(gid);

        ExamDBContext dbexam = new ExamDBContext();
        ArrayList<Exam> listmark = dbexam.listmark(cid);

        CourseDBContext dbsub = new CourseDBContext();      
        ArrayList<Course> leccourse = dbsub.searchlecturers(lid);
        
        request.setAttribute("leccourse", leccourse); 
        request.setAttribute("grouplecturers", grouplecturers);
        request.setAttribute("listmark", listmark);
        request.setAttribute("student", student);
        request.setAttribute("assessment", assessment);
        request.setAttribute("lid", lid);
        request.setAttribute("cid", cid);
        request.getRequestDispatcher("lecturer/updatetrans.jsp").forward(request, response);
    }
    
}
