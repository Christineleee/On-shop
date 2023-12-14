package com.demo.servlet;

import com.demo.pojo.Goods;
import com.demo.pojo.Item;
import com.demo.pojo.Order;
import com.demo.pojo.User;
import com.demo.service.OrderService;
import com.demo.utils.OrderCodeUtil;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.apache.log4j.Logger;

import java.io.IOException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

@WebServlet(name = "opOrderServlet",value = "/opOrderServlet")
public class OpOrderServet extends HttpServlet {
    private OrderService orderService;
    static final Logger LOGGER=Logger.getLogger(OpOrderServet.class);
    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("utf-8");
        resp.setContentType("text/html;charset=utf-8");
        String methods=req.getParameter("methods");
        if(methods!=null&&methods.trim().length()>0){
            if(methods.equals("create")){
                creatOrder(req,resp);
            }
            else if("delete".equals(methods)){
                deleteOrder(req,resp);
            }
        }
    }
    public void creatOrder(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        HttpSession session=req.getSession();
        //获取用户
        User user= (User) session.getAttribute("user");
        //从购物车中获取商品信息
        Map<Goods,Integer>cart= (Map<Goods, Integer>) session.getAttribute("cart");
        Order order=new Order();
        order.setOid(OrderCodeUtil.createOrderCode());
        order.setMoney(Double.parseDouble(req.getParameter("money")));
        order.setUser(user);
        order.setReceiverAddress(req.getParameter("receiverAddress"));
        order.setReceiverEmail(req.getParameter("receiverEmail"));
        order.setReceiverName(req.getParameter("receiverName"));
        Date date=new Date();
        Timestamp timestamp=new Timestamp(date.getTime());
        order.setOrderTime(timestamp);
        List<Item>items=new ArrayList<Item>();
        for(Goods goods:cart.keySet()){
            Item item=new Item(order,goods,cart.get(goods));
            items.add(item);
        }
        //打印日志
        String info=user.getUsername()+"正在下单："+order.toString();
        LOGGER.info(info);
        order.setItems(items);
        orderService=new OrderService();
        orderService.addOrder(order);
        //清空购物车
        cart.clear();
        req.setAttribute("order",order);
        req.getRequestDispatcher("/user/orderInfo.jsp").forward(req,resp);
    }
    public void deleteOrder(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String oid=req.getParameter("oid");
        orderService=new OrderService();
        orderService.deleteOrderById(oid);
        req.getRequestDispatcher("/findOrderServlet?methods=user").forward(req,resp);
    }
}
