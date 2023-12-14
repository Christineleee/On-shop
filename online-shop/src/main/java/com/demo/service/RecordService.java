package com.demo.service;

import com.demo.dao.RecordDao;
import com.demo.pojo.Record;

import java.util.List;

public class RecordService {
    private RecordDao recordDao=new RecordDao();

    /**
     * 增加一条记录
     * @param record
     * @return
     */
    public boolean addRecord(Record record){
        Record r=recordDao.findRecordByUidGid(record.getUid(),record.getGid());
        //没有这条记录
        if(r.getGid()==0&&r.getUid()==0){
            recordDao.addRecord(record);
            return true;
        }else{
            return false;
        }
    }

    /**
     * 根据用户名来查找记录
     * @param username
     * @return
     */
    public List<Record>findGoodsByUsername(String username){
        return recordDao.findRecordByUsername(username);
    }

    /**
     * 查找所有记录
     * @return
     */
    public List<Record> findAllSurfGoods(){
        return recordDao.findAllRecord();
    }
}
