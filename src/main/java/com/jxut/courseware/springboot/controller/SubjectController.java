package com.jxut.courseware.springboot.controller;

import com.jxut.courseware.springboot.entity.Subject;
import com.jxut.courseware.springboot.service.SubjectService;
import com.jxut.courseware.springboot.util.PageBean;
import jakarta.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping({"/subject", "/subjectList.html"})
public class SubjectController {

    @Autowired
    private SubjectService subjectService;

    // 模糊查询 & 列表展示
    @GetMapping
    public String listSubjects(@RequestParam(required = false) String subjectName,
                               @RequestParam(defaultValue = "1") int pageNum,
                               Model model,
                               HttpSession session) {
        int pageSize = 6; // 每页显示5条数据
        PageBean<Subject> pageBean = subjectService.searchSubjects(subjectName, pageNum, pageSize);
        model.addAttribute("subjects", pageBean.getItems());
        model.addAttribute("pageBean", pageBean);
        model.addAttribute("user", session.getAttribute("user"));
        model.addAttribute("subjectName", subjectName); // 回显搜索框内容
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
