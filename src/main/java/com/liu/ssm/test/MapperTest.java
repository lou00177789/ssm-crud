package com.liu.ssm.test;

import com.liu.ssm.bean.Department;
import com.liu.ssm.bean.Employee;
import com.liu.ssm.dao.DepartmentMapper;
import com.liu.ssm.dao.EmployeeMapper;
import com.liu.ssm.service.EmployeeService;
import com.liu.ssm.service.impl.EmployeeServiceImpl;
import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import java.util.List;
import java.util.UUID;

/**
 * @author liuliang
 * @create2021-09-2021/9/30-21:06
 * @email 2640336916@qq.com
 * @explain 测试dao层
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations={"classpath:applicationContext.xml"})
public class MapperTest {

    @Autowired
    DepartmentMapper departmentMapper;

    @Autowired
    EmployeeMapper employeeMapper;

    @Autowired
    SqlSession sqlSession;

    @Test
    public void Test(){
        System.out.println(sqlSession);

    }



    @Test
    public void departmentTest(){
        System.out.println(departmentMapper);
        departmentMapper.insertSelective(new Department(null,"开发部"));
        departmentMapper.insertSelective(new Department(null,"测试部"));

    }









    @Test
    public void employeeTest(){
        EmployeeMapper mapper = sqlSession.getMapper(EmployeeMapper.class);
        for (int i = 0;i < 1000;i++){
            String name = UUID.randomUUID().toString().substring(0, 5) + i;
            mapper.insertSelective(new Employee(null,name,"M",name + "@qq.com",1,null));
        }
    }

    @Test
    public void employeegetAll(){
        EmployeeMapper mapper = sqlSession.getMapper(EmployeeMapper.class);
        List<Employee> employees = mapper.selectByExampleWithDept(null);
        employees.forEach(System.out::println);
    }
    @Autowired
    EmployeeService employeeService;
    @Test
    public void test(){

        List<Employee> emps = employeeService.getAll();
        System.out.println(emps);
    }
}
