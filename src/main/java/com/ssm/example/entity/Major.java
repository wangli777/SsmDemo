package com.ssm.example.entity;

public class Major {
    private Integer id;

    private String mName;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getmName() {
        return mName;
    }

    public void setmName(String mName) {
        this.mName = mName;
    }

    public Major() {

    }

    public Major(Integer id, String mName) {

        this.id = id;
        this.mName = mName;
    }
}