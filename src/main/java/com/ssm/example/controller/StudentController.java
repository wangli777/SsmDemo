package com.ssm.example.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.ssm.example.entity.Msg;
import com.ssm.example.entity.Student;
import com.ssm.example.service.StudentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import java.util.List;
/*
* 使用RESTful风格的URI
* /stu/{id} GET     查询学生
* /stu/     POST    保存学生
* /stu/{id} PUT     修改学生
* /stu/{id} DELETE  删除学生*/
@Controller
public class StudentController {
    @Autowired
    private StudentService service;


    /*@ResponseBody表示将返回对象转化为Jackson字符串*/
    @RequestMapping(value = "/stu", method = RequestMethod.GET)
    @ResponseBody
    public Msg getStuList(@RequestParam(value = "pageNumber",defaultValue = "1")Integer pageNumber){
        //此时查询出来的数据有1000条，不是一个分页查询
        //引入PageHelper分页插件
        //在查询之前调用startPage方法传入页码以及每页内容数
        PageHelper.startPage(pageNumber,5);
        //调用上述方法后紧跟的查询即为分页查询
        List<Student> studentList = service.findAll();
        //使用PageInfo来包装查询结果集，还可以传入需要连续显示的页数5
        // 其中封装了详细的分页信息包括查询的数据
        PageInfo pageInfo = new PageInfo(studentList,5);

        return Msg.success().add("pageInfo",pageInfo);
    }
    //以POST方式请求/stuList即为保存操作
    @RequestMapping(value = "/stu",method = RequestMethod.POST)
    @ResponseBody
    public Msg saveStu(Student student){
        service.saveStu(student);
        return Msg.success();
    }
    @RequestMapping(value = "/stu/{id}" ,method = RequestMethod.GET)
    @ResponseBody
    public Msg getStu(@PathVariable("id") Integer id){
        Student student = service.getStuById(id);
        return Msg.success().add("stu",student);
    }
    @RequestMapping(value = "/checkName")
    @ResponseBody
    public Msg checkName(@RequestParam(value = "name") String name){
        boolean b = service.checkName(name);
        if (b){
            return Msg.success();
        }else {
            return Msg.fail();

        }
    }

    /**
     * 修改学生
     * 要能直接支持PUT请求并将请求体中的数据封装到POJO中
     * 需要在web.xml中配置上HttpPutFormContentFilter;
     * 其作用是将请求体中的数据解析封装成map，
     * @param student
     * @return
     */
    @RequestMapping(value = "/stu/{id}",method = RequestMethod.PUT)
    @ResponseBody
    public Msg updateStu(Student student){
        System.out.println("将要处理的学生数据:"+student);
        boolean b = service.updateStu(student);
        if (b) {
            return Msg.success();
        }else {
            return Msg.fail();
        }
    }

    /**
     * 批量删除
     * @param ids 将被删除的id拼接成的字符串
     * @return
     */
    @RequestMapping(value = "/stu/{ids}",method = RequestMethod.DELETE)
    @ResponseBody
    public Msg deleteStu(@PathVariable(value = "ids") String ids) {
        if (ids.contains("-")){
            String[] split = ids.split("-");
            for (String s:split
                    ) {
                int i = Integer.parseInt(s);
                service.delete(i);
            }
        }else {
            service.delete(Integer.parseInt(ids));
        }

        return Msg.success();
    }

//    @RequestMapping("/stuList")
//    public String getStuList(@RequestParam(value = "pageNumber",defaultValue = "1")Integer pageNumber,Model model){
//        //此时查询出来的数据有1000条，不是一个分页查询
//        //引入PageHelper分页插件
//        //在查询之前调用startPage方法传入页码以及每页内容数
//        PageHelper.startPage(pageNumber,5);
//        //调用上述方法后紧跟的查询即为分页查询
//        List<Student> studentList = service.findAll();
//        //使用PageInfo来包装查询结果集，还可以传入需要连续显示的页数5
//        // 其中封装了详细的分页信息包括查询的数据
//        PageInfo pageInfo = new PageInfo(studentList,5);
//        model.addAttribute("pageInfo", pageInfo);
//
//        return "list";
//    }
//	@Autowired
//	private StudentService studentService;
//
//	/**
//	 * 查找所有学生
//	 * @return
//	 */
//	@RequestMapping(value="/findAll")
//	public ModelAndView test(){
//		List<Student> list = studentService.findAll();
//		ModelAndView modelAndView = new ModelAndView();
//		modelAndView.setViewName("index");
//		modelAndView.addObject("list", list);
//		return modelAndView;
//	}
//
//	/**
//	 * 根据id删除指定学生
//	 * @return
//	 */
//	@RequestMapping(value="/delStu")
//	public ModelAndView delStu(int id){
//		System.out.println("要删除的id是:"+id);
//		boolean isDel = studentService.delete(id);
//		ModelAndView modelAndView = new ModelAndView();
//		if (isDel) {
//			modelAndView.addObject("msg", "删除成功！");
//		}else {
//			modelAndView.addObject("msg", "删除失败！");
//		}
//		modelAndView.setViewName("redirect:/findAll");
//		return modelAndView;
//	}
}
