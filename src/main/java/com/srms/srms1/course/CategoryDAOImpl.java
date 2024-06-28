package com.srms.srms1.course;

import com.srms.srms1.lib.DBConfig;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CategoryDAOImpl implements CategoryDAO{

    public static final String insertCategory = "INSERT INTO category (title) VALUES (?)";
    public static final String selectAllCategories = "SELECT * FROM category";
    public static final String updateCategory = "UPDATE `category` SET `title`= ? WHERE id = ?";
    public static final String deleteCategory = "DELETE FROM `category` WHERE id = ?";


    @Override
    public void insertCategory(Category category) {
        try(Connection conn = DBConfig.getConnection(); PreparedStatement pstmt = conn.prepareStatement(insertCategory)) {
            pstmt.setString(1, category.getTitle());
            pstmt.executeUpdate();

        }catch (Exception e) {
            e.printStackTrace();
//            throw new RuntimeException("Error while inserting category title", e);
        }
    }

    @Override
    public List<Category> selectAllCategories() {
        List<Category> categories = new ArrayList<>();
        try(Connection conn = DBConfig.getConnection(); PreparedStatement pstmt = conn.prepareStatement(selectAllCategories)) {
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String title = rs.getString("title");
                String status = rs.getString("status");
                categories.add(new Category(id, title, status));
            }

        }catch (Exception e) {
            e.printStackTrace();
        }
        return categories;
    }

    @Override
    public Category getCategory(int id) {
        return null;
    }

    @Override
    public void updateCategory(int id, String title) {
        try(Connection conn = DBConfig.getConnection(); PreparedStatement pstmt = conn.prepareStatement(updateCategory)) {
            pstmt.setString(1, title);
            pstmt.setInt(2, id);
            pstmt.executeUpdate();

        }catch (Exception e) {
            e.printStackTrace();
        }
    }

    @Override
    public boolean deleteCategory(int id) {
        boolean rowDeleted = false;
        try(Connection conn = DBConfig.getConnection(); PreparedStatement pstmt = conn.prepareStatement(deleteCategory)) {
            pstmt.setInt(1, id);
            rowDeleted = pstmt.executeUpdate() > 0;

        }catch (Exception e) {
            e.printStackTrace();
        }


        return rowDeleted;
    }
}
