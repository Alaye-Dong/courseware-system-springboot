package com.jxut.courseware.springboot;

import com.jxut.courseware.springboot.mapper.UserMapper;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class CoursewareSystemSpringbootApplicationTests {
    @Autowired
    private UserMapper userMapper;

    @Test
    void testDatabaseConnection() {
        // 调用 mapper 方法测试数据库连接
        int count = userMapper.countAllUsers();
        System.out.println("Total users: " + count);
    }
    @Test
    void contextLoads() {
    }

}
