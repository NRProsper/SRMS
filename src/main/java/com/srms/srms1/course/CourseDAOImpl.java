package com.srms.srms1.course;

import com.srms.srms1.lib.DBConfig;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CourseDAOImpl implements CourseDAO{

    public static final String insertCourse = "INSERT INTO `course`(`code`, `title`, `category_id`, `credits`, `max_points`) VALUES (? ,?, ?,  ?, ?)";
    public static final String getAllCourses = "SELECT course.*, category.title AS category_title " +
            "FROM course " +
            "JOIN category ON course.category_id = category.id";

    public static final String countCourses = "";

    public static final String getCourseById = "SELECT * FROM course WHERE id = ?";
    public static final String deleteById = "DELETE FROM `course` WHERE `id` = ?";
    public static final String updateById = "UPDATE `course` SET `title`=?,`code`= ?,`category_id`= ?,`credits`= ?,`max_points`= ? WHERE `id`=?";

    public static final String insertIntoClass = "INSERT INTO classcourse (class_id, course_id, staff_id) VALUE (?, ?, ?)";

    @Override
    public void insertCourse(Course course) {
        try(Connection conn = DBConfig.getConnection(); PreparedStatement pstmt = conn.prepareStatement(insertCourse)) {
            pstmt.setString(1, course.getCode());
            pstmt.setString(2, course.getTitle());
            pstmt.setInt(3, course.getCategory_id());
            pstmt.setInt(4, course.getCredits());
            pstmt.setInt(5, course.getMax_points());

            pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException(e);
        }
    }

    @Override
    public List<Course> selectAllCourse() {
        List<Course> courses = new ArrayList<>();

        try (Connection conn = DBConfig.getConnection(); PreparedStatement pstmt = conn.prepareStatement(getAllCourses)) {
            ResultSet rs = pstmt.executeQuery();
            while(rs.next()) {
                int id = rs.getInt("id");
                String title = rs.getString("title");
                String code = rs.getString("code");
                int category_id = rs.getInt("category_id");
                int credits = rs.getInt("credits");
                int max_points = rs.getInt("max_points");
                String category_title = rs.getString("category_title");

                courses.add(new Course(id, title, code, category_id,category_title, credits, max_points));

            }
        }catch (Exception e) {
            e.printStackTrace();
        }

        return courses;
    }

    @Override
    public int countCourses() {
        int courses = 0;
        try(Connection conn = DBConfig.getConnection(); PreparedStatement pstmt = conn.prepareStatement(countCourses)) {


        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return courses;
    }


    @Override
    public void updateCourse(int id, String title, String code, int category_id, int credits, int max_points) {
        try(Connection conn = DBConfig.getConnection(); PreparedStatement pstmt = conn.prepareStatement(updateById)) {
            pstmt.setString(1, title);
            pstmt.setString(2, code);
            pstmt.setInt(3, category_id);
            pstmt.setInt(4, credits);
            pstmt.setInt(5, max_points);

            pstmt.setInt(6, id);

            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public boolean deleteCourse(int id) {
        boolean isDeleted = false;
        try(Connection conn = DBConfig.getConnection(); PreparedStatement pstmt = conn.prepareStatement(deleteById)) {
            pstmt.setInt(1, id);
            isDeleted = pstmt.executeUpdate() > 0;

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return isDeleted;
    }

    @Override
    public void addToClass(int classId, int courseId, int staffId) {
        try(Connection conn = DBConfig.getConnection(); PreparedStatement pstmt = conn.prepareStatement(insertIntoClass)) {
            pstmt.setInt(1, classId);
            pstmt.setInt(2, courseId);
            pstmt.setInt(3, staffId);
            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
