package com.demo.servlet;

import com.demo.pojo.Order;
import com.demo.pojo.User;
import com.demo.service.OrderService;
import com.demo.service.UserService;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import java.io.IOException;
import java.util.List;

@WebServlet(name = "findOrderServlet",value = "/findOrderServlet")
public class FindOrderServlet extends HttpServlet {
    private OrderService orderService;
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset=utf-8");
        String methods=req.getParameter("methods");
        String type=req.getParameter("type");
        if(methods!=null&&methods.trim().length()>0){
            if(methods.equals("user")){
                findOrderByUser(req,resp);
            }else if(methods.equals("oid")){
                if(type!=null&&type.trim().length()>0){
                    findOrderByOidAdmin(req,resp);
                }else{
                    findOrderByOid(req,resp);
                }
            }else if(methods.equals("all")){
                findAllOrder(req,resp);
            }else if(methods.equals("username")){
                findOrderByUsername(req,resp);
            }
        }
    }
    protected void findOrderByUser(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        User user= (User) req.getSession().getAttribute("user");
        orderService=new OrderService();
        List<Order>orders=orderService.findOrderByUser(user);
        req.setAttribute("orders",orders);
        req.getRequestDispatcher("/user/orderList.jsp").forward(req,resp);
        return;
    }
    protected void findOrderByOid(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String oid=req.getParameter("oid");
        if(oid!=null&&oid.trim().length()>0){
            orderService=new OrderService();
            Order order=orderService.findOrderById(oid);
            req.setAttribute("order",order);
            req.getRequestDispatcher("user/orderInfo.jsp").forward(req,resp);
        }
    }
    protected void findOrderByOidAdmin(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String oid=req.getParameter("oid");
        if(oid!=null&&oid.trim().length()>0){
            orderService=new OrderService();
            Order order=orderService.findOrderById(oid);
            req.setAttribute("order",order);
            req.getRequestDispatcher("/admin/orderView.jsp").forward(req,resp);
        }
    }
    protected void findOrderByUsername(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username=req.getParameter("username");
        if(username!=null&&username.trim().length()>0){
            orderService=new OrderService();
            UserService userService=new UserService();
            User user=userService.findUserByUsername(username);
            List<Order>orders=orderService.findOrderByUser(user);
            req.setAttribute("orders",orders);
            req.getRequestDispatcher("/admin/orderList.jsp").forward(req,resp);
        }else{
            findAllOrder(req,resp);
        }
    }
    protected void findAllOrder(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        orderService=new OrderService();
        List<Order>orders=orderService.findAllOrder();
        req.setAttribute("orders",orders);
        req.getRequestDispatcher("/admin/orderList.jsp").forward(req,resp);
    }
}
