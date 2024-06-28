package com.srms.srms1.student;

import com.srms.srms1.lib.DBConfig;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class StudentDAOImpl implements StudentDAO{

    public static final String selectAllStudents = "";
    public static final String selectStudentsByClass = "SELECT student.*, class.level " +
            "FROM student " +
            "JOIN class ON student.class_id = class.class_id " +
            "WHERE student.class_id = ?";
    public static final String countStudents = "SELECT COUNT(*) AS student_count FROM student";


    @Override
    public void insertStudent(Student student) {
        StringBuilder insertStudent = new StringBuilder("INSERT INTO student (fname, lname, bdate, sex, nationality, province, district, sector, cell, village, class_id, study_mode");
        if(student.getEmail() != null) {
            insertStudent.append(",email");
        }if(student.getReligion() != null) {
            insertStudent.append(", religion");
        }
        insertStudent.append(") VALUES (?,?,?,?,?,?,?,?,?,?,?,?");
        if(student.getEmail() != null) {
            insertStudent.append(",?");
        }if(student.getReligion() != null) {
            insertStudent.append(", ?");
        }
        insertStudent.append(")");
        System.out.println(insertStudent.toString());


        try(Connection conn = DBConfig.getConnection(); PreparedStatement pstmt = conn.prepareStatement(insertStudent.toString())){
            pstmt.setString(1, student.getFname());
            pstmt.setString(2, student.getLname());
            pstmt.setString(3, student.getBdate());
            pstmt.setString(4, student.getSex());
            pstmt.setString(5, student.getNationality());
            pstmt.setString(6, student.getProvince());
            pstmt.setString(7, student.getDistrict());
            pstmt.setString(8, student.getSector());
            pstmt.setString(9, student.getCell());
            pstmt.setString(10, student.getVillage());
            pstmt.setInt(11, student.getClass_id());
            pstmt.setString(12, student.getStudy_mode());

            if(student.getEmail() != null) {
                pstmt.setString(13, student.getEmail());
            }if(student.getReligion() != null) {
                pstmt.setString(14, student.getReligion());
            }

            pstmt.executeUpdate();


        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void selectAllStudents() {

    }

    @Override
    public List<Student> selectStudentsByClass(int id) {
        List<Student> students = new ArrayList<>();
        try(Connection conn = DBConfig.getConnection(); PreparedStatement pstmt = conn.prepareStatement(selectStudentsByClass)) {
            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                int regNo = rs.getInt("reg_no");
                String fname = rs.getString("fname");
                String lname = rs.getString("lname");
                String mode = rs.getString("study_mode");
                String class_name = rs.getString("level");
                String gender = rs.getString("sex");

                students.add(new Student.Builder(regNo, fname, lname, mode, class_name, gender).build());

            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return students;
    }

    @Override
    public int countStudents() {
        int countStud = 0;
        try(Connection conn = DBConfig.getConnection(); PreparedStatement pstmt = conn.prepareStatement(countStudents)) {
            ResultSet rs = pstmt.executeQuery();
            while(rs.next()) {
                countStud = rs.getInt("student_count");
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return countStud;
    }
}
