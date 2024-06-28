package com.srms.srms1.marks;

import com.srms.srms1.lib.DBConfig;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MarksDAOImpl implements MarksDAO{

    public static final String insertMarks = "INSERT INTO marks (student_id, class_id, course_id, CAT, Exam) VALUES (?, ?, ?, ?, ?)";



    @Override
    public void insertMarks(List<Marks> marksList) {
        try(Connection conn = DBConfig.getConnection(); PreparedStatement pstmt = conn.prepareStatement(insertMarks)) {
           for(Marks marks : marksList) {
               pstmt.setInt(1, marks.getStudentId());
               pstmt.setInt(2, marks.getClassId());
               pstmt.setInt(3, marks.getCourseId());
               pstmt.setInt(4, marks.getCatMarks());
               pstmt.setInt(5, marks.getExamMarks());
               pstmt.addBatch();
           }

            pstmt.executeBatch();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

}
