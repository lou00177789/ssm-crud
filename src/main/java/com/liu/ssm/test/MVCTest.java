package com.liu.ssm.test;

import com.github.pagehelper.PageInfo;
import com.liu.ssm.bean.Employee;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.ResultActions;
import org.springframework.test.web.servlet.request.MockHttpServletRequestBuilder;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import java.util.Arrays;
import java.util.List;

/**
 * @author liuliang
 * @create2021-10-2021/10/1-11:18
 * @email 2640336916@qq.com
 * @explain
 */

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations={"classpath:applicationContext.xml",
        "classpath:dispatcherServlet-servlet.xml"})
public class MVCTest {
    @Autowired
    WebApplicationContext context;

    MockMvc mockMvc;


    @Before
    public void initMockMvc(){
        mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
    }



    @Test
    public void testPage() throws Exception {
        MockHttpServletRequestBuilder requestBuilder = MockMvcRequestBuilders.get("/emps");

        MvcResult mvcResult = mockMvc.perform(MockMvcRequestBuilders.get("/emps").param("pn", "1")).andReturn();

        MockHttpServletRequest request = mvcResult.getRequest();
        PageInfo page = (PageInfo)request.getAttribute("page");


        System.out.println("当前页码" + page.getPageNum());
        System.out.println("总页码" + page.getPages());
        System.out.println("总记录数" + page.getTotal());

        int[] nums = page.getNavigatepageNums();
        System.out.println("需要连续显示的页码" + Arrays.toString(nums));

        List<Employee> list = page.getList();
        for (Employee emp:list){
            System.out.println(emp);
        }


    }



}
