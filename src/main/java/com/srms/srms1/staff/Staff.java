package com.srms.srms1.staff;

public class Staff {

    //Required Attribute
    private int id;
    private String f_name;
    private String l_name;
    private String phone;
    private String email;

    //Optional Attributes
    private String country;
    private String city;
    private String address;
    private String created_at;

    private Staff(Builder builder) {
        this.id = builder.id;
        this.f_name = builder.f_name;
        this.l_name = builder.l_name;
        this.phone = builder.phone;
        this.email = builder.email;
        this.country = builder.country;
        this.city = builder.city;
        this.address = builder.address;
        this.created_at = builder.created_at;
    }

    public int getId() {
        return id;
    }

    public String getF_name() {
        return f_name;
    }

    public String getL_name() {
        return l_name;
    }

    public String getPhone() {
        return phone;
    }

    public String getEmail() {
        return email;
    }

    public String getCountry() {
        return country;
    }

    public String getCity() {
        return city;
    }

    public String getAddress() {
        return address;
    }

    public String getCreated_at() {
        return created_at;
    }

    public static class Builder {

        private int id;
        private String f_name;
        private String l_name;
        private String phone;
        private String email;

        //Optional Attributes
        private String country;
        private String city;
        private String address;
        private String created_at;


        public Builder(int id,String f_name, String l_name, String phone, String email, String country, String created_at) {
            this.id = id;
            this.f_name = f_name;
            this.l_name = l_name;
            this.phone = phone;
            this.email = email;
            this.country = country;
            this.created_at = created_at;
        }

        public Builder(String f_name, String l_name, String phone, String email, String country) {
            this.f_name = f_name;
            this.l_name = l_name;
            this.phone = phone;
            this.email = email;
            this.country = country;
        }


        public Builder city (String city) {
            this.city = city;
            return this;
        }

        public Builder address (String address) {
            this.address = address;
            return this;
        }

        public Staff build() {
            return new Staff(this);
        }



    }


}




