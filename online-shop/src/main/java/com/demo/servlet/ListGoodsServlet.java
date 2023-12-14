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

/**
 * admin查询商品信息
 */
@WebServlet(name = "listGoodsServlet",value = "/listGoodsServlet")
public class ListGoodsServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset=utf-8");
        GoodsService goodsService=new GoodsService();
        List<Goods>goods=goodsService.showAllGoods();
        req.setAttribute("goodslist",goods);
        req.getRequestDispatcher("/admin/goodsList.jsp").forward(req,resp);
    }
}
