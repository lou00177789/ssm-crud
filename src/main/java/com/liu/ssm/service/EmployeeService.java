package com.liu.ssm.service;

import com.liu.ssm.bean.Employee;
import java.util.List;

/**
 * @author liuliang
 * @create2021-10-2021/10/1-10:22
 * @email 2640336916@qq.com
 * @explain
 */

public interface EmployeeService {
    public List<Employee> getAll();


    void saveEmp(Employee employee);
    //检验用户名是否存在
    Boolean checkUserName(String empName);

    Employee getEmp(Integer id);

    void updateEmp(Employee emp);

    void deleteAnEmpById(Integer id);

    void deleteBatch(List<Integer> ids);
}
