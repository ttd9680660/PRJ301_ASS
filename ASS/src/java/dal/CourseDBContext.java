/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Course;
import model.Lecturer;
import model.Student;

/**
 *
 * @author Trung Duc
 */
public class CourseDBContext extends DBContext<Course> {

    @Override
    public ArrayList<Course> list() {
        ArrayList<Course> co = new ArrayList<>();
        try {
            String sql = "SELECT [cid]\n"
                    + "      ,[cname]\n"
                    + "  FROM [Course]";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Course c = new Course();
                c.setCid(rs.getInt("cid"));
                c.setCname(rs.getString("cname"));
                co.add(c);
            }
        } catch (SQLException ex) {
            Logger.getLogger(CourseDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return co;
    }

    public ArrayList<Course> search(int sid) {
        ArrayList<Course> cou = new ArrayList<>();
        try {
            String sql = "SELECT *\n"
                    + "FROM   Student INNER JOIN\n"
                    + "             Student_Course ON Student.sid = Student_Course.sid INNER JOIN\n"
                    + "             Course ON Student_Course.cid = Course.cid\n"
                    + "			 where Student.sid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, sid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Course c = new Course();
                c.setCid(rs.getInt("cid"));
                c.setCname(rs.getString("cname"));
                Student s = new Student();
                s.setSid(rs.getInt("sid"));
                s.setSimg(rs.getString("simg"));
                s.setScode(rs.getString("scode"));
                s.setSname(rs.getString("sname"));
                s.setGender(rs.getBoolean("gender"));
                s.setDob(rs.getDate("dob"));
                s.setAddress(rs.getString("address"));
                s.setSphone(rs.getString("sphone"));
                c.setS(s);
                cou.add(c);
            }
        } catch (SQLException ex) {
            Logger.getLogger(StudentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return cou;
    }

    public ArrayList<Course> searchlecturers(int lid) {
        ArrayList<Course> cou = new ArrayList<>();
        try {
            String sql = "SELECT Course.cid, Course.cname, Lecturer.lid, Lecturer.lname \n"
                    + "FROM   Lecturer INNER JOIN\n"
                    + "             Lecturer_Course ON Lecturer.lid = Lecturer_Course.lid INNER JOIN\n"
                    + "             Course ON Lecturer_Course.cid = Course.cid\n"
                    + "			 where Lecturer.lid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, lid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Course c = new Course();
                c.setCid(rs.getInt("cid"));
                c.setCname(rs.getString("cname"));
                
                Lecturer lec = new Lecturer();
                lec.setLid(rs.getInt("lid"));
                lec.setLname(rs.getString("lname"));
                c.setLec(lec);
                cou.add(c);
            }
        } catch (SQLException ex) {
            Logger.getLogger(StudentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return cou;
    }
    
    @Override
    public Course get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void insert(Course model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Course model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Course model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Course getT(String a, String b) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    public static void main(String[] args) {
        CourseDBContext db = new CourseDBContext();
        ArrayList<Course> search = db.search(4);
        System.out.println("" + search);
        ArrayList<Course> list = db.list();
        System.out.println("" + list);
    }
}
