package com.jxut.courseware.springboot.mapper;

import com.jxut.courseware.springboot.entity.User;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface UserMapper {
    // 登录验证
    boolean checkUser(@Param("username") String username, @Param("password") String password);

    // 新增用户
    void addUser(User user);

    // 删除用户
    void deleteUser(int id);

    // 更新用户
    boolean updateUser(User user);

    // 根据ID查询用户
    User findUserById(int id);

    // 根据用户名查询用户
    User findUserByUsername(String username);

    /* 分页显示相关 */
    // 查询所有用户数量
    int countAllUsers();

    // 分页查询用户
    List<User> queryUsersByPage(int start, int pageSize);

    // 根据真名模糊查询用户数量
    int countUsersByRealname(@Param("realname") String realname);

    // 根据真名模糊分页查询用户
    List<User> queryUsersByRealnameWithPage(@Param("realname") String realname, @Param("start") int start, @Param("pageSize") int pageSize);
}
