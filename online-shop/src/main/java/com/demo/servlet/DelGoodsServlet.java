package com.demo.servlet;

import com.demo.service.GoodsService;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import java.io.IOException;

@WebServlet("/delGoodsServlet")
public class DelGoodsServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset=utf-8");
        int gid= Integer.parseInt(req.getParameter("gid"));
        GoodsService goodsService=new GoodsService();
        goodsService.deleteGoods(gid);
        resp.sendRedirect("/listGoodsServlet");
    }
}
