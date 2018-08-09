package com.ssm.example.entity;

import com.github.pagehelper.PageInfo;

import java.util.HashMap;
import java.util.Map;

/**
 * @Author: WangLi
 * @Date: 2018/8/8 12:01
 * @Package: com.ssm.example.entity
 * @Description: 通用的返回类
 */
public class Msg {
    /*
    自定义状态码 200表示成功 500表示失败
    * */
    private int stutasCode;
    /*提示信息*/
    private String msg;
    /*用户返回给浏览器的数据*/
    private Map<String,Object> extend = new HashMap<>();

    public static Msg success(){
        Msg msg = new Msg();
        msg.setStutasCode(200);
        msg.setMsg("处理成功!");
        return msg;
    }

    public static Msg fail(){
        Msg msg = new Msg();
        msg.setStutasCode(500);
        msg.setMsg("处理失败!");
        return msg;
    }
    public int getStutasCode() {
        return stutasCode;
    }

    public void setStutasCode(int stutasCode) {
        this.stutasCode = stutasCode;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Map<String, Object> getExtend() {
        return extend;
    }

    public void setExtend(Map<String, Object> extend) {
        this.extend = extend;
    }

    public Msg add(String key,Object value) {
        this.getExtend().put(key, value);
        return this;
    }
}
