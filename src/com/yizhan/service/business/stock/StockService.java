package com.yizhan.service.business.stock;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yizhan.dao.DaoSupport;
import com.yizhan.entity.Page;
import com.yizhan.util.PageData;


@Service("stockService")
public class StockService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	
	/*
	*列表
	*/
	public List<PageData>stocklistPage(Page page)throws Exception{
		return (List<PageData>)dao.findForList("stockMapper.stocklistPage", page);
	}
	
	
	/*
	* 新增
	*/
	public void saveStock(PageData pd)throws Exception{
		dao.save("stockMapper.saveStock", pd);
	}
	
	
	/*
	* 修改
	*/
	public void updateStock(PageData pd)throws Exception{
		dao.update("stockMapper.updateStock", pd);
	}
	
	

	/*
	* 根据id获取详情数据，用于修改
	*/
	public PageData getDataByID(PageData pd)throws Exception{
		return (PageData)dao.findForObject("stockMapper.getDataByID", pd);
	}
	
	
	/*
	* 删除
	*/
	public void deleteStock(PageData pd)throws Exception{
		dao.delete("stockMapper.deleteStock", pd);
	}
	
	
	
	/************************删除入库单操作********************************/
	
	
	/*
	* 批量删除
	*/
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("StorageMapper.deleteAll", ArrayDATA_IDS);
	}
	
}

