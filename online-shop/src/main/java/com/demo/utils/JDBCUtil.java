package com.demo.utils;

import com.alibaba.druid.pool.DruidDataSourceFactory;

import javax.sql.DataSource;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.Properties;

public class JDBCUtil {
    //数据库连接池变量
    private static DataSource dataSource;
    private static ThreadLocal<Connection> threadLocal =new ThreadLocal<>();
    static {
        Properties properties =new Properties();
        InputStream resourceAsStream = JDBCUtil.class.getClassLoader().getResourceAsStream("jdbc.properties");
        try {
            properties.load(resourceAsStream);
        } catch (IOException e) {
            throw new RuntimeException(e);
        }

        try {
            dataSource = DruidDataSourceFactory.createDataSource(properties);
        } catch (Exception e) {
            throw new RuntimeException(e);
        }

    }

    /**
     * 获取连接
     * @return 连接池中的一个连接
     */
    public static Connection getConnection(){
        Connection connection = threadLocal.get();
        if (null == connection) {
            try {
                connection = dataSource.getConnection();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
            threadLocal.set(connection);
        }

        return connection;
    }

    /**
     * 释放资源
     */
    public static void close(){
        Connection connection = threadLocal.get();
        if (null != connection) {
            threadLocal.remove();
            try {
                connection.setAutoCommit(true);
                connection.close();
            } catch (SQLException e) {
                throw new RuntimeException(e);
            }
        }
    }

    /**
     * 获取数据库连接池
     * @return 返回连接池
     */
    public static DataSource getDataSource(){
        return dataSource;
    }
    public static void startTransaction() throws SQLException {
        Connection connection=getConnection();
        if(connection!=null)
            connection.setAutoCommit(false);
    }
    public static void rollback() throws SQLException {
        Connection connection=getConnection();
        if(connection!=null)
            connection.rollback();
    }
}
