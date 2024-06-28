package com.srms.srms1.classes;

public class Class {

        int id;
        String type;
        String faculty;
        String level;
        int mentor_id;
        String mentor_name;

    public Class(int id, String type, String faculty, String level, int mentor_id, String mentor_name) {
        this.id = id;
        this.type = type;
        this.faculty = faculty;
        this.level = level;
        this.mentor_id = mentor_id;
        this.mentor_name = mentor_name;
    }

    public Class(String type, String faculty, String level, int mentor_id, String mentor_name) {
        this.type = type;
        this.faculty = faculty;
        this.level = level;
        this.mentor_id = mentor_id;
        this.mentor_name = mentor_name;
    }

    public Class(String type, String faculty, String level, int mentor_id) {
        this.type = type;
        this.faculty = faculty;
        this.level = level;
        this.mentor_id = mentor_id;
    }

    public void setType(String type) {
        this.type = type;
    }

    public void setFaculty(String faculty) {
        this.faculty = faculty;
    }

    public void setLevel(String level) {
        this.level = level;
    }

    public void setMentor_id(int mentor_id) {
        this.mentor_id = mentor_id;
    }

    public void setMentor_name(String mentor_name) {
        this.mentor_name = mentor_name;
    }

    public int getId() {
        return id;
    }

    public String getType() {
        return type;
    }

    public String getFaculty() {
        return faculty;
    }

    public String getLevel() {
        return level;
    }

    public int getMentor_id() {
        return mentor_id;
    }

    public String getMentor_name() {
        return mentor_name;
    }
}
