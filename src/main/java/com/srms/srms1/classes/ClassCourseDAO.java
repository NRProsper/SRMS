package com.srms.srms1.classes;

import java.util.List;

public interface ClassCourseDAO {

    public void insertClassCourse(ClassCourse classCourse);
    public List<ClassCourse> selectClassCourses();
    public List<ClassCourse> selectClassCourseById(int id);

}
