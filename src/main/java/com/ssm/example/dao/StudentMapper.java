package com.ssm.example.dao;

import com.ssm.example.entity.Student;
import com.ssm.example.entity.StudentExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface StudentMapper {
    long countByExample(StudentExample example);

    int deleteByExample(StudentExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Student record);

    int insertSelective(Student record);

    List<Student> selectByExample(StudentExample example);

    Student selectByPrimaryKey(Integer id);

    /*查询信息中包含专业名称*/
    List<Student> selectByExampleWithMajor(StudentExample example);
    /*查询信息中包含专业名称*/
    Student selectByPrimaryKeyWithMajor(Integer id);

    int updateByExampleSelective(@Param("record") Student record, @Param("example") StudentExample example);

    int updateByExample(@Param("record") Student record, @Param("example") StudentExample example);

    int updateByPrimaryKeySelective(Student record);

    int updateByPrimaryKey(Student record);
}