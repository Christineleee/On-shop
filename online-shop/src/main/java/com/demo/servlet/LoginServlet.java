package com.demo.servlet;

import com.demo.pojo.User;
import com.demo.service.UserService;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "loginServlet",value = "/loginServlet")
public class LoginServlet extends HttpServlet {
    private UserService userService;
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req,resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset=utf-8");
        userService=new UserService();
        String username=req.getParameter("username");
        String password=req.getParameter("password");
        User user=userService.getLoginUser(username,password);
        if(user!=null){
            HttpSession session=req.getSession();
            session.setAttribute("user",user);
            session.setAttribute("isLogin",true);
            String role=user.getRole();
            //如果是销售则进入后台管理系统，是顾客则进入登录后的首页
            if("manager".equals(role)){
                resp.sendRedirect(req.getContextPath()+"/admin/home.jsp");
            }else{
                resp.sendRedirect("/showGoodsServlet");
            }
        }else{//找不到用户
            PrintWriter out = resp.getWriter();
            out.write("<script>");
            out.write("alert('用户名或密码错误！');");
            out.write("location.href='user/login.jsp'");
            out.write("</script>");
            out.close();
        }
    }
}
