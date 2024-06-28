package com.srms.srms1.lib;

public class User {

    private int id;
    private String uname;
    private String password;

    public User(int id, String fname, String password) {
        this.id = id;
        this.uname = fname;
        this.password = password;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setUname(String uname) {
        this.uname = uname;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getUname() {
        return uname;
    }

    public String getPassword() {
        return password;
    }


}
