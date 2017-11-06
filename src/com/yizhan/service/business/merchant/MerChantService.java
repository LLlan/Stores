package com.yizhan.service.business.merchant;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yizhan.dao.DaoSupport;
import com.yizhan.entity.Page;
import com.yizhan.util.PageData;


@Service("merChantService")
public class MerChantService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	
	/*
	*列表
	*/
	public List<PageData> MerChantlistPage(Page page)throws Exception{
		return (List<PageData>)dao.findForList("merchantMapper.MerChantlistPage", page);
	}
	
	
	/*
	* 新增
	*/
	public void saveMerChant(PageData pd)throws Exception{
		dao.save("merchantMapper.saveMerChant", pd);
	}
	
	
	/*
	* 修改
	*/
	public void updateMerChant(PageData pd)throws Exception{
		dao.update("merchantMapper.updateMerChant", pd);
	}
	
	

	/*
	* 根据id获取详情数据，用于修改
	*/
	public PageData getDataByID(PageData pd)throws Exception{
		return (PageData)dao.findForObject("merchantMapper.getDataByID", pd);
	}
	
	
	/*
	* 删除
	*/
	public void deleteMerChant(PageData pd)throws Exception{
		dao.delete("merchantMapper.deleteMerChant", pd);
	}
	
	
	
	/************************删除入库单操作********************************/
	
	
	/*
	* 批量删除
	*/
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("StorageMapper.deleteAll", ArrayDATA_IDS);
	}
	
}

