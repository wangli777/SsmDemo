package com.ssm.example.service.impl;

import java.util.List;

import com.ssm.example.dao.MajorMapper;
import com.ssm.example.dao.StudentMapper;
import com.ssm.example.entity.Major;
import com.ssm.example.entity.Student;
import com.ssm.example.entity.StudentExample;
import com.ssm.example.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class StudentServiceImpl implements StudentService {

	@Autowired
	private StudentMapper studentMapper;

	@Override
	public List<Student> findAll() {
		// TODO Auto-generated method stub
		return studentMapper.selectByExampleWithMajor(null);
	}

	@Override
	public boolean delete(int id) {
		return studentMapper.deleteByPrimaryKey(id)>0;
	}

	@Override
	public void saveStu(Student student) {
		studentMapper.insertSelective(student);
	}

	/**
	 * 检测用户名是否可用
	 * @param name
	 * @return
	 */
	@Override
	public boolean checkName(String name) {
		StudentExample example = new StudentExample();
		StudentExample.Criteria criteria = example.createCriteria();
		criteria.andNameEqualTo(name);
		long count = studentMapper.countByExample(example);
		return count==0;
	}

    @Override
    public Student getStuById(Integer id) {
        Student student = studentMapper.selectByPrimaryKey(id);
        return student;
    }

    @Override
    public boolean updateStu(Student student) {
        return studentMapper.updateByPrimaryKeySelective(student)>0;
    }


}
