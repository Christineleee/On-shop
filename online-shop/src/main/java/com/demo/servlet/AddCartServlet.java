package com.demo.servlet;

import com.demo.pojo.Goods;
import com.demo.service.GoodsService;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name = "addCartServlet",value = "/addCartServlet")
public class AddCartServlet extends HttpServlet {
    private GoodsService goodsService;
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset=utf-8");
        int gid= Integer.parseInt(req.getParameter("gid"));
        goodsService=new GoodsService();
        Goods goods=goodsService.showGoodsById(gid);
        HttpSession session=req.getSession();
        Map<Goods,Integer>cart= (Map<Goods, Integer>) session.getAttribute("cart");
        if(cart==null){
            cart=new HashMap<Goods,Integer>();
        }
        Integer count=cart.put(goods,1);
        if(count!=null){
            cart.put(goods,count+1);
        }
        session.setAttribute("cart",cart);
        resp.sendRedirect(req.getContextPath()+"/user/cart.jsp");
    }
}
