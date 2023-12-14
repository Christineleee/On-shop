package com.demo.pojo;

import java.util.Objects;

public class Goods {
    private int gid;//商品编号
    private String name;//名称
    private double price;//价格
    private String category;//分类
    private String description;//描述
    private int stock;//库存量

    public Goods(int gid, String name, double price, String category, String description, int stock) {
        this.gid = gid;
        this.name = name;
        this.price = price;
        this.category = category;
        this.description = description;
        this.stock = stock;
    }

    public Goods() {
    }

    public int getGid() {
        return gid;
    }

    public void setGid(int gid) {
        this.gid = gid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }



    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Goods goods = (Goods) o;
        return gid == goods.gid && Double.compare(price, goods.price) == 0 && stock == goods.stock && Objects.equals(name, goods.name) && Objects.equals(category, goods.category) && Objects.equals(description, goods.description);
    }

    @Override
    public int hashCode() {
        return Objects.hash(gid, name, price, category, description, stock);
    }
}
