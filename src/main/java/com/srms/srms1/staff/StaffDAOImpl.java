package com.srms.srms1.staff;

import com.srms.srms1.lib.DBConfig;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class StaffDAOImpl implements StaffDAO{

    private static final String selectAllStaff = "SELECT * FROM staff";
    private static final String deleteStaff = "DELETE FROM staff WHERE staff_id = ?";

    @Override
    public void insertStaff(Staff staff) {
        StringBuilder insertStaff = new StringBuilder("INSERT INTO staff (f_name, l_name, phone, email, country");
        if(staff.getCity() != null) {
            insertStaff.append(", city");
        }if(staff.getAddress() != null) {
            insertStaff.append(", address");
        }
        insertStaff.append(") VALUES (?, ?, ?, ?, ?");
        if(staff.getCity() != null) {
            insertStaff.append(", ?");
        }if(staff.getAddress() != null) {
            insertStaff.append(", ?");
        }
        insertStaff.append(")");

        System.out.println(insertStaff.toString());

        try(Connection conn = DBConfig.getConnection(); PreparedStatement pstmt = conn.prepareStatement(insertStaff.toString())) {
            pstmt.setString(1, staff.getF_name());
            pstmt.setString(2, staff.getL_name());
            pstmt.setString(3, staff.getPhone());
            pstmt.setString(4, staff.getEmail());
            pstmt.setString(5, staff.getCountry());

            int parameterIndex = 6;
            if(staff.getCity() != null) {
                pstmt.setString(parameterIndex++, staff.getCity());
            }if(staff.getAddress() != null) {
                pstmt.setString(parameterIndex++, staff.getAddress());
            }

            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException("Inserting Staff Error" + e);
        }
    }

    @Override
    public List<Staff> selectAllStaff() {
        List<Staff> staffList = new ArrayList<>();
        try(Connection conn = DBConfig.getConnection(); PreparedStatement pstmt = conn.prepareStatement(selectAllStaff)) {
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("staff_id");
                String f_name = rs.getString("f_name");
                String l_name = rs.getString("l_name");
                String phone = rs.getString("phone");
                String email = rs.getString("email");
                String country = rs.getString("country");
                String created_at = rs.getString("created_at");

                staffList.add(new Staff.Builder(id ,f_name, l_name, phone, email, country, created_at).build());

            }

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }

        return staffList;
    }

    @Override
    public void deleteStaff(int id) {
        try(Connection conn = DBConfig.getConnection(); PreparedStatement pstmt = conn.prepareStatement(deleteStaff)) {
            pstmt.setInt(1, id);
            pstmt.executeUpdate();

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    @Override
    public void updateStaff(int id) {

    }
}
