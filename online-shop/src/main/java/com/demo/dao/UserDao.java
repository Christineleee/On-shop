package com.demo.dao;

import com.demo.pojo.User;
import com.demo.utils.JDBCUtil;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;

import java.sql.SQLException;

public class UserDao{
    private final QueryRunner queryRunner=new QueryRunner(JDBCUtil.getDataSource());

    /**
     * 增加用户
     * @param user
     * @return 成功的条数
     */
    public int addUser(User user) {
        String sql="insert into tb_user values(null,?,?,?,?)";
        int res=0;
        try {
            res=queryRunner.update(sql,user.getUsername(),user.getPassword(),user.getEmail(),user.getRole());
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return res;
    }

    /**
     * 根据用户名寻找用户
     * @param username
     * @return 用户
     */
    public User findUserByUsername(String username){
        String sql="select * from tb_user where username=?";
        User user=null;
        try {
            user=queryRunner.query(sql,new BeanHandler<>(User.class),username);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }
    public User findUserByUsernameAndPwd(String username,String password){
        String sql="select * from tb_user where username=? and password=?";
        User user=null;
        try {
            user=queryRunner.query(sql,new BeanHandler<>(User.class),username,password);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return user;
    }

}
