package com.srms.srms1.course;

import java.util.List;

public interface CourseDAO {

    public void insertCourse(Course course);
    public List<Course> selectAllCourse();
    public int countCourses();
    public void updateCourse(int id, String title, String code, int category_id, int credits, int max_points);
    public boolean deleteCourse(int id);
    public void addToClass(int classId, int courseId, int staffId);


}
