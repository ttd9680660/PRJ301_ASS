/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Group;
import model.Student;

/**
 *
 * @author Trung Duc
 */
public class StudentDBContext extends DBContext<Student> {

//        public ArrayList<Student> search(int sid) {
//        ArrayList<Student> st = new ArrayList<>();
//        try {
//            String sql = "SELECT *\n"
//                    + "FROM   [Group] INNER JOIN\n"
//                    + "             Group_Student ON [Group].gid = Group_Student.gid INNER JOIN\n"
//                    + "             Student ON Group_Student.sid = Student.sid\n"
//                    + "			 where [Group].gid = ?";
//            PreparedStatement stm = connection.prepareStatement(sql);
//            stm.setInt(1, sid);
//            ResultSet rs = stm.executeQuery();
//            while (rs.next()) {
//                Student s = new Student();
//                s.setSid(rs.getInt("sid"));
//                s.setScode(rs.getString("scode"));
//                s.setSname(rs.getString("sname"));
//                s.setGender(rs.getBoolean("gender"));
//                s.setDob(rs.getDate("dob"));
//                s.setAddress(rs.getString("address"));
//                s.setSphone(rs.getString("sphone"));
//                Group g = new Group();
//                g.setGid(rs.getInt("gid"));
//                g.setGname(rs.getString("gname"));
//                s.setGroup(g);
//                st.add(s);
//            }
//        } catch (SQLException ex) {
//            Logger.getLogger(StudentDBContext.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        return st;
//    }
//    
//   
//    public ArrayList<Student> list(String scode, int sid) {
//        ArrayList<Student> st = new ArrayList<>();
//        HashMap<Integer, Object> params = new HashMap<>();
//        try {
//            String sql = "SELECT *\n"
//                    + "FROM   [Group] INNER JOIN\n"
//                    + "             Group_Student ON [Group].gid = Group_Student.gid INNER JOIN\n"
//                    + "             Student ON Group_Student.sid = Student.sid\n"
//                    + "			 where [Group].gid = ? and (1=1)";
//            Integer index = 1;          
//            if(scode != null){
//                sql += " AND Student.code like '%'+?+'%'";
//                index++;
//                params.put(index, scode);
//            }
//            PreparedStatement stm = connection.prepareStatement(sql);
//            stm.setInt(1, sid);
//            for (Map.Entry<Integer, Object> entry : params.entrySet()) {
//                Integer key = entry.getKey();
//                Object val = entry.getValue();
//                stm.setObject(key, val);             
//            }          
//            ResultSet rs = stm.executeQuery();
//            while (rs.next()) {
//                Student s = new Student();
//                s.setSid(rs.getInt("sid"));
//                s.setScode(rs.getString("scode"));
//                s.setSname(rs.getString("sname"));
//                s.setGender(rs.getBoolean("gender"));
//                s.setDob(rs.getDate("dob"));
//                s.setAddress(rs.getString("address"));
//                s.setSphone(rs.getString("sphone"));
//                Group g = new Group();
//                g.setGid(rs.getInt("gid"));
//                g.setGname(rs.getString("gname"));
//                s.setGroup(g);
//                st.add(s);
//            }
//        } catch (SQLException ex) {
//            Logger.getLogger(StudentDBContext.class.getName()).log(Level.SEVERE, null, ex);
//        }
//        return st;
//    }
        
    @Override
    public Student get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void insert(Student model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Student model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Student model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Student getT(String a, String b) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

       public static void main(String[] args) {
        StudentDBContext s = new StudentDBContext();
        ArrayList<Student> acc = s.list();
        System.out.println(acc);
    }

    @Override
    public ArrayList<Student> list() {
        ArrayList<Student> student = new ArrayList<>();
        try {
            String sql = "select sid,scode,sname,gender,dob,address,sphone from Student";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Student s = new Student();
                s.setSid(rs.getInt("sid"));
                s.setScode(rs.getString("scode"));
                s.setSname(rs.getString("sname"));
                s.setGender(rs.getBoolean("gender"));
                s.setDob(rs.getDate("dob"));
                s.setAddress(rs.getString("address"));
                s.setSphone(rs.getString("sphone"));
                student.add(s);
            }

        } catch (SQLException ex) {
            Logger.getLogger(StudentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return student;
    }
       
}
