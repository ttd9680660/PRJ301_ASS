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
import model.Student;
import model.Transcript;

/**
 *
 * @author Trung Duc
 */
public class TranscriptDBContext extends DBContext<Transcript> {

    public Transcript getget(int sid, int cid) {
        try {
            String sql = "Select s.sid,s.sname,c.cid, c.cname, t.tid, t.as1,t.as2, t.pt1, t.pt2, t.pt3,t.pe,t.fe\n"
                    + "From Student s inner join Transcript t on s.sid=t.sid inner join\n"
                    + "Course c on t.cid = c.cid\n"
                    + "where s.sid=? and c.cid=? ";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, sid);
            stm.setInt(2, cid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Transcript t = new Transcript();
                t.setTid(rs.getInt("tid"));
                t.setAs1(rs.getFloat("as1"));
                t.setAs2(rs.getFloat("as2"));
                t.setPt1(rs.getFloat("pt1"));
                t.setPt2(rs.getFloat("pt2"));
                t.setPt3(rs.getFloat("pt3"));
                t.setPe(rs.getFloat("pe"));
                t.setFe(rs.getFloat("fe"));
                Student s = new Student();
                s.setSid(rs.getInt("sid"));
                s.setSname(rs.getString("sname"));
                Course c = new Course();
                c.setCid(rs.getInt("cid"));
                c.setCname(rs.getString("cname"));
                t.setS(s);
                t.setC(c);
                return t;
            }
        } catch (SQLException ex) {
            Logger.getLogger(TranscriptDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;

    }

    @Override
    public ArrayList<Transcript> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Transcript get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void insert(Transcript model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Transcript model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Transcript model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Transcript getT(String a, String b) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    public static void main(String[] args) {
        TranscriptDBContext db = new TranscriptDBContext();
        Transcript get = db.getget(2, 1);
        System.out.println("" + get);    
    }
}
