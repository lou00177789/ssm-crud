<%--
  Created by IntelliJ IDEA.
  User: 123
  Date: 2021/10/1
  Time: 10:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%@ page isELIgnored="false" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>员工列表</title>

    <%
        pageContext.setAttribute("APP_PATH",request.getContextPath());
    %>
    <!-- Bootstrap -->
    <link rel="stylesheet" href="${APP_PATH}/static/bootstrap-3.4.1-dist/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">

    <script src="${APP_PATH}/static/js/jquery-1.7.2.min.js"></script>
    <script src="${APP_PATH}/static/bootstrap-3.4.1-dist/js/bootstrap.min.js"></script>

</head>
<body>
    <div class="container">
        <%--标题--%>
        <div class="row">
            <div class="col-md-12"><h1>SSM-CRUD</h1></div>
        </div>
        <%--新增删除--%>
        <div class="row">
            <div class="col-md-2 col-md-offset-10">
                <button type="button" class="btn btn-primary">新增</button>
                <button type="button" class="btn btn-danger">删除</button>
            </div>

        </div>
        <%--表格数据--%>
        <div class="row">
            <div class="col-md-12 ">
                <table class="table table-striped table-bordered" >
                    <tr>
                        <th>#</th>
                        <th>empName</th>
                        <th>gender</th>
                        <th>email</th>
                        <th>department</th>
                        <th>action</th>
                    </tr>
                    <c:forEach items="${page.list}" var="emp">
                        <tr>
                            <td>${emp.empId}</td>
                            <td>${emp.empName}</td>

                            <td>${emo.gender == "M"?"男":"女"}</td>
                            <td>${emp.email}</td>
                            <td>${emp.department.deptName}</td>
                            <td>
                                <butten class="btn btn-info btn-xs">
                                    <span class="glyphicon glyphicon-pencil" aria-hidden="true"></span> 修改
                                </butten>
                                <butten class="btn btn-danger btn-xs">
                                    <span class="glyphicon glyphicon-trash" aria-hidden="true"></span> 删除
                                </butten>
                            </td>
                        </tr>
                    </c:forEach>
                </table>
            </div>
        </div>
        <%--分页信息--%>
        <div class="row">
            <%--分页文字信息--%>
            <div class="col-md-6">
                当前页码：第${page.pageNum}页，总页码数：${page.pages}页，总记录数：${page.total}条。
            </div>
             <%--分页条--%>
            <div class="col-md-6">
                <nav aria-label="Page navigation">
                    <ul class="pagination">
                        <li><a href="${APP_PATH}/emps?pn=1">首页</a></li>
                        <c:if test="${page.hasPreviousPage}">
                            <li>
                                <a href="${APP_PATH}/emps?pn=${page.pageNum-1}" aria-label="Previous">
                                    <span aria-hidden="true">&laquo;</span>
                                </a>
                            </li>
                        </c:if>
                        <c:forEach items="${page.navigatepageNums}" var="num">
                            <c:if test="${num == page.pageNum}">
                                <li class="active"><a href="#">${num}</a></li>
                            </c:if>
                            <c:if test="${num != page.pageNum}">
                                <li><a href="${APP_PATH}/emps?pn=${num}">${num}</a></li>
                            </c:if>

                        </c:forEach>
                        <c:if test="${page.hasNextPage}">
                            <li>
                                <a href="${APP_PATH}/emps?pn=${page.pageNum+1}" aria-label="Next">
                                    <span aria-hidden="true">&raquo;</span>
                                </a>
                            </li>
                        </c:if>
                        <li><a href="${APP_PATH}/emps?pn=${page.pages}">末页</a></li>
                    </ul>
                </nav>
            </div>

        </div>
    </div>
</body>
</html>
