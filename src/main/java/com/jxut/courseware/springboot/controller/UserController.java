package com.jxut.courseware.springboot.controller;

import com.jxut.courseware.springboot.entity.User;
import com.jxut.courseware.springboot.service.UserService;
import com.jxut.courseware.springboot.util.PageBean;
import jakarta.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/user")
public class UserController {

    @Autowired
    private UserService userService;

    @GetMapping
    public String list(@RequestParam(required = false) String realname,
                       @RequestParam(defaultValue = "1") int pageNum,
                       Model model) {

        int pageSize = 6;

        PageBean<User> page;
        if (realname != null && !realname.trim().isEmpty()) {
            // 按真实姓名查询
            page = userService.getUsersByRealnameWithPage(realname, pageNum, pageSize);
        } else {
            // 普通用户列表
            page = userService.getUsersByPage(pageNum, pageSize);
        }

        model.addAttribute("userList", page.getItems());
        model.addAttribute("totalPages", page.getTotalPages());
        model.addAttribute("currentPage", page.getCurrentPage());
        model.addAttribute("realname", realname); // 保留搜索内容

        return "userList";
    }

    @PostMapping("/delete")
    private String delete(HttpServletRequest request) {
        int delId = Integer.parseInt(request.getParameter("id"));
        userService.deleteUser(delId);
        return "redirect:/user";
    }

    @GetMapping("/view")
    private String view(HttpServletRequest request, Model model) {
        int viewId = Integer.parseInt(request.getParameter("id"));
        User viewUser = userService.getUserById(viewId);
        model.addAttribute("user", viewUser);
        return "userView";
    }

    @GetMapping("/toUserUpdate")
    private String toUserUpdate(HttpServletRequest request, Model model) {
        int id = Integer.parseInt(request.getParameter("id"));
        User user = userService.getUserById(id);
        model.addAttribute("user", user);
        return "userUpdate";
    }

    @GetMapping("/toUserAdd")
    public String toUserAdd(Model model) {
        return "userAdd";
    }

    @PostMapping("/update")
    private String update(@RequestParam String id, HttpServletRequest request, Model model) throws Exception {
        String idStr = id;
        if (idStr == null || idStr.trim().isEmpty()) {
            throw new Exception("用户ID不能为空");
        }

        User updateUser = new User();
        updateUser.setId(Integer.parseInt(idStr));
        updateUser.setRealname(request.getParameter("realname"));
        updateUser.setSex(request.getParameter("sex"));
        updateUser.setBirthday(request.getParameter("birthday"));
        updateUser.setTel(request.getParameter("tel"));
        updateUser.setAddress(request.getParameter("address"));
        updateUser.setType(request.getParameter("type"));

        boolean updateSuccess = userService.updateUser(updateUser);
        if (updateSuccess) {
            return "redirect:/user";
        } else {
            model.addAttribute("error", "更新失败");
            model.addAttribute("user", updateUser);
            return "userUpdate";
        }
    }

    @PostMapping("/add")
    public String add(HttpServletRequest request) {
        String realname = request.getParameter("realname");
        String pwd = request.getParameter("password");
        String birthday = request.getParameter("birthday");
        String sex = request.getParameter("sex");
        String address = request.getParameter("address");
        String tel = request.getParameter("tel");
        String type = request.getParameter("type");

        User user = new User();
        user.setUsername(request.getParameter("username"));
        user.setRealname(realname);
        user.setPassword(pwd);
        user.setBirthday(birthday);
        user.setSex(sex);
        user.setAddress(address);
        user.setTel(tel);
        user.setType(type);

        userService.addUser(user);
        return "redirect:/user";
    }

    @PostMapping("/login")
    public String login(@RequestParam String username, @RequestParam String password, Model model) {
        boolean success = userService.login(username, password);
        if (success) {
            return "index";
        } else {
            model.addAttribute("error", "用户名或密码错误");
            return "login";
        }
    }
}

