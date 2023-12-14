package com.demo.servlet;

import com.demo.service.GoodsService;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import java.io.IOException;
import java.util.List;

@WebServlet(name = "saleListServlet",value = "/salesListServlet")
public class SalesListServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        GoodsService goodsService=new GoodsService();
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset=utf-8");
        List<Object[]>list=goodsService.getGoodsDesc();
        req.setAttribute("salelist",list);
        req.getRequestDispatcher("/admin/salesList.jsp").forward(req,resp);
    }
}
