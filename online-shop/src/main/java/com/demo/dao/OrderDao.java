package com.demo.dao;

import com.demo.pojo.Order;
import com.demo.pojo.User;
import com.demo.utils.JDBCUtil;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class OrderDao {
    private final QueryRunner queryRunner=new QueryRunner(JDBCUtil.getDataSource());

    /**
     * 添加一条订单
     * @param order
     * @return
     */
    public int addOrder(Order order){
        String sql="insert into tb_order values(?,?,?,?,?,0,?,?)";
        try {
            return queryRunner.update(JDBCUtil.getConnection(),sql,order.getOid(),order.getMoney(),order.getReceiverAddress(),order.getReceiverName(),order.getReceiverEmail()
            , order.getUser().getUid(),order.getOrderTime());
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    /**
     * 根据用户查询订单
     * @param user
     * @return
     */
    public List<Order>selectOrderByUser(User user){
        String sql="select * from tb_order where uid=?";
        try {
            return queryRunner.query(sql, new ResultSetHandler<List<Order>>() {
                @Override
                public List<Order> handle(ResultSet resultSet) throws SQLException {
                    List<Order>list=new ArrayList<Order>();
                    while(resultSet.next()){
                        Order order=new Order();
                        order.setOid(resultSet.getString("oid"));
                        order.setMoney(resultSet.getDouble("money"));
                        order.setReceiverAddress(resultSet.getString("receiver_address"));
                        order.setReceiverName(resultSet.getString("receiver_name"));
                        order.setReceiverEmail(resultSet.getString("receiver_email"));
                        order.setPayState(resultSet.getInt("pay_state"));
                        order.setUser(user);
                        order.setOrderTime(resultSet.getTimestamp("time"));
                        list.add(order);
                    }
                    return list;
                }
            },user.getUid());
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    /**
     * 根据订单编号查找订单
     * @param oid
     * @return
     */
    public Order selectOrderById(String oid){
        String sql="select * from tb_order,tb_user where tb_order.uid=tb_user.uid and tb_order.oid=?";
        try {
            return queryRunner.query(sql, new ResultSetHandler<Order>() {
                @Override
                public Order handle(ResultSet resultSet) throws SQLException {
                    Order order=new Order();
                    while(resultSet.next()){
                        order.setOid(resultSet.getString("tb_order.oid"));
                        order.setMoney(resultSet.getDouble("tb_order.money"));
                        order.setReceiverAddress(resultSet.getString("tb_order.receiver_address"));
                        order.setReceiverName(resultSet.getString("receiver_name"));
                        order.setReceiverEmail(resultSet.getString("receiver_email"));
                        order.setPayState(resultSet.getInt("pay_state"));
                        order.setOrderTime(resultSet.getTimestamp("time"));
                        User user=new User();
                        user.setUid(resultSet.getInt("tb_user.uid"));
                        user.setRole(resultSet.getString("role"));
                        user.setUsername(resultSet.getString("username"));
                        user.setPassword(resultSet.getString("password"));
                        user.setEmail(resultSet.getString("email"));
                        order.setUser(user);
                    }
                    return order;
                }
            },oid);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    /**
     * 查找所有订单
     * @return
     */
    public List<Order>selectAllOrder(){
        String sql="select tb_order.*,tb_user.* from tb_order,tb_user where tb_user.uid=tb_order.uid order by tb_order.uid";
        try {
            return queryRunner.query(sql, new ResultSetHandler<List<Order>>() {
                @Override
                public List<Order> handle(ResultSet resultSet) throws SQLException {
                    List<Order>list=new ArrayList<Order>();
                    while(resultSet.next()){
                        Order order=new Order();
                        order.setOid(resultSet.getString("tb_order.oid"));
                        order.setMoney(resultSet.getDouble("tb_order.money"));
                        order.setReceiverAddress(resultSet.getString("tb_order.receiver_address"));
                        order.setReceiverName(resultSet.getString("receiver_name"));
                        order.setReceiverEmail(resultSet.getString("receiver_email"));
                        order.setPayState(resultSet.getInt("pay_state"));
                        order.setOrderTime(resultSet.getTimestamp("time"));
                        User user=new User();
                        user.setUid(resultSet.getInt("tb_user.uid"));
                        user.setRole(resultSet.getString("role"));
                        user.setUsername(resultSet.getString("username"));
                        user.setPassword(resultSet.getString("password"));
                        user.setEmail(resultSet.getString("email"));
                        order.setUser(user);
                        list.add(order);
                    }
                    return list;
                }
            });
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    /**
     * 根据订单标号更新支付状态
     * @param oid
     * @return
     */
    public int updateStateById(String oid){
        String sql="update tb_order set pay_state=1 where oid=?";
        try {
            return queryRunner.update(sql,oid);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    /**
     * 根据订单编号删除订单
     * @param oid
     * @return
     */
    public int deleteOrderById(String oid){
        String sql="delete from tb_order where oid=?";
        try {
            return queryRunner.update(sql,oid);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
