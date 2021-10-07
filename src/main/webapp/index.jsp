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
    <script src="${APP_PATH}/static/js/jquery-2.2.4.js"></script>
    <script src="${APP_PATH}/static/bootstrap-3.4.1-dist/js/bootstrap.min.js"></script>

</head>
<body>

<%--员工修改模态框--%>

<!-- Modal -->
<div class="modal fade" id="empUpdateModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel1">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel1">修改一下吧</h4>
            </div>
            <div class="modal-body">
                <%--模态框内容--%>
                <form class="form-horizontal">
                    <%--名字--%>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">姓名</label>
                        <div class="col-sm-10">
                            <p class="form-control-static" id="emp_update_static"></p>
                        </div>
                    </div>
                    <%--性别--%>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">性别</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="genderUpdate1" value="M" checked="checked"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="genderUpdate2" value="F"> 女
                            </label>

                        </div>
                    </div>
                    <%--email--%>
                    <div class="form-group">
                        <label for="inputUpdateEmail" class="col-sm-2 control-label">Email</label>
                        <div class="col-sm-10">
                            <input type="email" name="email" class="form-control" id="inputUpdateEmail" placeholder="Email">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <%--deptName--%>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">部门</label>
                        <div class="col-sm-10  col-md-3">
                            <select class="form-control" name="dId" id="dId_UpdateList">

                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                <button type="button" class="btn btn-primary" id="emp_Update">更新</button>
            </div>
        </div>
    </div>
</div>

<%--员工添加模态框--%>

<!-- Modal -->
<div class="modal fade" id="empAddModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">添加一个吧</h4>
            </div>
            <div class="modal-body">
                <%--模态框内容--%>
                <form class="form-horizontal">
                    <%--名字--%>
                    <div class="form-group">
                        <label for="inputEmpName" class="col-sm-2 control-label">姓名</label>
                        <div class="col-sm-10">
                            <input type="text" name="empName" class="form-control" id="inputEmpName" placeholder="myName">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <%--性别--%>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">性别</label>
                        <div class="col-sm-10">
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender1" value="M" checked="checked"> 男
                            </label>
                            <label class="radio-inline">
                                <input type="radio" name="gender" id="gender2" value="F"> 女
                            </label>

                        </div>
                    </div>
                    <%--email--%>
                    <div class="form-group">
                        <label for="inputEmail" class="col-sm-2 control-label">Email</label>
                        <div class="col-sm-10">
                            <input type="email" name="email" class="form-control" id="inputEmail" placeholder="Email">
                            <span class="help-block"></span>
                        </div>
                    </div>
                    <%--deptName--%>
                    <div class="form-group">
                        <label class="col-sm-2 control-label">部门</label>
                        <div class="col-sm-10  col-md-3">
                            <select class="form-control" name="dId" id="dId_list">

                            </select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">退出</button>
                <button type="button" class="btn btn-primary" id="emp_save">保存</button>
            </div>
        </div>
    </div>
</div>

<div class="container">
    <%--标题--%>
    <div class="row">
        <div class="col-md-12"><h1>SSM-CRUD</h1></div>
    </div>
    <%--新增删除--%>
    <div class="row">
        <div class="col-md-2 col-md-offset-10">
            <button type="button" class="btn btn-primary" id="emp_add_modal_btn" data-toggle="modal">
                <span class="glyphicon glyphicon-plus" aria-hidden="true"></span>新增
            </button>
            <button type="button" class="btn btn-danger" id="delete_all_btn">
                <span class="glyphicon glyphicon-trash" aria-hidden="true"></span>删除
            </button>
        </div>
    </div>
    <%--表格数据--%>
    <div class="row">
        <div class="col-md-12 ">
            <table class="table table-striped table-bordered" id="emps_table">
                <thead>
                <tr>
                    <th>
                        <input type="checkbox" id="checkAll"/>
                    </th>
                    <th>#</th>
                    <th>empName</th>
                    <th>gender</th>
                    <th>email</th>
                    <th>department</th>
                    <th>action</th>
                </tr>
                </thead>
                <tbody></tbody>
            </table>
        </div>
    </div>
    <%--分页信息--%>
    <div class="row">
        <%--分页文字信息--%>
        <div class="col-md-6" id="page_info">

        </div>

        <%--分页条--%>
        <div class="col-md-6">
            <nav aria-label="Page navigation" id="page_nav">

            </nav>
        </div>

    </div>
</div>
</body>
<script type="text/javascript">
    var totalRecord;
    var thisPageNum;
    // 页面加载完成后，发送Ajax要数据
    $(function (){
        getMsg(1)
    });
    // 表数据
    function build_emps_table(result) {
        $("#emps_table tbody").empty();
        var emps = result.extend.page.list;
        $.each(emps,function (index,item) {
            var checkBoxTd = $("<td></td>").append($("<input type='checkbox' class='check_item'/>"));
            var empId = $("<td></td>").append(item.empId);
            var empName = $("<td></td>").append(item.empName);
            var email = $("<td></td>").append(item.email);
            var gender = $("<td></td>").append(item.gender == "M"?"男":"女");
            var deptName = $("<td></td>").append(item.department.deptName);

            var editBtn = $("<butten></butten>").addClass("btn btn-info btn-sm edit_btn").attr("empID",item.empId)
                .append($("<spen></spen>").addClass("glyphicon glyphicon-pencil").attr("aria-hidden","true")).append("编辑");

            var delBtn = $("<butten></butten>").addClass("btn btn-danger btn-sm del_btn").attr("empID",item.empId)
                .append($("<spen></spen>").addClass("glyphicon glyphicon-trash").attr("aria-hidden","true")).append("删除");
            var btns = $("<td></td>").append(editBtn).append(" ").append(delBtn);
                $("<tr></tr>").append(checkBoxTd)
                .append(empId)
                .append(empName)
                .append(gender)
                .append(email)
                .append(deptName)
                .append(btns)
            .appendTo("#emps_table tbody");
        });
    };
    /*分页信息*/
    function build_page_info(result){
        $("#page_info").empty();
        var emps = result.extend.page;
        totalRecord = emps.total;
        thisPageNum = emps.pageNum;
        $("#page_info").append("当前页码：第" + emps.pageNum + "页，总页码数：" + emps.pages + "页，总记录数：" + emps.total +"条。")
    }
    /*分页条*/
    function build_page_nav(result) {
        $("#page_nav").empty();
        var emps = result.extend.page;
        var firstLi = $("<li></li>").append($("<a></a>").attr("href","#").append("首页"))
            .click(function (){
            getMsg(1);
        });
        var prev = emps.pageNum=="1"?"":$("<li></li>").append($("<a></a>").attr("aria-label","Previous").append($("<span></span>").attr("aria-hidden","true").append("&laquo;")))
            .click(function (){
                getMsg(emps.pageNum-1);
            });

        var next = emps.pageNum==emps.pages?"":$("<li></li>").append($("<a></a>").attr("aria-label","Next").append($("<span></span>").attr("aria-hidden","true").append("&raquo;")))
            .click(function (){
                getMsg(emps.pageNum+1);
            });
        var lastLi = $("<li></li>").append($("<a></a>").attr("href","#").append("末页"))
            .click(function (){
                getMsg(emps.pages);
            });

        var ul = $("<ul></ul>").attr("class","pagination")
            .append(firstLi)
            .append(prev);

        $.each(emps.navigatepageNums,function (index,item){
            if(item == emps.pageNum){
                $("<li></li>").attr("class","active").append($("<a></a>").append(item)).appendTo(ul);
            }else {
                $("<li></li>").append($("<a></a>").append(item))
                    .click(function (){
                        getMsg(item);
                    }).appendTo(ul);
            }
        });

        ul.append(next).append(lastLi);
        ul.appendTo("#page_nav");
    };
    /*获取指定页数据*/
    function getMsg(a){
        $.ajax({
            url:"${APP_PATH}/emps",
            data:"pn=" + a,
            type:"get",
            success:function (result){
                build_emps_table(result);
                build_page_info(result);
                build_page_nav(result);
            }
        });
    };

    /*模态框绑定单击事件*/
    $("#emp_add_modal_btn").click(function (){
        getDepts($("#dId_list"));
        $("#empAddModal").modal({
            backdrop:"static"
        });
    });


    //校验用户名是否可用
    $("#inputEmpName").change(function (){
        var name = $(this).val();
        console.log(name);
        $.ajax({
            url:"${APP_PATH}/checkUserName",
            data:"empName=" + name,
            type:"post",
            success:function (result){
                if (result.code==100){
                    show_validate_msg($("#inputEmpName"),"success","用户名可用");
                    $("#emp_save").attr("nameIsOk","success");
                }else {
                    show_validate_msg($("#inputEmpName"),"error",result.extend.va_msg);
                    $("#emp_save").attr("nameIsOk","error");
                }
            }
        })
    });

    // 绑定提交
    $("#emp_save").click(function (){
        // 前端校验
        if(!validate_add_form()){
            return false;
        }

        //判断用户名校验是否通过
        if($(this).attr("nameIsOk")!="success"){
            show_validate_msg($("#inputEmpName"),"error","用户名被占用");
            return false;
        }

        // 发送请求
        $.ajax({
            url:"${APP_PATH}/emps",
            type:"post",
            data:$("#empAddModal form").serialize(),
            success:function (result){
                //判断添加是否通过
                if(result.code == 100){
                    //重置用户名校验状态
                    $("#emp_save").attr("nameIsOk","error");
                    // 关闭模态框
                    $('#empAddModal').modal('hide');
                    // 到最后一页
                    getMsg(totalRecord+1);
                    // 显示成功信息
                    alert(result.msg);
                }else {
                    //显示失败信息
                    if(undefined !=result.extend.errorMap.email){
                        show_validate_msg( $("#inputEmail"),"error",result.extend.errorMap.email);
                    }
                    if(undefined !=result.extend.errorMap.empName){
                        show_validate_msg($("#inputEmpName"),"error",result.extend.errorMap.empName);
                        $("#emp_save").attr("nameIsOk","error");
                    }
                }

            }
        });

    });

    // 绑定修改模态框的修改按钮
    $("#emp_Update").click(function (){
        // 校验邮箱
        var email = $("#inputUpdateEmail").val();
        var ipt_email = $("#inputUpdateEmail");
        var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
        if (!regEmail.test(email)){
            show_validate_msg(ipt_email,"error","邮箱格式不正确，请重新输入！");
            return false;
        }else {
            show_validate_msg(ipt_email,"success","");
        };

        // 发送请求保存数据
        $.ajax({
            url:"${APP_PATH}/emps/" + $(this).attr("empID"),
            type:"put",
            data:$("#empUpdateModal form").serialize(),
            success:function (result){
                // console.log(result.msg);
                //关闭对话框
                $("#empUpdateModal").modal("hide");
                //刷新当前页面
                getMsg(thisPageNum);
            }
        });

    });

    //显示校验信息
    function show_validate_msg(ele,status,msg){
        $(ele).parent().removeClass("has-error has-success");
        ele.next("span").text("");
        if ("success" == status){
            ele.parent().removeClass("has-success");
            ele.next("span").text(msg);
        }else if("error" == status){
            ele.parent().addClass("has-error");
            ele.next("span").text(msg);
        }
    }
    // 校验添加数据
    function validate_add_form(){
        var ipt_name = $("#inputEmpName");
        var empName = ipt_name.val();
        var regName = /(^[a-zA-Z0-9_-]{3,16}$)|(^[\u2E80-\u9FFF]{2,5}$)/;
        if(!regName.test(empName)){
            show_validate_msg(ipt_name,"error","姓名格式不正确，请重新输入！");
            return false;
        }else {
            show_validate_msg(ipt_name,"success","");
        };
        var email = $("#inputEmail").val();
        var ipt_email = $("#inputEmail");
        var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
        if (!regEmail.test(email)){
            show_validate_msg(ipt_email,"error","邮箱格式不正确，请重新输入！");
            return false;
        }else {
            show_validate_msg(ipt_email,"success","");
        };
        return true;
    }

    // 查出所有部门信息，并显示在下拉列表
    function getDepts(dept_list){
        dept_list.empty();
        $.ajax({
            url: "${APP_PATH}/deptInfo",
            type:"get",
            success:function (result){
                var deptInfo = result.extend.deptInfo;

                $.each(deptInfo,function (index,item){
                    dept_list.append($("<option></option>").append(item.deptName).attr("value",item.deptId));
                });
            }
        });
    }
    //为修改按钮绑定单击事件
    $(document).on("click",".edit_btn",function (){
        getDepts($("#dId_UpdateList"));
        getEmp($(this).attr("empID"));
        $("#emp_Update").attr("empID",$(this).attr("empID"));
        $("#empUpdateModal").modal({
            backdrop:"static"
        });
    });
    //为删除按钮绑定单击事件
    $(document).on("click",".del_btn",function (){
        var empName = $(this).parents("tr").find("td:eq(2)").text();
        if(confirm("确认删除【" + empName + "】吗？")){
            $.ajax({
                url:"${APP_PATH}/emps/" + $(this).attr("empID"),
                type:"delete",
                success:function (result){
                    alert(result.msg);
                    getMsg(thisPageNum);
                }
            })
        }
    });

    //全选全不选
    $("#checkAll").click(function (){
        $(".check_item").prop("checked",$(this).prop("checked"));
    });

    //绑定列表内选择框
    $(document).on("click",".check_item",function (){
        var flag = $(".check_item:checked").length==$(".check_item").length;

        $("#checkAll").prop("checked",flag);

    });

    //点击删除全部按钮绑定单击事件
    $("#delete_all_btn").click(function (){
        var empNamps = "";
        var del_strID = "";
        $.each($(".check_item:checked"),function (){
            empNamps +=$(this).parents("tr").find("td:eq(2)").text()+",";
            del_strID +=$(this).parents("tr").find("td:eq(1)").text()+"-";
        });
        del_strID = del_strID.substring(0,del_strID.length-1);
        empNamps = empNamps.substring(0,empNamps.length-1);
        if(confirm("确认删除【" + empNamps + "】吗？")){
            $.ajax({
                url:"${APP_PATH}/emps/" + del_strID,
                type:"delete",
                success:function (result){
                    alert(result.msg);
                    getMsg(thisPageNum);
                }
            })
        }
    });

    function getEmp(id){
        $.ajax({
            url:"${APP_PATH}/emps/" + id,
            type:"get",
            success:function (result){
                var emp = result.extend.emp;
                console.log(emp);
                $("#emp_update_static").text(emp.empName);
                $("#inputUpdateEmail").val(emp.email);
                $("#empUpdateModal input[name=gender]").val([emp.gender]);
                $("#empUpdateModal select").val([emp.dId]);
            }
        })
    }



</script>
</html>
