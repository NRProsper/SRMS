package com.srms.srms1.reports;

public class Report {

    private int studentId;
    private String studentName;
    private String classLevel;
    private String courseTitle;
    private int courseMarks;
    private int catMarks;
    private int examMarks;
    private int totalMarks;

    public Report(int studentId, String studentName, String classLevel, String courseTitle, int courseMarks, int catMarks, int examMarks, int totalMarks) {
        this.studentId = studentId;
        this.studentName = studentName;
        this.classLevel = classLevel;
        this.courseTitle = courseTitle;
        this.courseMarks = courseMarks;
        this.catMarks = catMarks;
        this.examMarks = examMarks;
        this.totalMarks = totalMarks;
    }

    public void setStudentId(int studentId) {
        this.studentId = studentId;
    }

    public void setStudentName(String studentName) {
        this.studentName = studentName;
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

    public void setCatMarks(int catMarks) {
        this.catMarks = catMarks;
    }

    public void setExamMarks(int examMarks) {
        this.examMarks = examMarks;
    }

    public void setTotalMarks(int totalMarks) {
        this.totalMarks = totalMarks;
    }

    public int getStudentId() {
        return studentId;
    }

    public String getStudentName() {
        return studentName;
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

    public int getCatMarks() {
        return catMarks;
    }

    public int getExamMarks() {
        return examMarks;
    }

    public int getTotalMarks() {
        return totalMarks;
    }
}
