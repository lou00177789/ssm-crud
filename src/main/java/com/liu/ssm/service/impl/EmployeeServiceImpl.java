package com.liu.ssm.service.impl;

import com.liu.ssm.bean.Employee;
import com.liu.ssm.bean.EmployeeExample;
import com.liu.ssm.dao.EmployeeMapper;
import com.liu.ssm.service.EmployeeService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author liuliang
 * @create2021-10-2021/10/1-10:31
 * @email 2640336916@qq.com
 * @explain
 */
@Service
public class EmployeeServiceImpl implements EmployeeService {
    @Autowired
    EmployeeMapper employeeMapper;


    @Override
    public List<Employee> getAll() {
        return employeeMapper.selectByExampleWithDept(null);
    }

    @Override
    public void saveEmp(Employee employee) {
        employeeMapper.insertSelective(employee);
    }

    @Override
    public Boolean checkUserName(String empName) {
        EmployeeExample emp = new EmployeeExample();
        EmployeeExample.Criteria criteria = emp.createCriteria();
        criteria.andEmpNameEqualTo(empName);
        long count = employeeMapper.countByExample(emp);
        return count == 0;
    }

    @Override
    public Employee getEmp(Integer id) {
        return employeeMapper.selectByPrimaryKey(id);
    }

    @Override
    public void updateEmp(Employee emp) {
        employeeMapper.updateByPrimaryKeySelective(emp);
    }

    @Override
    public void deleteAnEmpById(Integer id) {
        employeeMapper.deleteByPrimaryKey(id);
    }

    @Override
    public void deleteBatch(List<Integer> ids) {
        EmployeeExample example = new EmployeeExample();
        EmployeeExample.Criteria criteria = example.createCriteria();
        criteria.andEmpIdIn(ids);
        employeeMapper.deleteByExample(example);
    }
}
