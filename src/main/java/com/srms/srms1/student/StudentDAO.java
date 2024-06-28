package com.srms.srms1.student;

import java.util.List;

public interface StudentDAO {

    public void insertStudent(Student student);
    public void selectAllStudents();
    public List<Student> selectStudentsByClass(int id);
    public int countStudents();

}
