package com.srms.srms1.classes;

import com.srms.srms1.lib.DBConfig;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ClassDAOImpl implements ClassDAO {

    public static final String insertClass = "INSERT INTO class (class_type, faculty, level, mentor_id) VALUES (?, ?, ?, ?)";
    public static final String selectAllClasses = "SELECT class.*,staff.staff_id ,CONCAT(staff.f_name, ' ', staff.l_name) AS staff_name " +
            "FROM class " +
            "JOIN staff ON class.mentor_id = staff.staff_id";


    @Override
    public void insertClass(Class cls) {
        try(Connection conn = DBConfig.getConnection(); PreparedStatement pstmt = conn.prepareStatement(insertClass)) {
            pstmt.setString(1, cls.getType());
            pstmt.setString(2, cls.getFaculty());
            pstmt.setString(3, cls.getLevel());
            pstmt.setInt(4, cls.getMentor_id());

            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public List<Class> selectAllClasses() {
        List<Class> classes = new ArrayList<>();
        try(Connection conn = DBConfig.getConnection(); PreparedStatement pstmt = conn.prepareStatement(selectAllClasses)) {
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("class_id");
                String type = rs.getString("class_type");
                String faculty = rs.getString("faculty");
                String level = rs.getString("level");
                String staff_name = rs.getString("staff_name");
                int staff_id = rs.getInt("staff_id");

                classes.add(new Class(id, type, faculty, level, staff_id, staff_name));

            }


        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return  classes;
    }

    @Override
    public void deleteClass(int id) {

    }

    @Override
    public void updateClass(int id) {

    }
}
