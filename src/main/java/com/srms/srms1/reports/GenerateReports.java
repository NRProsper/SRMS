package com.srms.srms1.reports;

import com.srms.srms1.course.Course;
import com.srms.srms1.lib.DBConfig;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


public class GenerateReports {

    public static final String GET_MARKS = "SELECT s.reg_no, CONCAT(s.fname, ' ', s.lname) AS student_name, c.category_id AS category_id, c.title AS course_title, cl.level AS class_level, cat.title AS category_title,c.max_points AS course_max, m.CAT, m.Exam, m.total FROM marks m JOIN student s ON m.student_id = s.reg_no JOIN course c ON m.course_id = c.id JOIN class cl ON m.class_id = cl.class_id JOIN category cat ON c.category_id = cat.id WHERE cl.class_id = ? ORDER BY s.reg_no ";

    public static final String GET_STUD_MARKS = "SELECT s.reg_no, CONCAT(s.fname, ' ', s.lname) AS student_name, c.category_id AS category_id, c.title AS course_title, cl.level AS class_level, cat.title AS category_title,c.max_points AS course_max, m.CAT, m.Exam, m.total FROM marks m JOIN student s ON m.student_id = s.reg_no JOIN course c ON m.course_id = c.id JOIN class cl ON m.class_id = cl.class_id JOIN category cat ON c.category_id = cat.id WHERE s.reg_no = ?";

    public List<Map<String, Object>> reportList(int classId) {
        List<Map<String, Object>> reportList = new ArrayList<>();

        try(Connection conn = DBConfig.getConnection(); PreparedStatement pstmt = conn.prepareStatement(GET_MARKS)) {
            pstmt.setInt(1, classId);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                int studentId = rs.getInt("reg_no");
                String studentName = rs.getString("student_name");
                String classLevel = rs.getString("class_level");
                String courseTitle = rs.getString("course_title");
                int courseMax = rs.getInt("course_max");
                int catMarks = rs.getInt("CAT");
                int examMarks = rs.getInt("Exam");
                int totalMarks = rs.getInt("total");

                Map<String, Object> reportMap = new HashMap<>();
                Map<String, Object> studentMap = new HashMap<>();
                Map<String, Object> marksMap = new HashMap<>();

                studentMap.put("studentId", studentId);
                studentMap.put("studentName", studentName);
                studentMap.put("classLevel", classLevel);

                marksMap.put("courseTitle", courseTitle);
                marksMap.put("courseMarks", courseMax);
                marksMap.put("catMarks", catMarks);
                marksMap.put("examMarks", examMarks);
                marksMap.put("totalMarks", totalMarks);

                reportMap.put("student", studentMap);

                List<Map<String, Object>> coursesList = new ArrayList<>();
//                Map<String, Object> courseMap = new HashMap<>();
//                courseMap.put(courseTitle, marksMap);
                coursesList.add(marksMap);

                reportMap.put("courses", coursesList);

                boolean studentExists = false;
                for (Map<String, Object> existingReport : reportList) {
                    Map<String, Object> existingStudent = (Map<String, Object>) existingReport.get("student");
                    if (studentId == (int) existingStudent.get("studentId")) {
                        studentExists = true;
                        // Add the new course marks to the existing student
                        List<Map<String, Object>> existingCourses = (List<Map<String, Object>>) existingReport.get("courses");
                        existingCourses.add(marksMap);
                        break;
                    }
                }

                if (!studentExists) {
                    reportList.add(reportMap);
                }
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return  reportList;

    }

    public List<Map<String, Object>> reportById(int id) {
        List<Map<String, Object>> reportList = new ArrayList<>();

        try(Connection conn = DBConfig.getConnection(); PreparedStatement pstmt = conn.prepareStatement(GET_STUD_MARKS)) {
            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                int studentId = rs.getInt("reg_no");
                String studentName = rs.getString("student_name");
                String classLevel = rs.getString("class_level");
                String courseTitle = rs.getString("course_title");
                int courseMax = rs.getInt("course_max");
                int catMarks = rs.getInt("CAT");
                int examMarks = rs.getInt("Exam");
                int totalMarks = rs.getInt("total");

                Map<String, Object> reportMap = new HashMap<>();
                Map<String, Object> studentMap = new HashMap<>();
                Map<String, Object> marksMap = new HashMap<>();

                studentMap.put("studentId", studentId);
                studentMap.put("studentName", studentName);
                studentMap.put("classLevel", classLevel);

                marksMap.put("courseTitle", courseTitle);
                marksMap.put("courseMarks", courseMax);
                marksMap.put("catMarks", catMarks);
                marksMap.put("examMarks", examMarks);
                marksMap.put("totalMarks", totalMarks);

                reportMap.put("student", studentMap);

                List<Map<String, Object>> coursesList = new ArrayList<>();
//                Map<String, Object> courseMap = new HashMap<>();
//                courseMap.put(courseTitle, marksMap);
                coursesList.add(marksMap);

                reportMap.put("courses", coursesList);

                boolean studentExists = false;
                for (Map<String, Object> existingReport : reportList) {
                    Map<String, Object> existingStudent = (Map<String, Object>) existingReport.get("student");
                    if (studentId == (int) existingStudent.get("studentId")) {
                        studentExists = true;
                        // Add the new course marks to the existing student
                        List<Map<String, Object>> existingCourses = (List<Map<String, Object>>) existingReport.get("courses");
                        existingCourses.add(marksMap);
                        break;
                    }
                }

                if (!studentExists) {
                    reportList.add(reportMap);
                }
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return  reportList;

    }





}
