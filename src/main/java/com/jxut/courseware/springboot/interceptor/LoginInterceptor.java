package com.jxut.courseware.springboot.interceptor;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

@Component
public class LoginInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession session = request.getSession();

        // 获取当前请求的URL
        String uri = request.getRequestURI();

        // 如果是登录页面或静态资源，直接放行
        if (uri.endsWith("login.jsp") || uri.startsWith("/css/") || uri.startsWith("/js/") || uri.startsWith("/img/")) {
            return true;
        }

        // 检查session中是否有用户信息
        if (session.getAttribute("user") != null) {
            return true; // 已登录，继续执行
        } else {
            // 未登录，重定向到登录页面
            response.sendRedirect(request.getContextPath() + "/login.jsp");
            return false;
        }
    }
}

