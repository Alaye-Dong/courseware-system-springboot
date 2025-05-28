package com.jxut.courseware.springboot.controller;

import com.jxut.courseware.springboot.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AuthController {
    @Autowired
    private UserService userService;

    @RequestMapping("/")
    public String Welcome(
            Model model) {
        return "login";
    }
}

