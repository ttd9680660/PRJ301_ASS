/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.ArrayList;

/**
 *
 * @author Trung Duc
 */
public class Group {
    private int gid;
    private String gname;
    private Course co;
    private Lecturer lec;

    public Lecturer getLec() {
        return lec;
    }

    public void setLec(Lecturer lec) {
        this.lec = lec;
    }
    

    public Course getCo() {
        return co;
    }

    public void setCo(Course co) {
        this.co = co;
    }
    
    ArrayList<Student> st = new ArrayList();

    public int getGid() {
        return gid;
    }

    public void setGid(int gid) {
        this.gid = gid;
    }

    public String getGname() {
        return gname;
    }

    public void setGname(String gname) {
        this.gname = gname;
    }

    public ArrayList<Student> getSt() {
        return st;
    }

    public void setSt(ArrayList<Student> st) {
        this.st = st;
    }
    
    
}
