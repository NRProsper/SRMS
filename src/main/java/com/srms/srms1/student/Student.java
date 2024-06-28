package com.srms.srms1.student;

public class Student {

        private int reg_no;
        private String fname;
        private String lname;
        private String email; /*Optional*/
        private String bdate;
        private String sex;
        private String nationality;
        private String province;
        private String district;
        private String sector;
        private String cell;
        private String village;
        private int class_id;
        private String study_mode;
        private String religion; /*Optional*/

        private String level;

    private Student(Builder builder) {
        this.fname = builder.fname;
        this.lname = builder.lname;
        this.email = builder.email;
        this.bdate = builder.bdate;
        this.sex = builder.sex;
        this.nationality = builder.nationality;
        this.province = builder.province;
        this.district = builder.district;
        this.sector = builder.sector;
        this.cell = builder.cell;
        this.village = builder.village;
        this.class_id = builder.class_id;
        this.study_mode = builder.study_mode;
        this.religion = builder.religion;
        this.reg_no = builder.reg_no;
        this.level = builder.level;
    }

    public Student(int reg_no, String fname, String lname, String study_mode, String sex, String level) {
        this.reg_no = reg_no;
        this.fname = fname;
        this.lname = lname;
        this.study_mode = study_mode;
        this.sex = sex;
        this.level = level;
    }

    public int getReg_no() {
        return reg_no;
    }

    public String getFname() {
        return fname;
    }

    public String getLname() {
        return lname;
    }

    public String getEmail() {
        return email;
    }

    public String getBdate() {
        return bdate;
    }

    public String getSex() {
        return sex;
    }

    public String getNationality() {
        return nationality;
    }

    public String getProvince() {
        return province;
    }

    public String getDistrict() {
        return district;
    }

    public String getSector() {
        return sector;
    }

    public String getCell() {
        return cell;
    }

    public String getVillage() {
        return village;
    }

    public int getClass_id() {
        return class_id;
    }

    public String getStudy_mode() {
        return study_mode;
    }

    public String getReligion() {
        return religion;
    }

    public String getLevel() {
        return level;
    }

    public static class Builder {

        private int reg_no;
        private String fname;
        private String lname;
        private String email; /*Optional*/
        private String bdate;
        private String sex;
        private String nationality;
        private String province;
        private String district;
        private String sector;
        private String cell;
        private String village;
        private int class_id;
        private String study_mode;
        private String religion; /*Optional*/

        private String level;



        public Builder(int reg_no, String fname, String lname, String bdate, String sex, String nationality, String province, String district, String sector, String cell, String village, int class_id, String study_mode) {
            this.reg_no = reg_no;
            this.fname = fname;
            this.lname = lname;
            this.bdate = bdate;
            this.sex = sex;
            this.nationality = nationality;
            this.province = province;
            this.district = district;
            this.sector = sector;
            this.cell = cell;
            this.village = village;
            this.class_id = class_id;
            this.study_mode = study_mode;
        }

        public Builder(String fname, String lname, String bdate, String sex, String nationality, String province, String district, String sector, String cell, String village, int class_id, String study_mode) {
            this.fname = fname;
            this.lname = lname;
            this.bdate = bdate;
            this.sex = sex;
            this.nationality = nationality;
            this.province = province;
            this.district = district;
            this.sector = sector;
            this.cell = cell;
            this.village = village;
            this.class_id = class_id;
            this.study_mode = study_mode;
        }

        public Builder(int reg_no, String fname, String lname, String study_mode, String level, String sex) {
            this.reg_no = reg_no;
            this.fname = fname;
            this.lname = lname;
            this.study_mode = study_mode;
            this.level = level;
            this.sex = sex;
        }

        public Builder email(String email) {
            this.email = email;
            return this;
        }

        public Builder religion(String religion) {
            this.religion = religion;
            return this;
        }

        public Student build() {
            return new Student(this);
        }

    }

}
