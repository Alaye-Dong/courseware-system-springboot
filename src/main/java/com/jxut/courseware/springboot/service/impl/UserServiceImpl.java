package com.jxut.courseware.springboot.service.impl;

import com.jxut.courseware.springboot.entity.User;
import com.jxut.courseware.springboot.mapper.UserMapper;
import com.jxut.courseware.springboot.service.UserService;
import com.jxut.courseware.springboot.util.PageBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UserServiceImpl implements UserService {
    @Autowired
    private UserMapper userMapper;

    @Override
    public boolean login(String username, String password) {
        return userMapper.checkUser(username, password);
    }


    @Override
    public void addUser(User user) {
        userMapper.addUser(user);
    }

    @Override
    public void deleteUser(int id) {
        userMapper.deleteUser(id);
    }

    @Override
    public boolean updateUser(User user) {
        return userMapper.updateUser(user);
    }

    @Override
    public User getUserById(int id) {
        return userMapper.queryUserById(id);
    }

    @Override
    public List<User> getUsersByRealname(String realname) {
        return userMapper.queryUsersByRealname(realname);
    }

    @Override
    public int countAllUsers() {
        return userMapper.countAllUsers();
    }

    @Override
    public PageBean<User> getUsersByPage(int pageNum, int pageSize) {
        int totalUsers = countAllUsers();
        int start = (pageNum - 1) * pageSize;
        List<User> users = userMapper.queryUsersByPage(start, pageSize);
        return new PageBean<>(pageNum, pageSize, totalUsers, users);
    }

    @Override
    public int countUsersByRealname(String realname) {
        return userMapper.countUsersByRealname(realname);
    }

    @Override
    public PageBean<User> getUsersByRealnameWithPage(String realname, int pageNum, int pageSize) {
        int totalUsers = countUsersByRealname(realname);
        int start = (pageNum - 1) * pageSize;
        List<User> users = userMapper.queryUsersByRealnameWithPage(realname, start, pageSize);
        return new PageBean<>(pageNum, pageSize, totalUsers, users);
    }

    @Override
    public User findByUsername(String username) {
        return userMapper.findByUsername(username);
    }
}
