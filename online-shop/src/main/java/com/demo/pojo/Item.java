package com.demo.pojo;

public class Item {
    private Order order;//所属订单
    private Goods goods;//购买物品
    private int num;//购买数量

    public Item() {
    }

    public Item(Order order, Goods goods, int num) {
        this.order = order;
        this.goods = goods;
        this.num = num;
    }

    public Order getOrder() {
        return order;
    }

    public void setOrder(Order order) {
        this.order = order;
    }

    public Goods getGoods() {
        return goods;
    }

    public void setGoods(Goods goods) {
        this.goods = goods;
    }

    public int getNum() {
        return num;
    }

    public void setNum(int num) {
        this.num = num;
    }

    @Override
    public String toString() {
        return "Item{" +
                "order=" + order +
                ", goods=" + goods +
                ", num=" + num +
                '}';
    }
}
