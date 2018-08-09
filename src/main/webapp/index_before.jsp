<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ page isELIgnored="false" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>学生列表</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <script type="text/javascript" src="static/js/jquery-1.12.4.min.js"></script>
    <script type="text/javascript">
        //删除
        $(document).on("click", ".delete_btn", function () {
            //1、弹出是否确认删除对话框
            var empName = $(this).parents("tr").find("td:eq(2)").text();
            var empId = $(this).parents("tr").find("td:eq(1)").text();
            if (confirm("确认删除【" + empName + "】吗？")) {
                //确认，发送ajax请求删除即可
                $.post("/delStu", {id: empId},
                        function (data) {
                            //刷新本页
                            window.location.reload();
                        })
            }
        });
        //编辑
        // $(document).on("click", ".edit_btn", function () {
        //        //     //1、弹出是否确认删除对话框
        //        //     var empName = $(this).parents("tr").find("td:eq(2)").text();
        //        //     var empId = $(this).parents("tr").find("td:eq(1)").text();
        //        //     if (confirm("确认删除【" + empName + "】吗？")) {
        //        //         //确认，发送ajax请求删除即可
        //        //         $.post("/delStu", {id: empId},
        //        //             function (data) {
        //        //                 //刷新本页
        //        //                 window.location.reload();
        //        //             })
        //        //     }
        //        // });
        //新增
        // $(document).on("click", ".add_btn", function () {
        //     //1、弹出是否确认删除对话框
        //     var empName = $(this).parents("tr").find("td:eq(2)").text();
        //     var empId = $(this).parents("tr").find("td:eq(1)").text();
        //     if (confirm("确认删除【" + empName + "】吗？")) {
        //         //确认，发送ajax请求删除即可
        //         $.post("/delStu", {id: empId},
        //             function (data) {
        //                 //刷新本页
        //                 window.location.reload();
        //             })
        //     }
        // });
    </script>
</head>
<body>
<br><br><br>
<div class="container" align="center">
    <div class="row">
        <div class="col-md-12">
            <h1>SSM 框架快速整合实例--学生查询</h1>
        </div>
    </div>
    <br>
    <h3>${msg}</h3>
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover" id="emps_table">
                <thead>
                <tr>
                    <th>
                        <input type="checkbox" id="check_all"/>
                    </th>
                    <th>编号</th>
                    <th>姓名</th>
                    <th>性别</th>
                    <th>电子邮箱</th>
                    <th>联系电话</th>
                    <th>班级</th>
                    <th>操作&nbsp;&nbsp;
                        <button class="btn btn-info btn-sm add_btn">
                            <span class="glyphicon glyphicon-cloud">新增</span>
                        </button></th>
                </tr>
                </thead>
                <tbody>
                <c:forEach items="${list }" var="student">
                    <tr>
                        <td><input type='checkbox' class='check_item'/></td>
                        <td>${student.id }</td>
                        <td>${student.name }</td>
                        <td>${student.gender }</td>
                        <td>${student.email }</td>
                        <td>${student.tel }</td>
                        <td>${student.cla }</td>

                        <td>
                            <button class="btn btn-primary btn-sm edit_btn">
                                <span class="glyphicon glyphicon-pencil">编辑</span>
                            </button>&nbsp;&nbsp;
                            <button class="btn btn-danger btn-sm delete_btn">
                                <span class="glyphicon glyphicon-trash">删除</span>
                            </button>
                        </td>
                    </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>

</div>
</body>

</html>