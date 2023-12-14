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
import java.util.Map;

@WebServlet(name = "updateCartServlet",value = "/updateCartServlet")
public class UpdateCartServlet extends HttpServlet {
    private GoodsService goodsService=new GoodsService();
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset=utf-8");
        int gid= Integer.parseInt(req.getParameter("gid"));
        int count=Integer.parseInt(req.getParameter("count"));
        HttpSession session=req.getSession();
        Map<Goods,Integer>cart= (Map<Goods, Integer>) session.getAttribute("cart");
        Goods goods=goodsService.showGoodsById(gid);
        if(count!=0){
            if(cart.containsKey(goods)){
                cart.put(goods,count);
            }
        }else{
            cart.remove(goods);
        }
        resp.sendRedirect("/user/cart.jsp");
    }
}
