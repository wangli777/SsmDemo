package com.ssm.example.service.impl;

import com.ssm.example.dao.MajorMapper;
import com.ssm.example.entity.Major;
import com.ssm.example.service.MajorService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @Author: WangLi
 * @Date: 2018/8/8 15:48
 * @Package: com.ssm.example.service.impl
 * @Description:
 */
@Service
public class MajorServiceImpl implements MajorService{
    @Autowired
    private MajorMapper majorMapper;
    @Override
    public List<Major> getAllMajor() {
        List<Major> majorList = majorMapper.selectByExample(null);
        return majorList;
    }
}
