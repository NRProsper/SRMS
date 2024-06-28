package com.srms.srms1.course;

public class Category {

    private int id;
    private String title;

    private String status;


    public Category(int id, String title, String status) {
        this.id = id;
        this.title = title;
        this.status = status;
    }

    public Category(String title) {
        this.title = title;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public String getTitle() {
        return title;
    }

    public String getStatus() {
        return status;
    }
}
