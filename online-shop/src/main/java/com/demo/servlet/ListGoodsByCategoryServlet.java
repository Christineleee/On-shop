package com.demo.servlet;

import com.demo.pojo.Goods;
import com.demo.service.GoodsService;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import java.io.IOException;
import java.util.List;

@WebServlet(name = "listGoodsByCategory",value = "/listGoodsByCategory")
public class ListGoodsByCategoryServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset=utf-8");
        String category=req.getParameter("category");
        GoodsService goodsService=new GoodsService();
        List<Goods>goodsList=goodsService.showGoodsByCategory(category);
        req.setAttribute("goodslist",goodsList);
        req.getRequestDispatcher("/admin/goodsList.jsp").forward(req,resp);
    }
}
