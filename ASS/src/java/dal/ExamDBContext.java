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
import model.Assessment;
import model.Course;
import model.Exam;
import model.Student;

/**
 *
 * @author Trung Duc
 */
public class ExamDBContext extends DBContext<Exam>{
    
        public ArrayList<Exam> search(int sid, int cid) {
        ArrayList<Exam> exam = new ArrayList<>();
        try {
            String sql = "SELECT Exam.eid, Exam.score, Assessment.aname,Assessment.aid, Assessment.weight , Student.sid, Course.cid\n"
                    + "FROM   Assessment INNER JOIN\n"
                    + "             Exam ON Assessment.aid = Exam.aid INNER JOIN\n"
                    + "             Student ON Exam.sid = Student.sid INNER JOIN\n"
                    + "             Course ON Assessment.cid = Course.cid AND Exam.cid = Course.cid\n"
                    + "			 where Student.sid = ? and Course.cid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(2, cid);
            stm.setInt(1, sid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Exam e = new Exam();
                e.setEid(rs.getInt("eid"));
                e.setScore(rs.getFloat("score"));
                Assessment a = new Assessment();
                a.setAid(rs.getInt("aid"));
                a.setAname(rs.getString("aname"));
                a.setWeight(rs.getFloat("weight"));
                Student stu = new Student();
                stu.setSid(rs.getInt("sid"));
                Course cou = new Course();
                cou.setCid(rs.getInt("cid"));
                e.setAssessment(a);
                e.setStu(stu);
                e.setCou(cou);
                exam.add(e);
            }
        } catch (SQLException ex) {
            Logger.getLogger(ExamDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return exam;
    }

    public ArrayList<Exam> listmark(int cid) {
        ArrayList<Exam> exams = new ArrayList<>();
        try {
            String sql = "SELECT A.* FROM\n"
                    + "              (SELECT eid,sid,aid,score,cid,date FROM Exam) A\n"
                    + "               INNER JOIN\n"
                    + "            (SELECT sid,aid,MAX(date) as date FROM Exam\n"
                    + "                GROUP BY sid,aid) B\n"
                    + "             ON A.aid = B.aid AND A.sid = B.sid AND A.date = B.date\n"
                    + "			 where cid = ?";
            PreparedStatement stm = connection.prepareStatement(sql);
            stm.setInt(1, cid);
            ResultSet rs = stm.executeQuery();
            while (rs.next()) {
                Exam e = new Exam();
                e.setEid(rs.getInt("eid"));

                Assessment a = new Assessment();
                a.setAid(rs.getInt("aid"));
                a.setCid(rs.getInt("cid"));

                Student s = new Student();
                s.setSid(rs.getInt("sid"));

                e.setScore(rs.getFloat("score"));
                e.setDate(rs.getDate("date"));

                e.setAssessment(a);
                e.setStu(s);
                
                exams.add(e);

            }
        } catch (SQLException ex) {
            Logger.getLogger(StudentDBContext.class.getName()).log(Level.SEVERE, null, ex);
        }
        return exams;
    }

    public void saveChanges(ArrayList<Exam> exams) {
        try {
            connection.setAutoCommit(false);
            for (Exam exam : exams) {
                //INSERT
                if (exam.getEid() == -1 && exam.getScore() != -1) {
                    String sql_insert_exam = "INSERT INTO [Exam]\n"
                            + "           ([score]\n"
                            + "           ,[date]\n"
                            + "           ,[sid]\n"
                            + "           ,[cid]\n"
                            + "           ,[aid])\n"
                            + "     VALUES\n"
                            + "           (?\n"
                            + "           ,GETDATE()\n"
                            + "           ,?\n"
                            + "           ,?\n"
                            + "           ,?)";
                    PreparedStatement stm = connection.prepareStatement(sql_insert_exam);
                    stm.setInt(2, exam.getStu().getSid());
                    stm.setInt(4, exam.getAssessment().getAid());
                    stm.setFloat(1, exam.getScore());
                    stm.setFloat(3, exam.getAssessment().getCid());
                    stm.executeUpdate();
                } //UPDATE
                else if (exam.getEid() != -1 && exam.getScore() != -1) {
                    String sql_update_exam = "UPDATE Exam SET Score = ? WHERE eid = ?";
                    PreparedStatement stm = connection.prepareStatement(sql_update_exam);
                    stm.setInt(2, exam.getEid());
                    stm.setFloat(1, exam.getScore());
                    stm.executeUpdate();
                } //DELETE
                else if (exam.getEid() != -1 && exam.getScore() == -1) {
                    String sql_delete_exam = "DELETE Exam WHERE eid = ?";
                    PreparedStatement stm = connection.prepareStatement(sql_delete_exam);
                    stm.setInt(1, exam.getEid());
                    stm.executeUpdate();
                }
            }
            connection.commit();
        } catch (SQLException ex) {
            Logger.getLogger(StudentDBContext.class.getName()).log(Level.SEVERE, null, ex);
            try {
                connection.rollback();
            } catch (SQLException ex1) {
                Logger.getLogger(ExamDBContext.class.getName()).log(Level.SEVERE, null, ex1);
            }
        } finally {
            try {
                connection.setAutoCommit(true);
            } catch (SQLException ex) {
                Logger.getLogger(ExamDBContext.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    @Override
    public ArrayList<Exam> list() {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Exam get(int id) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void insert(Exam model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void update(Exam model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public void delete(Exam model) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }

    @Override
    public Exam getT(String a, String b) {
        throw new UnsupportedOperationException("Not supported yet."); // Generated from nbfs://nbhost/SystemFileSystem/Templates/Classes/Code/GeneratedMethodBody
    }
    public static void main(String[] args) {
        ExamDBContext db = new ExamDBContext();
        ArrayList<Exam> list = db.search(1, 1);

        System.out.println("" + list);
    } 
}

