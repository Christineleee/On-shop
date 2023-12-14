package com.demo.servlet;


import com.demo.pojo.Record;
import com.demo.pojo.User;
import com.demo.service.GoodsService;
import com.demo.service.RecordService;
import com.demo.service.UserService;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet(name = "findSurfRecordServlet",value = "/findSurfRecordServlet")
public class FindSurfRecordServlet extends HttpServlet {
    private GoodsService goodsService;
    private RecordService recordService;
    private UserService userService;
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset=utf-8");
        String type=req.getParameter("type");
        if(type!=null){
            if(type.equals("admin")){
                String methods=req.getParameter("methods");
                //按照用户查询
                if(methods!=null&&methods.equals("user")){
                    adminFindUserRecord(req,resp);
                }else if(methods!=null&&methods.equals("all")){//查询全部
                    adminFindAllRecord(req,resp);
                }

            }else if(type.equals("user")){
                userFindRecord(req,resp);
            }
        }
    }
    protected void userFindRecord(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session=req.getSession();
        User user=(User)session.getAttribute("user");
        recordService=new RecordService();
        List<Record>records=recordService.findGoodsByUsername(user.getUsername());
        req.setAttribute("records",records);
        req.getRequestDispatcher("/user/surfList.jsp").forward(req,resp);
    }
    protected void adminFindAllRecord(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        recordService=new RecordService();
        List<Record>records=recordService.findAllSurfGoods();
        req.setAttribute("records",records);
        req.getRequestDispatcher("/admin/surfList.jsp").forward(req,resp);
    }
    protected void adminFindUserRecord(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String username=req.getParameter("username");
        if(username!=null&&!username.isEmpty()){
            recordService=new RecordService();
            List<Record>records=recordService.findGoodsByUsername(username);
            req.setAttribute("records",records);
            req.getRequestDispatcher("/admin/surfList.jsp").forward(req,resp);
        }
    }
}
