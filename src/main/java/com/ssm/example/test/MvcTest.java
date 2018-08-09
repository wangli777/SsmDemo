package com.ssm.example.test;

import com.github.pagehelper.PageInfo;
import com.ssm.example.entity.Student;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockHttpServletRequestBuilder;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import java.util.List;

/**
 * @Author: WangLi
 * @Date: 2018/8/7 21:07
 * @Package: com.ssm.example.test
 * @Description: 使用Spring测试模块提供的测试请求功能，测试请求的正确性
 */
@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = {"classpath:applicationContext.xml","classpath:springmvc.xml"})
public class MvcTest {

    @Autowired
    WebApplicationContext context;
//    虚拟mvc请求，获取到处理结果
    MockMvc mockMvc;

    @Before
    public void initMockMvc(){
        mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
    }
    @Test
    public void testMVC() throws Exception {
        //模拟请求并拿到返回值
        MvcResult mvcResult = mockMvc.perform(MockMvcRequestBuilders.get("/checkName").param("name", "张三")).andReturn();
//        mvcResult.getRequest().getAttribute("")
//        //请求成功后，request域中会有pageInfo，可以取出并验证
//        PageInfo pageInfo = (PageInfo) mvcResult.getRequest().getAttribute("pageInfo");
//        List<Student> list = pageInfo.getList();
//        System.out.println("当前页码"+pageInfo.getPageNum());
//        System.out.println("总页码"+pageInfo.getPages());
//        System.out.println("总记录数"+pageInfo.getTotal());
//        System.out.println("在页面中需要连续显示的页码");
//        int[] nums = pageInfo.getNavigatepageNums();
//        for (int n:nums
//             ) {
//            System.out.print(" "+n);
//        }
//        System.out.println("学生姓名:");
//        for (Student stu: list
//             ) {
//            System.out.println(stu.getMajor().getmName());
//        }
    }
}
