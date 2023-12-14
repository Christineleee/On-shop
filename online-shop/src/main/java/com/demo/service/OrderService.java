package com.demo.service;

import com.demo.dao.GoodsDao;
import com.demo.dao.ItemDao;
import com.demo.dao.OrderDao;
import com.demo.pojo.Item;
import com.demo.pojo.Order;
import com.demo.pojo.User;
import com.demo.utils.JDBCUtil;

import java.sql.SQLException;
import java.util.List;

public class OrderService {
    private OrderDao orderDao=new OrderDao();
    private ItemDao itemDao=new ItemDao();
    private GoodsDao goodsDao=new GoodsDao();

    /**
     * 增加订单
     * @param order
     */
    public void addOrder(Order order){
        try {
            //开启事务
            JDBCUtil.startTransaction();
            //增加订单
            orderDao.addOrder(order);
            //订单关联项增加
            itemDao.addItem(order);
            //更新商品库存
            goodsDao.updateStockByOrder(order,"-");

        } catch (SQLException e) {
            e.printStackTrace();
            try {
                JDBCUtil.rollback();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }finally {
            JDBCUtil.close();
        }
    }

    /**
     * 根据用户来查找订单
     * @param user
     * @return
     */
    public List<Order>findOrderByUser(User user){
        List<Order>orders=null;
        orders=orderDao.selectOrderByUser(user);
        return orders;
    }

    /**
     * 根据id来查找订单
     * @param oid
     * @return
     */
    public Order findOrderById(String oid){
        Order order=orderDao.selectOrderById(oid);
        List<Item>items=itemDao.selectItemByOrder(order);
        order.setItems(items);
        return order;
    }

    /**
     * 查找所有订单
     * @return
     */
    public List<Order>findAllOrder(){
        return orderDao.selectAllOrder();
    }

    /**
     * 根据订单编号更新支付状态
     * @param id
     */
    public void updateState(String id){
        orderDao.updateStateById(id);
    }

    /**
     * 管理员删除订单
     * @param oid
     */
    public void deleteOrderById(String oid){
        try {
            JDBCUtil.startTransaction();
            Order order=orderDao.selectOrderById(oid);
            //增加库存
            goodsDao.updateStockByOrder(order,"+");
            //删除订单项
            itemDao.deleteItemByOid(oid);
            //删除订单
            orderDao.deleteOrderById(oid);
        } catch (SQLException e) {
            e.printStackTrace();
            try {
                JDBCUtil.rollback();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }finally {
            JDBCUtil.close();
        }
    }
}
