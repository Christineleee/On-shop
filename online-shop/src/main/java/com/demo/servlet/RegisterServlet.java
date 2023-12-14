package com.demo.servlet;


import com.demo.pojo.User;
import com.demo.service.UserService;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "registerServlet",value = "/registerServlet")
public class RegisterServlet extends HttpServlet {
    private UserService userService;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        userService=new UserService();
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset=utf-8");
        String username=req.getParameter("username");
        String password=req.getParameter("password");
        String email=req.getParameter("email");
        User user=new User(username,password,email,"customer");
        boolean res=userService.register(user);
        if(res&&!"".equals(username)){
            resp.sendRedirect("/user/login.jsp");
        }else{
            PrintWriter out = resp.getWriter();
            out.write("<script>");
            out.write("alert('用户名已存在！');");
            out.write("location.href='user/register.jsp'");
            out.write("</script>");
            out.close();
        }
    }
}
