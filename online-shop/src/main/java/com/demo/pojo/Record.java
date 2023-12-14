package com.demo.pojo;

import java.sql.Timestamp;

public class Record {
    private int uid;
    private String username;
    private int gid;
    private String goodsname;
    private Timestamp surfTime;//浏览时间

    public Record() {
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getGoodsname() {
        return goodsname;
    }

    public void setGoodsname(String goodsname) {
        this.goodsname = goodsname;
    }

    public Record(int uid, String username, int gid, String goodsname, Timestamp surfTime) {
        this.uid = uid;
        this.username = username;
        this.gid = gid;
        this.goodsname = goodsname;
        this.surfTime = surfTime;
    }

    public int getUid() {
        return uid;
    }

    public void setUid(int uid) {
        this.uid = uid;
    }

    public int getGid() {
        return gid;
    }

    public void setGid(int gid) {
        this.gid = gid;
    }

    public Timestamp getSurfTime() {
        return surfTime;
    }

    public void setSurfTime(Timestamp surfTime) {
        this.surfTime = surfTime;
    }
}
