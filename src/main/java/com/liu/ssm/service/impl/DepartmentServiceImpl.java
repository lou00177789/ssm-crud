package com.liu.ssm.service.impl;

import com.liu.ssm.bean.Department;
import com.liu.ssm.dao.DepartmentMapper;
import com.liu.ssm.service.DepartmentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author liuliang
 * @create2021-10-2021/10/4-14:57
 * @email 2640336916@qq.com
 * @explain
 */
@Service
public class DepartmentServiceImpl implements DepartmentService {
    @Autowired
    DepartmentMapper departmentMapper;

    @Override
    public List<Department> getDeptInfo() {
        return departmentMapper.selectByExample(null);
    }
}
