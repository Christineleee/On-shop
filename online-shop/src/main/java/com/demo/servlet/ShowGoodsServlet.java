package com.demo.servlet;

import com.demo.pojo.Goods;
import com.demo.service.GoodsService;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "showGoodsServlet",value = "/showGoodsServlet")
public class ShowGoodsServlet extends HttpServlet {
    private GoodsService goodsService;
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset=utf-8");
        goodsService=new GoodsService();
        String methods=req.getParameter("methods");
        List<Goods>list = new ArrayList<Goods>();
        if(methods==null|| methods.trim().length() == 0){
            list=goodsService.showAllGoods();
        }
        else{
            if(methods.equals("category")){
                String category=req.getParameter("category");
                if(!"".equals(category)){
                    list = goodsService.showGoodsByCategory(category);
                }
            }else if(methods.equals("name")){
                String name=req.getParameter("name");
                if(!"".equals(name)){
                    list=goodsService.findGoods(name);
                }
            }
            else{
                list=goodsService.showAllGoods();
            }
        }
        req.setAttribute("list",list);
        req.getRequestDispatcher("user/mainPage.jsp").forward(req,resp);
    }
}
