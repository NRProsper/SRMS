package com.srms.srms1.classes;

import com.srms.srms1.lib.DBConfig;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ClassCourseDAOImpl implements ClassCourseDAO{

    public static final String insertClassCourse = "INSERT INTO classcourse (class_id, course_id, staff_id) values (?, ?, ?)";
//    public static final String selectClassCourses = "SELECT  CONCAT(s.f_name, ' ', s.l_name) AS staff_name, c.level AS class_level, c2.title AS course_title,c3.title AS category_title, c2.max_points AS course_marks FROM classcourse INNER JOIN staff s on classcourse.staff_id = s.staff_id INNER JOIN class c on classcourse.class_id = c.class_id INNER JOIN course c2 on classcourse.course_id = c2.id INNER JOIN category c3 on c2.category_id = c3.id;";

    public static final String selectClassCourses =
            "SELECT " +
                    "    cc.class_id, " +
                    "    cc.course_id, " +
                    "    s.staff_id, " +
                    "    CONCAT(s.f_name, ' ', s.l_name) AS staff_name, " +
                    "    c.level AS class_level, " +
                    "    c2.title AS course_title, " +
                    "    c2.max_points AS course_marks, " +
                    "    c2.id AS course_id, " +
                    "    c3.id AS category_id, " +
                    "    c3.title AS category_title " +
                    "FROM classcourse cc " +
                    "INNER JOIN staff s ON cc.staff_id = s.staff_id " +
                    "INNER JOIN class c ON cc.class_id = c.class_id " +
                    "INNER JOIN course c2 ON cc.course_id = c2.id " +
                    "INNER JOIN category c3 ON c2.category_id = c3.id";
    public static final String selectClassCoursesById = "SELECT cc.class_id, cc.course_id, s.staff_id, CONCAT(s.f_name, '  ', s.l_name) AS staff_name, c.level AS class_level, c2.title AS course_title,c2.max_points AS course_marks,c2.id AS course_id,c3.id AS category_id,c3.title AS category_title FROM classcourse cc INNER JOIN staff s ON cc.staff_id = s.staff_id INNER JOIN class c ON cc.class_id = c.class_id INNER JOIN course c2 ON cc.course_id = c2.id INNER JOIN category c3 ON c2.category_id = c3.id WHERE c.class_id = ?";

    @Override
    public void insertClassCourse(ClassCourse classCourse) {
        try(Connection conn = DBConfig.getConnection(); PreparedStatement pstmt = conn.prepareStatement(insertClassCourse)) {
            pstmt.setInt(1, classCourse.getClassId());
            pstmt.setInt(2, classCourse.getCourseId());
            pstmt.setInt(3, classCourse.getStaffId());

            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public List<ClassCourse> selectClassCourses() {
        List<ClassCourse> classCourses = new ArrayList<>();
        try(Connection conn = DBConfig.getConnection(); PreparedStatement pstmt = conn.prepareStatement(selectClassCourses)) {
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                int class_id = rs.getInt("class_id");
                int staff_id = rs.getInt("staff_id");
                String staff_name = rs.getString("staff_name");
                String class_level = rs.getString("class_level");
                int course_id = rs.getInt("course_id");
                String course_title = rs.getString("course_title");
                int category_id = rs.getInt("category_id");
                String category_title = rs.getString("category_title");
                int course_marks = rs.getInt("course_marks");

                classCourses.add(new ClassCourse(class_id, course_id, staff_id, staff_name, class_level ,course_title, course_marks, category_id, category_title));

            }


        } catch (SQLException e) {
            throw new RuntimeException(e);
        }


        return classCourses;
    }

    @Override
    public List<ClassCourse> selectClassCourseById(int id) {
        List<ClassCourse> classCourses = new ArrayList<>();
        try(Connection conn = DBConfig.getConnection(); PreparedStatement pstmt = conn.prepareStatement(selectClassCoursesById)) {
            pstmt.setInt(1, id);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                int class_id = rs.getInt("class_id");
                int staff_id = rs.getInt("staff_id");
                String staff_name = rs.getString("staff_name");
                String class_level = rs.getString("class_level");
                int course_id = rs.getInt("course_id");
                String course_title = rs.getString("course_title");
                int category_id = rs.getInt("category_id");
                String category_title = rs.getString("category_title");
                int course_marks = rs.getInt("course_marks");

                classCourses.add(new ClassCourse(class_id, course_id, staff_id, staff_name, class_level ,course_title, course_marks, category_id, category_title));
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return  classCourses;
    }
}
