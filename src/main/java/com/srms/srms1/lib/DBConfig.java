package com.srms.srms1.lib;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConfig {

    private static final String dbUrl = "jdbc:mysql://localhost:3306/SRMS";
    private static final String user = "root";
    private static final String password = "";

    public static Connection getConnection()  {
        Connection conn = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection(dbUrl, user, password);
        }catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }

        return conn;
    }

}
