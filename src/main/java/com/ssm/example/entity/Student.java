package com.ssm.example.entity;

public class Student {
    private Integer id;

    private String name;

    private String gender;

    private String email;

    private String tel;

    private Integer mId;

    private Major major;



    public Integer getId() {
        return id;
    }

    public Major getMajor() {
        return major;
    }

    public void setMajor(Major major) {
        this.major = major;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender == null ? null : gender.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel == null ? null : tel.trim();
    }

    public Integer getmId() {
        return mId;
    }

    public Student() {
    }

    @Override
    public String toString() {
        return "Student{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", gender='" + gender + '\'' +
                ", email='" + email + '\'' +
                ", tel='" + tel + '\'' +
                ", mId=" + mId +
                ", major=" + major +
                '}';
    }

    public Student(Integer id, String name, String gender, String email, String tel, Integer mId) {

        this.id = id;
        this.name = name;
        this.gender = gender;
        this.email = email;
        this.tel = tel;
        this.mId = mId;


    }

    public void setmId(Integer mId) {
        this.mId = mId;
    }
}