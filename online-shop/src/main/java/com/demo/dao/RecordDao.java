package com.demo.dao;

import com.demo.pojo.Record;
import com.demo.utils.JDBCUtil;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.ResultSetHandler;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class RecordDao {
    private QueryRunner queryRunner=new QueryRunner(JDBCUtil.getDataSource());

    /**
     * 增加记录
     * @param record
     * @return
     */
    public int addRecord(Record record){
        String sql="insert into tb_record values(?,?,?,?,?)";
        try {
            return queryRunner.update(sql,record.getUid(),record.getUsername(),record.getGid(),record.getGoodsname(),record.getSurfTime());
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    /**
     * 根据用户编号和商品编号来查找一条记录
     * @param uid
     * @param oid
     * @return
     */
    public Record findRecordByUidGid(int uid,int oid){

    
        String sql="select * from tb_record where uid=? and gid=?";
        try {
            return queryRunner.query(sql, new ResultSetHandler<Record>() {
                @Override
                public Record handle(ResultSet resultSet) throws SQLException {
                    Record record=new Record();
                    if(resultSet.next()){
                        record.setUid(resultSet.getInt("uid"));
                        record.setUsername(resultSet.getString("username"));
                        record.setGid(resultSet.getInt("gid"));
                        record.setGoodsname(resultSet.getString("goodsname"));
                        record.setSurfTime(resultSet.getTimestamp("surf_time"));
                    }
                    return record;
                }
            },uid,oid);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 查找所有记录
     * @return
     */
    public List<Record> findAllRecord(){
        String sql="select * from tb_record";
        try {
            return queryRunner.query(sql, new ResultSetHandler<List<Record>>() {
                @Override
                public List<Record> handle(ResultSet resultSet) throws SQLException {
                    List<Record>records=new ArrayList<Record>();
                    while(resultSet.next()){
                        Record record=new Record();
                        record.setUid(resultSet.getInt("uid"));
                        record.setUsername(resultSet.getString("username"));
                        record.setGid(resultSet.getInt("gid"));
                        record.setGoodsname(resultSet.getString("goodsname"));
                        record.setSurfTime(resultSet.getTimestamp("surf_time"));
                        records.add(record);
                    }
                    return records;
                }
            });
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    /**
     * 根据用户名查找记录
     * @param username
     * @return
     */
    public List<Record> findRecordByUsername(String username){
        String sql="select * from tb_record where username=?";
        try {
            return queryRunner.query(sql, new ResultSetHandler<List<Record>>() {
                @Override
                public List<Record> handle(ResultSet resultSet) throws SQLException {
                    List<Record>records=new ArrayList<Record>();
                    while(resultSet.next()){
                        Record record=new Record();
                        record.setUid(resultSet.getInt("uid"));
                        record.setUsername(resultSet.getString("username"));
                        record.setGid(resultSet.getInt("gid"));
                        record.setGoodsname(resultSet.getString("goodsname"));
                        record.setSurfTime(resultSet.getTimestamp("surf_time"));
                        records.add(record);
                    }
                    return records;
                }
            },username);
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }
}
