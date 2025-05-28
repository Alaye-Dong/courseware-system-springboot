package com.jxut.courseware.springboot.controller;

import com.jxut.courseware.springboot.service.UserService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AuthController {
    @Autowired
    private UserService userService;

    @RequestMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate(); // 清除Session
        return "login";
    }
}

