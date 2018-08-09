<%--
  Created by IntelliJ IDEA.
  User: 11517
  Date: 2018/8/7
  Time: 21:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
            <button class="btn btn-info btn-lg"><span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增</button>
            <button class="btn btn-danger btn-lg"><span class="glyphicon glyphicon-trash " aria-hidden="true"></span>删除</button>
        </div>
    </div>
    <%--第三行显示学生列表信息--%>
    <div class="row">
        <div class="col-md-12">
            <table class="table table-hover table-bordered table-striped">
                <tr>
                    <th>#</th>
                    <th>NAME</th>
                    <th>GENDER</th>
                    <th>EMAIL</th>
                    <th>TEL</th>
                    <th>MAJOR</th>
                    <th>OPTION</th>
                </tr>
                <c:forEach items="${pageInfo.list}" var="stu">
                <tr>
                    <td>${stu.id}</td>
                    <td>${stu.name}</td>
                    <td>${stu.gender=="M"?"男":"女"}</td>
                    <td>${stu.email}</td>
                    <td>${stu.tel}</td>
                    <td>${stu.major.mName}</td>
                    <td>
                        <button class="btn btn-info">
                            <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span>
                            编辑
                        </button>
                        <button class="btn btn-danger">
                            <span class="glyphicon glyphicon-trash " aria-hidden="true"></span>
                            删除
                        </button>
                    </td>
                </tr>
                </c:forEach>
            </table>
        </div>
    </div>
    <%--第四行显示分页信息--%>
    <div class="row">
        <%--显示分页文字信息--%>
        <div class="col-md-6">
            当前第${pageInfo.pageNum}页,总${pageInfo.pages}页,共${pageInfo.total}条记录
        </div>
        <%--显示分页条--%>
        <div class="col-md-6">
            <nav aria-label="Page navigation">
                <ul class="pagination">

                    <li><a href="${pageContext.request.contextPath}/stuList?pageNumber=1">第一页</a></li>
                    <c:if test="${pageInfo.hasPreviousPage}">
                        <li>
                            <a href="${pageContext.request.contextPath}/stuList?pageNumber=${pageInfo.pageNum-1}" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                            </a>
                        </li>
                    </c:if>

                    <c:forEach items="${pageInfo.navigatepageNums}" var="page_num">
                        <c:if test="${pageInfo.pageNum==page_num}">
                            <li class="active"><a href="${pageContext.request.contextPath}/stuList?pageNumber=${page_num}">${page_num}</a></li>
                        </c:if>
                        <c:if test="${pageInfo.pageNum != page_num}">
                            <li><a href="${pageContext.request.contextPath}/stuList?pageNumber=${page_num}">${page_num}</a></li>
                        </c:if>
                    </c:forEach>

                    <c:if test="${pageInfo.hasNextPage}">
                        <li>
                            <a href="${pageContext.request.contextPath}/stuList?pageNumber=${pageInfo.pageNum+1}" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                            </a>
                        </li>
                    </c:if>
                    <li><a href="${pageContext.request.contextPath}/stuList?pageNumber=${pageInfo.pages}">末页</a></li>
                </ul>
            </nav>
        </div>
    </div>
</div>
</body>
</html>
