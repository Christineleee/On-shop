package com.demo.service;

import com.demo.dao.GoodsDao;
import com.demo.pojo.Goods;

import java.util.List;

public class GoodsService {
    private GoodsDao goodsDao=new GoodsDao();

    /**
     * 按照商品名搜索商品
     * @param goodsName
     * @return 商品列表
     */
    public List<Goods>findGoods(String goodsName){
        return goodsDao.selectByGoodsName(goodsName);
    }

    /**
     * 按照商品分类展示商品
     * @param category
     * @return 商品列表
     */
    public List<Goods>showGoodsByCategory(String category){
        return goodsDao.selectByCategory(category);
    }

    /**
     * 查找所有商品
     * @return 商品列表
     */
    public List<Goods>showAllGoods()
    {
        return goodsDao.selectAll();
    }

    /**
     * 按照商品编号查找商品
     * @param gid
     * @return
     */
    public Goods showGoodsById(int gid){return goodsDao.selectByGid(gid);}

    /**
     * 添加商品
     * @param goods
     * @return 是否成功
     */
    public boolean addGoods(Goods goods){
        if(goodsDao.addGoods(goods)>0){
            return true;
        }else{
            return false;
        }
    }

    /**
     * 删除商品
     * @param gid
     * @return 是否成功
     */
    public boolean deleteGoods(int gid){
        if(goodsDao.selectByGid(gid)!=null){
            if(goodsDao.deleteByGid(gid)>0){
                return true;
            }
        }
        return false;
    }

    /**
     * 更新商品信息
     * @param goods
     * @return 是否成功
     */
    public boolean updateGoods(Goods goods){
        if(goodsDao.selectByGid(goods.getGid())!=null){
            if(goodsDao.updateGoods(goods)>0){
                return true;
            }
        }
        return false;
    }

    /**
     * 获取商品销量降序榜单
     * @return
     */
    public List<Object[]>getGoodsDesc(){
        return goodsDao.getGoodsDescList();
    }
}
