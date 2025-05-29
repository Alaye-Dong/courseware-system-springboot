package com.jxut.courseware.springboot.controller;

import com.jxut.courseware.springboot.entity.Subject;
import com.jxut.courseware.springboot.service.SubjectService;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping({"/subject", "/subjectList.html"})
public class SubjectController {

    @Autowired
    private SubjectService subjectService;

    // 模糊查询 & 列表展示
    @GetMapping
    public String listSubjects(@RequestParam(required = false) String subjectName,
                               Model model,
                               HttpSession session) {
        List<Subject> subjects = subjectService.searchSubjects(subjectName);
        model.addAttribute("subjects", subjects);
        model.addAttribute("user", session.getAttribute("user"));
        return "subjectList";
    }

    // 添加科目
    @PostMapping("/add")
    public String addSubject(@RequestParam String subjectName,
                             HttpSession session) {
        Integer userId = (Integer) session.getAttribute("userId"); // 假设登录用户ID存在session中
        subjectService.addSubject(subjectName, userId);
        return "redirect:/subject";
    }

    // 修改状态
    @PostMapping("/updateStatus")
    public String updateStatus(@RequestParam int id,
                               @RequestParam int status) {
        subjectService.changeStatus(id, status);
        return "redirect:/subject";
    }
}
