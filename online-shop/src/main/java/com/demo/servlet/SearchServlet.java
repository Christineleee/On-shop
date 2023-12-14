package com.demo.servlet;

import com.demo.pojo.Goods;
import com.demo.service.GoodsService;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.net.URLDecoder;
import java.util.List;

@WebServlet(name = "searchServlet",value = "/searchServlet")
public class SearchServlet extends HttpServlet {
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset=utf-8");
        String search= URLDecoder.decode(req.getParameter("textfield"),"UTF-8");
        System.out.println(search);
        if("Search".equals(search)){
            req.getRequestDispatcher("/showGoodsServlet").forward(req,resp);
            return;
        }
        GoodsService goodsService=new GoodsService();
        List<Goods>list =goodsService.findGoods(search);
        req.setAttribute("list",list);
        req.getRequestDispatcher("/user/mainPage.jsp").forward(req,resp);
    }
}
