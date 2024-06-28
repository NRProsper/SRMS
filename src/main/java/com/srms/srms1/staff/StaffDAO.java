package com.srms.srms1.staff;

import java.util.List;

public interface StaffDAO {
    public void insertStaff(Staff staff);
    public List<Staff> selectAllStaff();
    public void deleteStaff(int id);
    public void updateStaff(int id);
}
