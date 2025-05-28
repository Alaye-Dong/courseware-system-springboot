package com.jxut.courseware.springboot.service;

import com.jxut.courseware.springboot.entity.User;
import com.jxut.courseware.springboot.util.PageBean;

import java.util.List;

public interface UserService {
    boolean login(String username, String password);

    void addUser(User user);

    void deleteUser(int id);

    boolean updateUser(User user);

    User getUserById(int id);

    List<User> getUsersByRealname(String realname);

    int countAllUsers();

    PageBean<User> getUsersByPage(int pageNum, int pageSize);

    int countUsersByRealname(String realname);

    PageBean<User> getUsersByRealnameWithPage(String realname, int pageNum, int pageSize);

    User findByUsername(String username);
}
