package com.liu.ssm.controller;

import com.liu.ssm.bean.Department;
import com.liu.ssm.bean.Msg;
import com.liu.ssm.service.DepartmentService;
import com.liu.ssm.service.impl.DepartmentServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * @author liuliang
 * @create2021-10-2021/10/4-14:56
 * @email 2640336916@qq.com
 * @explain
 */
@Controller
public class DepartmentController {
    @Autowired
    DepartmentService departmentService;

    @RequestMapping("/deptInfo")
    @ResponseBody
    public Msg getDeptInfo(){
        List<Department> deptInfo = departmentService.getDeptInfo();
        return Msg.success().add("deptInfo",deptInfo);
    }
}
