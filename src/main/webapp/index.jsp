<%--
  Created by IntelliJ IDEA.
  User: 11517
  Date: 2018/8/7
  Time: 21:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String APP_PATH = request.getContextPath();
%>
<html>
<head>
    <title>学生信息</title>
    <!-- web路径：
不以/开始的相对路径，找资源，以当前资源的路径为基准，经常容易出问题。
以/开始的相对路径，找资源，以服务器的路径为标准(http://localhost:3306)；需要加上项目名
		http://localhost:3306/crud
 -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/static/js/jquery-1.12.4.min.js"></script>
    <script src="${pageContext.request.contextPath}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
</head>
<body>
<%--修改的模态框--%>
<div class="modal fade" id="stuUpdateModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">学生修改</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label for="stu_name_id" class="col-sm-2 control-label">Name</label>
                        <div class="col-sm-10">
                            <p class="form-control-static" id="stu_edit_name"></p>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="stu_email_id"  class="col-sm-2 control-label">Email</label>
                        <div class="col-sm-10">
                            <input type="text" name="email" class="form-control" id="stu_update_email" placeholder="email@163.com">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="stu_tel_id"  class="col-sm-2 control-label">Tel</label>
                        <div class="col-sm-10">
                            <input type="text" name="tel" class="form-control" id="stu_update_tel" placeholder="tel">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Gender</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender1_update_input" value="M" checked="checked"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender2_update_input" value="F"> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="stu_tel_id"  class="col-sm-2 control-label">Major</label>
                        <div class="col-sm-4">
                            <select class="form-control" name="mId" id="stu_update_major_select">

                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="stu_update_btn">保存</button>
            </div>
        </div>
    </div>
</div>
<!-- 添加学生的模态框 -->
<div class="modal fade" id="stuAddModel" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">学生添加</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal">
                    <div class="form-group">
                        <label for="stu_name_id" class="col-sm-2 control-label">Name</label>
                        <div class="col-sm-10">
                            <input type="text" name="name" class="form-control" id="stu_name_id" placeholder="Name">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="stu_email_id"  class="col-sm-2 control-label">Email</label>
                        <div class="col-sm-10">
                            <input type="text" name="email" class="form-control" id="stu_email_id" placeholder="email@163.com">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="stu_tel_id"  class="col-sm-2 control-label">Tel</label>
                        <div class="col-sm-10">
                            <input type="text" name="tel" class="form-control" id="stu_tel_id" placeholder="tel">
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">Gender</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender1_add_input" value="M" checked="checked"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender2_add_input" value="F"> 女
                            </label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="stu_tel_id"  class="col-sm-2 control-label">Major</label>
                        <div class="col-sm-4">
                            <select class="form-control" name="mId" id="stu_major_select">

                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary" id="stu_add_saveBtn">保存</button>
            </div>
        </div>
    </div>
</div>
<div class="container">
    <%--第一行显示标题信息--%>
    <div class="row">
        <div class="col-md-12">
            <h1>SSM整合案例</h1>
        </div>
    </div>
    <%--第二行显示按钮--%>
    <div class="row">
        <div class="col-md-4 col-md-offset-8">
            <button class="btn btn-info btn-lg" id="stu_add_model_btn"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增</button>
            <button class="btn btn-danger btn-lg" id="stu_delAll_btn"><span class="glyphicon glyphicon-trash " aria-hidden="true"></span>批量删除</button>
        </div>
    </div>
    <%--第三行显示学生列表信息--%>
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover table-bordered table-striped" id="stu_table">
                <thead>
                    <tr>
                        <th><input type="checkbox" id="check_all"></th>
                        <th>#</th>
                        <th>NAME</th>
                        <th>GENDER</th>
                        <th>EMAIL</th>
                        <th>TEL</th>
                        <th>MAJOR</th>
                        <th>OPTION</th>
                    </tr>
                </thead>
                <tbody>

                </tbody>
            </table>
        </div>
    </div>
    <%--第四行显示分页信息--%>
    <div class="row">
        <%--显示分页文字信息--%>
        <div class="col-md-6" id="page_info_area">
        </div>
        <%--显示分页条--%>
        <div class="col-md-6" id="page_nav_area"></div>
    </div>
</div>
<script type="text/javascript">
    var currentPage;
    //页面加载时执行
    $(function () {
        toPage(1);
    });

    function toPage(pn) {
        $.ajax({
            url:"${APP_PATH}/stu",
            data:"pageNumber="+pn,
            type:"GET",
            success:function (result) {
                //构建学生信息表
                build_stu_table(result);
                //构建分页信息
                buile_page_info(result);
                //构建分页导航条
                buile_page_nav(result);
            }
        });
    }
    //构建学生信息表
    function build_stu_table(result) {
        $("#stu_table tbody").empty();
        var list = result.extend.pageInfo.list;
        $.each(list,function (index,item) {
            var checkItemTd = $("<td><input type='checkbox' class='check-item'></td>")
            var stuIdTd = $("<td></td>").append(item.id);
            var stuNameTd = $("<td></td>").append(item.name);
            var stuGenderTd = $("<td></td>").append(item.gender=="M"?"男":"女");
            var stuEmailTd = $("<td></td>").append(item.email);
            var stuTelTd = $("<td></td>").append(item.tel);
            var stuMajorNameTd = $("<td></td>").append(item.major.mName);

            var editBtn = $("<button></button>").addClass("btn btn-info stu_edit_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-pencil")).append("编辑");
            //为编辑按钮添加一个记录当前学生id的属性
            editBtn.attr("edit_id", item.id);
            var delBtn = $("<button></button>").addClass("btn btn-danger stu_del_btn")
                .append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
            delBtn.attr("del_id", item.id);
            var optionTd = $("<td></td>").append(editBtn).append(" ").append(delBtn);
            $("<tr></tr>").append(checkItemTd)
                .append(stuIdTd)
                .append(stuNameTd)
                .append(stuGenderTd)
                .append(stuEmailTd)
                .append(stuTelTd)
                .append(stuMajorNameTd)
                .append(optionTd)
                .appendTo("#stu_table tbody");
        })
    }
    //构建分页信息
    function buile_page_info(result) {
        $("#page_info_area").empty();
        $("#page_info_area").append("当前第"+result.extend.pageInfo.pageNum+"页,总"+result.extend.pageInfo.pages+"页,共"+result.extend.pageInfo.total+"条记录");
        currentPage = result.extend.pageInfo.pageNum;
    }
    //构建分页导航条
    function buile_page_nav(result) {
        $("#page_nav_area").empty();
        //首页
        var firstPage = $("<li></li>").append($("<a></a>").append("首页"));

        //上一页
        var prePage = $("<li></li>").append($("<a></a>").append($("<span></span>").append("&laquo;").attr("aria-hidden","true")).attr("href","#").attr("aria-label","Previous"));

        if (result.extend.pageInfo.hasPreviousPage==false){
            firstPage.addClass("disabled");
            prePage.addClass("disabled");
        }else {
            firstPage.click(function () {
                toPage(1);
            })
            prePage.click(function () {
                toPage(result.extend.pageInfo.pageNum-1);
            })
        }
        //下一页
        var nextPage = $("<li></li>").append($("<a></a>").append($("<span></span>").append("&raquo;").attr("aria-hidden","true")).attr("href","#").attr("aria-label","Next"));

        //末页
        var lastPage = $("<li></li>").append($("<a></a>").append("末页").attr("href","#"));

        if (result.extend.pageInfo.hasNextPage==false){
            nextPage.addClass("disabled");
            lastPage.addClass("disabled");
        }else {
            nextPage.click(function () {
                toPage(result.extend.pageInfo.pageNum+1);
            })
            lastPage.click(function () {
                toPage(result.extend.pageInfo.pages);
            })
        }
        var ulEle = $("<ul></ul>").append(firstPage).append(prePage).addClass("pagination");

        var navigatepageNums = result.extend.pageInfo.navigatepageNums;
        $.each(navigatepageNums,function (index, item) {
            var liEle = $("<li></li>").append($("<a></a>").append(item));

            //如果是当前页加上高亮状态
            if (result.extend.pageInfo.pageNum==item){
                liEle.addClass("active");
            }
            liEle.click(function () {
                toPage(item);
            })
            ulEle.append(liEle);
        })
        ulEle.append(nextPage).append(lastPage);

        var navEle = $("<nav></nav>").append(ulEle).attr("aria-label","Page navigation");

        navEle.appendTo($("#page_nav_area"));
    }
    function reset_form(ele) {
        $(ele)[0].reset();
        //清除表单的样式
        $(ele).find("*").removeClass("has-error has-success");
        $(ele).find(".help-block").text("");
    }
    $("#stu_add_model_btn").click(function () {

        //在弹出新增模态框之前发送ajax请求查询出专业信息并展示在模态框中
        getMajor("#stuAddModel select");
        //弹出新增模态框
        $("#stuAddModel").modal({
            backdrop:"static"
        });
    });
    function getMajor(ele) {
        //清除下拉列表的数据
        $(ele).empty();
        $.ajax({
            url:"${APP_PATH}/getMajor",
            type:"GET",
            success:function (result) {
                //将服务器返回的专业数据设置到下拉框中
                var majors = result.extend.majors;
                console.log(majors);
                $.each(majors,function (index, item) {
                    var opItem = $("<option></option>").append(item.mName).attr("value",item.id);
                    opItem.appendTo($(ele));
                })
            }
        });
    }
    //校验表单数据
    function validate_add_form() {
        var name = $("#stu_name_id").val();
        //正则表达式，匹配6到16个英文或数字或2到5个汉字
        var nameReg = /(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})/;
        if (!nameReg.test(name)){
            show_validate_info("#stu_name_id","error","姓名必须是6到16个英文或数字或2到5个汉字!");
            // alert("姓名必须是6到16个英文或数字或2到5个汉字!");
            return false;
        }else {
            show_validate_info("#stu_name_id","success","");
        }

        var email = $("#stu_email_id").val();
        var emailReg = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
        if (!emailReg.test(email)){
            // alert("邮箱格式不正确");
            show_validate_info("#stu_email_id","error","邮箱格式不正确!");
            return false;
        }else {
            show_validate_info("#stu_email_id","success","");
        }
        return true;
    }
    function show_validate_info(id,status,msg) {
        $(id).parent().removeClass("has-success has-error");
        $(id).next("span").text("");
        if("success"==status){
            $(id).parent().addClass("has-success");
            $(id).next("span").text(msg);
        }else if("error"==status){
            $(id).parent().addClass("has-error");
            $(id).next("span").text(msg);
        }
    }
    //检查用户名是否可用
    $("#stu_name_id").change(function () {
        var name = this.value;
        $.ajax({
           url:"${APP_PATH}/checkName",
           type:"POST",
           data:"name="+name,
            success:function (result) {
               console.log(result)
               //状态码为200表示用户名可用
                if (result.stutasCode==200){
                    show_validate_info("#stu_name_id","success","用户名可用");
                    $("#stu_add_saveBtn").attr("ajax-validate", "success");

                }else {
                    show_validate_info("#stu_name_id","error","用户名已存在");
                    $("#stu_add_saveBtn").attr("ajax-validate", "error");
                }
            }
        });
    });
    //新增模态框的保存操作
    $("#stu_add_saveBtn").click(function () {
        if (!validate_add_form()){
            return false;
        }
        //判断用户名的后台校验是否成功
        if($("#stu_add_saveBtn").attr("ajax-validate")=="error"){
            return false;
        }
        //发送ajax请求保存信息
        $.ajax({
            url:"${APP_PATH}/stu",
            type:"POST",
            data:$("#stuAddModel form").serialize(),
            success:function (result) {
                console.log(result.msg);
                //保存成功后关闭模态框
                $("#stuAddModel").modal('hide');
                //跳转到最后一页
                toPage(9999);
            }
        });
    });
    //编辑按钮绑定点击事件
    //1）、可以在创建按钮的时候绑定。    2）、绑定点击.live()
    //jquery新版没有live，使用on进行替代
    $(document).on("click",".stu_edit_btn",function () {
        //将专业信息设置到下拉框
        getMajor("#stuUpdateModel select");
        //将学生信息设置到模态框
        getStu($(this).attr("edit_id"));
        //将学生id传递到编辑模态框的更新按钮上
        $("#stu_update_btn").attr("edit_id",$(this).attr("edit_id"));
        $("#stuUpdateModel").modal({
            backdrop:"static"
        });
    });
    function getStu(id) {
        $.ajax({
            url:"${APP_PATH}/stu/"+id,
            type:"GET",
            success:function (result) {
                // console.log(result);
                var stu = result.extend.stu;
                $("#stu_edit_name").text(stu.name);
                $("#stu_update_email").val(stu.email);
                $("#stu_update_tel").val(stu.tel);
                $("#stuUpdateModel input[name=gender]").val([stu.gender]);
                $("#stuUpdateModel select").val([stu.mId]);
            }
        });
    }
    //更新按钮
    $("#stu_update_btn").click(function () {
        //检验数据
        var email = $("#stu_update_email").val();
        var emailReg = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
        if (!emailReg.test(email)){
            show_validate_info("#stu_update_email","error","邮箱格式不正确!");
            return false;
        }
        $.ajax({
            url:"${APP_PATH}/stu/"+$(this).attr("edit_id"),
            type:"PUT",
            data:$("#stuUpdateModel form").serialize(),
            success:function (result) {
                console.log(result);
                $("#stuUpdateModel").modal('hide');
                toPage(currentPage);
            }
        });
    });
    $(document).on("click",".stu_del_btn",function () {
        var name = $(this).parents("tr").find("td:eq(1)").text();
        var id = $(this).attr("del_id");

        $.ajax({
            url:"${APP_PATH}/stu/"+id,
            type:"DELETE",
            success:function (result) {
                toPage(currentPage);
            }
        });
    });
    //全选点击事件
    $("#check_all").click(function () {
        //使用prop修改和读取dom原生的属性，attr用来修改读取自定义属性
        // $(this).prop("checked");//是否选中
        // alert($(this).prop("checked"));
        $(".check-item").prop("checked",$(this).prop("checked"));
    });
    //全选/全不选
    $(document).on("click",".check-item",function () {
       //判断当前选中的个数是否为总个数
       var flag = $(".check-item:checked").length==$(".check-item").length;
       $("#check_all").prop("checked",flag);
    });

    //批量删除
    $("#stu_delAll_btn").click(function () {
        var names = "";
        var del_ids = "";
        $.each($(".check-item:checked"),function () {
            names += $(this).parents("tr").find("td:eq(2)").text()+",";
            del_ids += $(this).parents("tr").find("td:eq(1)").text()+"-";
        });
        names = names.substring(0, names.length - 1);
        del_ids = del_ids.substring(0, del_ids.length - 1);
        if (confirm("确认删除【"+names+"】吗?")){
            //发送ajax请求批量删除
            $.ajax({
                url:"${APP_PATH}/stu/"+del_ids,
                type:"DELETE",
                success:function (result) {
                    toPage(currentPage);
                }
            });
        }

    });
</script>
</body>
</html>
