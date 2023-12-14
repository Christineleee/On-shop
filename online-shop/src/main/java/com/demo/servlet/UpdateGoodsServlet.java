package com.demo.servlet;

import com.demo.pojo.Goods;
import com.demo.service.GoodsService;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;

@WebServlet("/updateGoodsServlet")
public class UpdateGoodsServlet extends HttpServlet {
    private GoodsService goodsService=new GoodsService();
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset=utf-8");
        int gid=Integer.parseInt(req.getParameter("gid"));
        String name=req.getParameter("name");
        String priceStr=req.getParameter("price");
        String stockStr=req.getParameter("stock");
        String category=req.getParameter("category");
        String description=req.getParameter("description");
        Goods goods=new Goods();
        if(name!=null){
            goods.setName(name);
        }
        else {
            PrintWriter out = resp.getWriter();
            out.write("<script>");
            out.write("alert('提交失败，商品名不能为空！');");
            out.write("location.href='goodsAdd.jsp'");
            out.write("</script>");
            out.close();
        }
        double price=0;
        if(!priceStr.equals("")){
            price=(Double.parseDouble(priceStr));
            if(price<0){
                PrintWriter out = resp.getWriter();
                out.write("<script>");
                out.write("alert('提交失败，价格不能小于0！');");
                out.write("location.href='goodsAdd.jsp'");
                out.write("</script>");
                out.close();
            }
        }
        goods.setPrice(price);
        goods.setDescription(description);
        goods.setCategory(category);
        int stock=0;
        if(!stockStr.equals("")){
            stock=Integer.parseInt(stockStr);
            if(stock<0){
                PrintWriter out = resp.getWriter();
                out.write("<script>");
                out.write("alert('提交失败，库存不能小于0！');");
                out.write("location.href='goodAdd.jsp'");
                out.write("</script>");
                out.close();
            }
        }
        goods.setStock(stock);
        goods.setGid(gid);
        if(goodsService.updateGoods(goods)){
            resp.sendRedirect("/listGoodsServlet");
        }else{
            PrintWriter out = resp.getWriter();
            out.write("<script>");
            out.write("alert('修改失败！');");
            out.write("location.href='/listGoodsServlet'");
            out.write("</script>");
            out.close();
        }
    }
}
