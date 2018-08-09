package com.ssm.example.service;

import com.ssm.example.entity.Major;
import com.ssm.example.entity.Student;

import java.util.List;

public interface StudentService {
	List<Student> findAll();
	boolean delete(int id);

	void saveStu(Student student);

	boolean checkName(String name);

    Student getStuById(Integer id);

    boolean updateStu(Student student);
}
