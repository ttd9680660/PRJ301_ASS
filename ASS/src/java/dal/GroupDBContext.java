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
import model.Group;
import model.Lecturer;
import model.Student;

/**
 *
 * @author Trung Duc
 */
public class GroupDBContext extends DBContext<Group>{
  
    @Override
    public ArrayList<Group> list() {
        ArrayList<Group> group = new ArrayList<>();
        try {
            String sql = "SELECT *"
                    + "  FROM [Group]";
            PreparedStatement stm = connection.prepareStatement(sql);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Group g = new Group();
                g.setGid(rs.getInt("gid"));
                g.setGname(rs.getString("gname"));
                group.add(g);
            }
        } catch (SQLException ex) {
            Logger.getLogger(GroupDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return group;
    }
    
    public ArrayList<Group> search(int cid) {
        ArrayList<Group> group = new ArrayList<>();
        try {
            String sql = "SELECT *\n"
                    + "FROM   [Group] INNER JOIN\n"
                    + "             Group_Course ON [Group].gid = Group_Course.gid INNER JOIN\n"
                    + "             Course ON Group_Course.cid = Course.cid\n"
                    + "			 where Course.cid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, cid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Group g = new Group();
                g.setGid(rs.getInt("gid"));
                g.setGname(rs.getString("gname"));              
                Course c = new Course();
                c.setCid(rs.getInt("cid"));
                c.setCname(rs.getString("cname"));
                g.setCo(c);
                group.add(g);
            }
        } catch (SQLException ex) {
            Logger.getLogger(StudentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return group;
    }
    
    public ArrayList<Group> searchlecturers(int lid, int cid) {
        ArrayList<Group> group = new ArrayList<>();
        try {
            String sql = "SELECT [Group].gid,[Group].gname, Lecturer.lid, Course.cid, Course.cname\n" +
"                                     FROM   [Group] INNER JOIN\n" +
"                                                   [Lecturer_Group] ON [Group].gid = [Lecturer_Group].gid INNER JOIN\n" +
"                                                    Lecturer ON [Lecturer_Group].lid = Lecturer.lid INNER JOIN\n" +
"                                                   Lecturer_Course ON Lecturer.lid = Lecturer_Course.lid INNER JOIN\n" +
"                                                   Course ON Lecturer_Course.cid = Course.cid INNER JOIN\n" +
"                                               Group_Course ON [Group].gid = Group_Course.gid AND Course.cid = Group_Course.cid\n" +
"                                       		  where Lecturer.lid = ? and Course.cid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, lid);
            stm.setInt(2, cid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Group g = new Group();
                g.setGid(rs.getInt("gid"));
                g.setGname(rs.getString("gname"));
                Course c = new Course();
                c.setCid(rs.getInt("cid"));
                c.setCname(rs.getString("cname"));
                Lecturer l = new Lecturer();
                l.setLid(rs.getInt("lid"));
                g.setLec(l);
                g.setCo(c);
                group.add(g);
            }
        } catch (SQLException ex) {
            Logger.getLogger(StudentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return group;
    }

    @Override
    public Group get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void insert(Group model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Group model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Group model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Group getT(String a, String b) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    
       public static void main(String[] args) {
        GroupDBContext g = new GroupDBContext();
        ArrayList<Group> acc = g.list();
        System.out.println(acc);
    }
}
