package com.yizhan.service.business.kehu;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yizhan.dao.DaoSupport;
import com.yizhan.entity.Page;
import com.yizhan.util.PageData;


@Service("kehuService")
public class kehuService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	
	/*
	*列表
	*/
	public List<PageData> kehulistPage(Page page)throws Exception{
		return (List<PageData>)dao.findForList("kehuMapper.kehulistPage", page);
	}
	
	
	/*
	* 新增
	*/
	public void saveKehu(PageData pd)throws Exception{
		dao.save("kehuMapper.saveKehu", pd);
	}
	
	
	/*
	* 修改
	*/
	public void updateKehu(PageData pd)throws Exception{
		dao.update("kehuMapper.updateKehu", pd);
	}
	
	

	/*
	* 根据id获取详情数据，用于修改
	*/
	public PageData getDataByID(PageData pd)throws Exception{
		return (PageData)dao.findForObject("kehuMapper.getDataByID", pd);
	}
	
	
	/*
	* 删除
	*/
	public void deleteKehu(PageData pd)throws Exception{
		dao.delete("kehuMapper.deleteKehu", pd);
	}
	
	
	
	
	
}

