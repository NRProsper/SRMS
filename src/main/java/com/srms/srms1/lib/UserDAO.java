package com.srms.srms1.lib;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.*;
public class UserDAO {

    public static final String GET_USER = "SELECT * FROM users WHERE username = ? AND password = ?";

    public User getUser(String userN, String pass) {
        User user = null;
        try(Connection conn = DBConfig.getConnection(); PreparedStatement pstmt = conn.prepareStatement(GET_USER)) {
            pstmt.setString(1, userN);
            pstmt.setString(2, pass);
            ResultSet rs = pstmt.executeQuery();
            while(rs.next()) {
                int id = rs.getInt("id");
                String userName  = rs.getString("username");
                String password = rs.getString("password");

                user = new User(id, userName, password);
            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return user;
    }

}
