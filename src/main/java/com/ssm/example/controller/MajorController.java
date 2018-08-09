package com.ssm.example.controller;

import com.ssm.example.entity.Major;
import com.ssm.example.entity.Msg;
import com.ssm.example.service.MajorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @Author: WangLi
 * @Date: 2018/8/8 16:09
 * @Package: com.ssm.example.controller
 * @Description:
 */
@Controller
public class MajorController {
    @Autowired
    private MajorService majorService;

    @RequestMapping("/getMajor")
    @ResponseBody
    public Msg getMajor(){
        List<Major> allMajor = majorService.getAllMajor();

        return Msg.success().add("majors",allMajor);
    }


}
