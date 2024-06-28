package com.srms.srms1.course;

public class Course {

    private int id;
    private String title;
    private String code;
    private int category_id;
    private String category_title;
    private int credits;
    private int max_points;

    public Course() {
    }

    public Course(int id, String title, String code, int category_id, String category_title,  int credits, int max_points) {
        this.id = id;
        this.title = title;
        this.code = code;
        this.category_id = category_id;
        this.category_title = category_title;
        this.credits = credits;
        this.max_points = max_points;
    }

    public Course(String title, String code, int category_id,  int credits, int max_points) {
        this.title = title;
        this.code = code;
        this.category_id = category_id;
        this.credits = credits;
        this.max_points = max_points;
    }

    public Course(String title, String code, int category_id, String category_title, int credits, int max_points) {
        this.code = code;
        this.title = title;
        this.category_id = category_id;
        this.category_title = category_title;
        this.credits = credits;
        this.max_points = max_points;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setCategory_id(int category_id) {
        this.category_id = category_id;
    }

    public void setCategory_title(String category_title) {
        this.category_title = category_title;
    }


    public void setCredits(int credits) {
        this.credits = credits;
    }

    public void setMax_points(int max_points) {
        this.max_points = max_points;
    }

    public int getId() {
        return id;
    }

    public String getCode() {
        return code;
    }

    public String getTitle() {
        return title;
    }

    public int getCategory_id() {
        return category_id;
    }

    public String getCategory_title() {
        return category_title;
    }


    public int getCredits() {
        return credits;
    }

    public int getMax_points() {
        return max_points;
    }

}
