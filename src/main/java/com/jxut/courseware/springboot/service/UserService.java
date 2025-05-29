package com.jxut.courseware.springboot.service;

import com.jxut.courseware.springboot.entity.User;
import com.jxut.courseware.springboot.util.PageBean;

public interface UserService {
    boolean login(String username, String password);

    void addUser(User user);

    void deleteUser(int id);

    boolean updateUser(User user);

    User findUserById(int id);

    int countAllUsers();

    PageBean<User> getUsersByPage(int pageNum, int pageSize);

    int countUsersByRealname(String realname);

    PageBean<User> getUsersByRealnameWithPage(String realname, int pageNum, int pageSize);

    User findByUsername(String username);
}
