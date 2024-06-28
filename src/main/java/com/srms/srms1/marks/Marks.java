package com.srms.srms1.marks;

import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonProperty;

public class Marks {

    private int studentId;
    private int classId;
    private int courseId;
    private int catMarks;
    private int examMarks;


    @JsonCreator
    public Marks(@JsonProperty("studentId") int studentId,
                 @JsonProperty("classId") int classId,
                 @JsonProperty("courseId") int courseId,
                 @JsonProperty("catMarks") int catMarks,
                 @JsonProperty("examMarks") int examMarks) {
        this.studentId = studentId;
        this.classId = classId;
        this.courseId = courseId;
        this.catMarks = catMarks;
        this.examMarks = examMarks;
    }

    public void setStudentId(int studentId) {
        this.studentId = studentId;
    }

    public void setClassId(int classId) {
        this.classId = classId;
    }

    public void setCourseId(int courseId) {
        this.courseId = courseId;
    }

    public void setCatMarks(int catMarks) {
        this.catMarks = catMarks;
    }

    public void setExamMarks(int examMarks) {
        this.examMarks = examMarks;
    }

    public int getStudentId() {
        return studentId;
    }

    public int getClassId() {
        return classId;
    }

    public int getCourseId() {
        return courseId;
    }

    public int getCatMarks() {
        return catMarks;
    }

    public int getExamMarks() {
        return examMarks;
    }
}
