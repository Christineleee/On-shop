package com.demo.servlet;

import com.demo.pojo.Goods;
import com.demo.pojo.Record;
import com.demo.pojo.User;
import com.demo.service.GoodsService;
import com.demo.service.RecordService;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.Date;

@WebServlet(name = "showDetailServlet",value = "/showDetailServlet")
public class ShowDetailServlet extends HttpServlet {
    private GoodsService goodsService;
    static final Logger LOGGER=Logger.getLogger(ShowDetailServlet.class);
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset=utf-8");
        User user= (User) req.getSession().getAttribute("user");
        if(user!=null){
            goodsService=new GoodsService();
            int gid= Integer.parseInt(req.getParameter("gid"));
            Goods goods=goodsService.showGoodsById(gid);
            //增加浏览记录
            Record record=new Record();
            record.setGid(gid);
            record.setUid(user.getUid());
            record.setUsername(user.getUsername());
            record.setGoodsname(goods.getName());
            Date date=new Date();
            Timestamp timestamp=new Timestamp(date.getTime());
            record.setSurfTime(timestamp);
            RecordService recordService=new RecordService();
            recordService.addRecord(record);
            //打印日志
            String info= user.getUsername()+"正在浏览"+ goods.getName();
            LOGGER.info(info);
            req.setAttribute("goods",goods);
            req.getRequestDispatcher("/user/goodsDetail.jsp").forward(req,resp);
        }else{
            //设置登录限制
            PrintWriter out = resp.getWriter();
            out.write("<script>");
            out.write("alert('登录后可查看详情！');");
            out.write("location.href='/user/login.jsp'");
            out.write("</script>");
            out.close();
        }
    }
}

