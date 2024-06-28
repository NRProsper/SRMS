package com.srms.srms1.classes;

public class ClassCourse {

    private int classId;
    private int courseId;
    private int staffId;
    private String staffName;
    private String classLevel;
    private String courseTitle;
    private int courseMarks;
    private int categoryId;
    private String categoryTitle;

    public ClassCourse(int classId, int courseId, int staffId) {
        this.classId = classId;
        this.courseId = courseId;
        this.staffId = staffId;
    }

    public ClassCourse(int classId, int courseId, int staffId, String staffName, String classLevel, String courseTitle, int courseMarks, int categoryId, String categoryTitle) {
        this.classId = classId;
        this.courseId = courseId;
        this.staffId = staffId;
        this.staffName = staffName;
        this.classLevel = classLevel;
        this.courseTitle = courseTitle;
        this.courseMarks = courseMarks;
        this.categoryId = categoryId;
        this.categoryTitle = categoryTitle;
    }

    public void setClassId(int classId) {
        this.classId = classId;
    }

    public void setCourseId(int courseId) {
        this.courseId = courseId;
    }

    public void setStaffId(int staffId) {
        this.staffId = staffId;
    }

    public void setStaffName(String staffName) {
        this.staffName = staffName;
    }

    public void setClassLevel(String classLevel) {
        this.classLevel = classLevel;
    }

    public void setCourseTitle(String courseTitle) {
        this.courseTitle = courseTitle;
    }

    public void setCourseMarks(int courseMarks) {
        this.courseMarks = courseMarks;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }

    public void setCategoryTitle(String categoryTitle) {
        this.categoryTitle = categoryTitle;
    }

    public int getClassId() {
        return classId;
    }

    public int getCourseId() {
        return courseId;
    }

    public int getStaffId() {
        return staffId;
    }

    public String getStaffName() {
        return staffName;
    }

    public String getClassLevel() {
        return classLevel;
    }

    public String getCourseTitle() {
        return courseTitle;
    }

    public int getCourseMarks() {
        return courseMarks;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public String getCategoryTitle() {
        return categoryTitle;
    }
}
