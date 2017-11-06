package com.yizhan.service.business.goods;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yizhan.dao.DaoSupport;
import com.yizhan.entity.Page;
import com.yizhan.util.PageData;


@Service("goodsService")
public class GoodsService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	
	/*
	*列表
	*/
	public List<PageData> goodslist(Page page)throws Exception{
		return (List<PageData>)dao.findForList("goodsMapper.goodslistPage", page);
	}
	
	/*
	 *列表
	 */
	public List<PageData> goodshaveKucunlistPage(Page page)throws Exception{
		return (List<PageData>)dao.findForList("goodsMapper.goodshaveKucunlistPage", page);
	}
	
	
	/*
	* 新增
	*/
	public void saveGoods(PageData pd)throws Exception{
		dao.save("goodsMapper.saveGoods", pd);
	}
	
	
	/*
	* 修改
	*/
	public void updateGoods(PageData pd)throws Exception{
		dao.update("goodsMapper.updateGoods", pd);
	}
	
	

	/*
	* 根据id获取详情数据，用于修改
	*/
	public PageData getDataByID(PageData pd)throws Exception{
		return (PageData)dao.findForObject("goodsMapper.getDataByID", pd);
	}
	
	
	/*
	* 删除
	*/
	public void deleteGoods(PageData pd)throws Exception{
		dao.delete("goodsMapper.deleteGoods", pd);
	}
	
	
	
	/************************删除入库单操作********************************/
	
	
	/*
	* 批量删除
	*/
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("StorageMapper.deleteAll", ArrayDATA_IDS);
	}
	
}

