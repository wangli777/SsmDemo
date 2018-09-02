package com.ssm.example.entity;

import javax.validation.constraints.Pattern;

public class Student {
    private Integer id;

    @Pattern(regexp = "(^[a-zA-Z0-9_-]{6,16}$)|(^[\\u2E80-\\u9FFF]{2,5})",message = "姓名必须是6到16个英文或数字或2到5个汉字!")
    private String name;

    private String gender;

//    @Email
    @Pattern(regexp = "^([a-z0-9_\\.-]+)@([\\da-z\\.-]+)\\.([a-z\\.]{2,6})$",message = "邮箱格式不正确!")
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