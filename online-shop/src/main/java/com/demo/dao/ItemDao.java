package com.demo.dao;

import com.demo.pojo.Goods;
import com.demo.pojo.Item;
import com.demo.pojo.Order;
import com.demo.utils.JDBCUtil;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ItemDao {
    private QueryRunner queryRunner;

    /**
     * 批量添加订单项
     * @param order
     */
    public void addItem(Order order){
        queryRunner=new QueryRunner();
        String sql="insert into tb_item values(?,?,?)";
        List<Item>items=order.getItems();
        Object[][]params=new Object[items.size()][3];
        for(int i=0;i<params.length;i++){
            params[i][0]=items.get(i).getOrder().getOid();
            params[i][1]=items.get(i).getGoods().getGid();
            params[i][2]=items.get(i).getNum();
        }
        try {
            queryRunner.batch(JDBCUtil.getConnection(),sql,params);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public List<Item>selectItemByOrder(Order order){
        String sql="select * from tb_item,tb_goods where tb_item.gid=tb_goods.gid and oid=?";
        try {
            QueryRunner queryRunner=new QueryRunner(JDBCUtil.getDataSource());
            return queryRunner.query(sql, new ResultSetHandler<List<Item>>() {
                @Override
                public List<Item> handle(ResultSet resultSet) throws SQLException {
                    List<Item>items=new ArrayList<Item>();
                    while(resultSet.next()){
                        Item item=new Item();
                        item.setOrder(order);
                        item.setNum(resultSet.getInt("num"));
                        Goods goods=new Goods();
                        goods.setCategory(resultSet.getString("category"));
                        goods.setDescription(resultSet.getString("description"));
                        goods.setGid(resultSet.getInt("tb_goods.gid"));
                        goods.setName(resultSet.getString("name"));
                        goods.setPrice(resultSet.getDouble("price"));
                        goods.setStock(resultSet.getInt("stock"));
                        item.setGoods(goods);
                        items.add(item);
                    }
                    return items;
                }
            },order.getOid());
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
    public int deleteItemByOid(String oid){
        String sql="delete from tb_item where oid=?";
        try {
            queryRunner=new QueryRunner();
            return queryRunner.update(JDBCUtil.getConnection(),sql,oid);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }
}
