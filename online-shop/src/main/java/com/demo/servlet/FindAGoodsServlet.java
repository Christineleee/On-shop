package com.demo.servlet;

import com.demo.pojo.Goods;
import com.demo.service.GoodsService;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import java.io.IOException;

/**
 * 后台寻找商品
 */
@WebServlet(name = "findAGoodsServlet",value = "/findAGoodsServlet")
public class FindAGoodsServlet extends HttpServlet {
    private GoodsService goodsService;
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset=utf-8");
        int gid=Integer.parseInt(req.getParameter("gid"));
        goodsService=new GoodsService();
        Goods goods=goodsService.showGoodsById(gid);
        req.setAttribute("goods",goods);
        req.getRequestDispatcher("/admin/goodsUpdate.jsp").forward(req,resp);
    }
}
