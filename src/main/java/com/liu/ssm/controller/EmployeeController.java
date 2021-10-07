package com.liu.ssm.controller;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.liu.ssm.bean.Employee;
import com.liu.ssm.bean.Msg;
import com.liu.ssm.service.EmployeeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

/**
 * @author liuliang
 * @create2021-10-2021/10/1-10:16
 * @email 2640336916@qq.com
 * @explain 员工处理
 */
@Controller
public class EmployeeController {
    @Autowired
    EmployeeService employeeService;


    @RequestMapping(value = "/emps/{ids}",method = RequestMethod.DELETE)
    @ResponseBody
    public Msg deleteEmpById(@PathVariable("ids") String ids){

        if (ids.contains("-")){
            String[] strIds = ids.split("-");
            List<Integer> listIds = new ArrayList<>();
            for (String str:strIds){
                listIds.add(Integer.parseInt(str));
            }
            employeeService.deleteBatch(listIds);
            System.out.println(listIds);
        }else {
            employeeService.deleteAnEmpById(Integer.getInteger(ids));
        }

        return Msg.success();
    }

    @RequestMapping(value = "/emps/{empId}",method = RequestMethod.PUT)
    @ResponseBody
    public Msg updateEmp(Employee emp){
        System.out.println(emp);
        employeeService.updateEmp(emp);
        return Msg.success();
    }

    /**
     * 分页查询员工数据
     * @return
     */
    @RequestMapping("/empsOld")
    public String getEmps(@RequestParam(value = "pn",defaultValue = "1") Integer pn,Model model){
        PageHelper.startPage(pn,5);
        List<Employee> emps = employeeService.getAll();
        PageInfo page = new PageInfo(emps,5);
        model.addAttribute("page",page);
        return "list";
    }



    @RequestMapping("/emps")
    @ResponseBody
    public Msg getEmpsForJson(@RequestParam(value = "pn",defaultValue = "1") Integer pn){
        PageHelper.startPage(pn,8);
        List<Employee> emps = employeeService.getAll();
        PageInfo page = new PageInfo(emps,5);
        return Msg.success().add("page",page);
    }

    @RequestMapping(value = "/emps",method = RequestMethod.POST)
    @ResponseBody
    public Msg addEmp(@Valid Employee employee,BindingResult result){
        if (result.hasErrors()){
            HashMap<String, Object> errorMap = new HashMap<>();
            List<FieldError> errors = result.getFieldErrors();
            for (FieldError error : errors) {
                System.out.println(error.getField());
                System.out.println(error.getDefaultMessage());
                errorMap.put(error.getField(),error.getDefaultMessage());
            }
            return Msg.fail().add("errorMap",errorMap);
        }else {
            employeeService.saveEmp(employee);
            return Msg.success();
        }

    }

    /*查询单个用户信息*/
    @RequestMapping(value = "/emps/{id}",method = RequestMethod.GET)
    @ResponseBody
    public Msg getEmp(@PathVariable("id") Integer id){
        Employee emp = employeeService.getEmp(id);
        return Msg.success().add("emp",emp);
    }


    /*检查用户名是否可用*/
    @RequestMapping(value = "/checkUserName")
    @ResponseBody
    public Msg checkUserName(@RequestParam("empName") String empName){

        String regx = "(^[a-zA-Z0-9_-]{3,16}$)|(^[\\u2E80-\\u9FFF]{2,5}$)";
        if(!empName.matches(regx)){
            return Msg.fail().add("va_msg","后台提示，用户名格式不对");
        }
        Boolean isExist = employeeService.checkUserName(empName);

        if (isExist) {
            return Msg.success();
        }
        return Msg.fail().add("va_msg","后台提示，用户名不可用");
    }
}
