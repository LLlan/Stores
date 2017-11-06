package com.yizhan.service.business.bank;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yizhan.dao.DaoSupport;
import com.yizhan.entity.Page;
import com.yizhan.util.PageData;


@Service("bankService")
public class BankService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	
	/*
	*列表
	*/
	public List<PageData> BanklistPage(Page page)throws Exception{
		return (List<PageData>)dao.findForList("bankMapper.BanklistPage", page);
	}
	
	
	/*
	* 新增
	*/
	public void saveBank(PageData pd)throws Exception{
		dao.save("bankMapper.saveBank", pd);
	}
	
	
	/*
	* 修改
	*/
	public void updateBank(PageData pd)throws Exception{
		dao.update("bankMapper.updateBank", pd);
	}
	
	

	/*
	* 根据id获取详情数据，用于修改
	*/
	public PageData getDataByID(PageData pd)throws Exception{
		return (PageData)dao.findForObject("bankMapper.getDataByID", pd);
	}
	
	
	/*
	* 删除
	*/
	public void deleteBank(PageData pd)throws Exception{
		dao.delete("bankMapper.deleteBank", pd);
	}
	
	
	
	/************************删除入库单操作********************************/
	
	
	/*
	* 批量删除
	*/
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("StorageMapper.deleteAll", ArrayDATA_IDS);
	}
	
}

