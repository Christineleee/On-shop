package com.demo.dao;

import com.demo.pojo.Goods;
import com.demo.pojo.Item;
import com.demo.pojo.Order;
import com.demo.utils.JDBCUtil;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.ArrayListHandler;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;

import java.sql.SQLException;
import java.util.List;

public class GoodsDao {
    private QueryRunner queryRunner;

    /**
     * 根据商品名模糊查找商品
     * @param name
     * @return
     */
    public List<Goods> selectByGoodsName(String name){
        queryRunner = new QueryRunner(JDBCUtil.getDataSource());
        String sql="select * from tb_goods where name like ?";
        try {
            return queryRunner.query(sql,new BeanListHandler<>(Goods.class),'%'+name+'%');
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 根据类别查找商品
     * @param category
     * @return
     */
    public List<Goods> selectByCategory(String category){
        queryRunner = new QueryRunner(JDBCUtil.getDataSource());
        String sql="select * from tb_goods where category= ?";
        try {
            return queryRunner.query(sql,new BeanListHandler<>(Goods.class),category);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 根据商品编号查找商品
     * @param gid
     * @return
     */
    public Goods selectByGid(int gid){
        queryRunner = new QueryRunner(JDBCUtil.getDataSource());
        String sql="select* from tb_goods where gid= ?";
        try {
            return queryRunner.query(sql,new BeanHandler<>(Goods.class),gid);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 查找全部商品
     * @return
     */
    public List<Goods> selectAll(){
        queryRunner = new QueryRunner(JDBCUtil.getDataSource());
        String sql="select* from tb_goods";
        try {
            return queryRunner.query(sql,new BeanListHandler<>(Goods.class));
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 更新商品
     * @param goods
     * @return
     */
    public int updateGoods(Goods goods){
        queryRunner = new QueryRunner(JDBCUtil.getDataSource());
        String sql ="update tb_goods set name=?, price=?, category=?,description=?, stock=? where gid=? ";
        try{
            return queryRunner.update(sql,goods.getName(),goods.getPrice(),goods.getCategory(),goods.getDescription(),goods.getStock(),goods.getGid());
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    /**
     * 增加商品
     * @param goods
     * @return
     */
    public int addGoods(Goods goods){
        queryRunner = new QueryRunner(JDBCUtil.getDataSource());
        String sql ="insert into tb_goods values (null,?,?,?,?,?)";
        try{
            return queryRunner.update(sql,goods.getName(),goods.getPrice(),goods.getCategory(),goods.getDescription(),goods.getStock());
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    /**
     * 根据商品编号删除商品
     * @param gid
     * @return
     */
    public int deleteByGid(int gid){
        queryRunner = new QueryRunner(JDBCUtil.getDataSource());
        String sql ="delete from tb_goods where gid=?";
        try {
            return queryRunner.update(sql,gid);
        }catch (Exception e){
            e.printStackTrace();
        }
        return 0;
    }

    /**
     * 根据订单来更新商品库存
     * @param order
     * @param method
     */
    public void updateStockByOrder(Order order,String method){
        queryRunner = new QueryRunner();
        String sql="update tb_goods set stock=stock"+method+"? where gid=?";
        List<Item>items=order.getItems();
        Object[][]params=new Object[items.size()][2];
        for(int i=0;i<params.length;i++){
            params[i][0]=items.get(i).getNum();
            params[i][1]=items.get(i).getGoods().getGid();
        }
        try {
            queryRunner.batch(JDBCUtil.getConnection(),sql,params);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    /**
     * 得到销售榜单
     * @return
     */
    public List<Object[]>getGoodsDescList(){
        queryRunner=new QueryRunner(JDBCUtil.getDataSource());
        String sql="select tb_goods.gid,tb_goods.name,tb_goods.price,SUM(tb_item.num) totalsale "+
                "from tb_item,tb_order,tb_goods "+
                "where tb_item.oid=tb_order.oid and tb_goods.gid=tb_item.gid "+
                "and tb_order.pay_state=1 group by tb_goods.gid,tb_goods.name "+
                "order by totalsale DESC ,tb_goods.price DESC";
        try {
            return queryRunner.query(sql,new ArrayListHandler());
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
