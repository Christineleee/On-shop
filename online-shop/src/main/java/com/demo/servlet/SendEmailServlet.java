package com.demo.servlet;

import com.demo.pojo.Order;
import com.demo.service.OrderService;
import com.demo.utils.MailUtils;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "sendEmailServlet",value = "/sendEmailServlet")
public class SendEmailServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset=utf-8");
        String oid=req.getParameter("oid");
        OrderService orderService=new OrderService();
        Order order=orderService.findOrderById(oid);
        String receiverEmail=order.getReceiverEmail();
        String msg="The order you purchased :"+order.toString()+"has been shipped. ";
        try {
            MailUtils.sendMail(receiverEmail,"Order Shipped Email",msg);
            PrintWriter out = resp.getWriter();
            out.write("<script>");
            out.write("alert('发货邮件发送成功');");
            out.write("location.href='/findOrderServlet?methods=all'");
            out.write("</script>");
            out.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
