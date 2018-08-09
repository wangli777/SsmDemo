package com.ssm.example.test;

import com.ssm.example.dao.MajorMapper;
import com.ssm.example.dao.StudentMapper;
import com.ssm.example.entity.Major;
import com.ssm.example.entity.Student;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;
import java.util.UUID;

/**
 * @Author: WangLi
 * @Date: 2018/8/7 19:46
 * @Package: com.ssm.example.test
 * @Description:
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class DaoTest {
    @Autowired
    MajorMapper majorMapper;
    @Autowired
    StudentMapper studentMapper;

    @Autowired
    SqlSession sqlSession;
    @Test
    public void test(){
//        majorMapper.insertSelective(new Major(null, "移动开发"));
//        studentMapper.insertSelective(new Student(null,"WangLi","M","wangli@163.com","15979255942",1));
//        StudentMapper mapper = sqlSession.getMapper(StudentMapper.class);
//        for (int i = 0;i<1000;i++){
//            String randomName = UUID.randomUUID().toString().substring(0, 5) + i;
//            mapper.insertSelective(new Student(null,randomName,"M",randomName+"@163.com",null,1));
//        }
//        System.out.println("批量插入完成");
        List<Student> studentList = studentMapper.selectByExampleWithMajor(null);
        for (Student stu: studentList
             ) {
            System.out.println(stu.getName());
        }
    }
}
