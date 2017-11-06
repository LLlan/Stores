package com.yizhan.service.business.kucun;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yizhan.dao.DaoSupport;
import com.yizhan.entity.Page;
import com.yizhan.util.PageData;


@Service("kucunService")
public class kucunService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	
	/*
	*列表
	*/
	public List<PageData>kucunlistPage(Page page)throws Exception{
		return (List<PageData>)dao.findForList("kucunMapper.kucunlistPage", page);
	}
	
	
	/*
	* 新增
	*/
	public void saveKucun(PageData pd)throws Exception{
		dao.save("kucunMapper.saveKucun", pd);
	}
	
	/**
	 * 根据货品id查询库存是否存在
	 * 功能：
	 * 作者：lj
	 * 日期：2017-2-8
	 */
	public PageData selectKucunExist(PageData pd) throws Exception{
		return (PageData)dao.findForObject("kucunMapper.selectkucunExist", pd);
	}
	
	
	/**
	 * 根据货品id查询库存是否存在
	 * 功能：
	 * 作者：lj
	 * 日期：2017-2-8
	 */
	public PageData getKucunByspmcId(PageData pd) throws Exception{
		return (PageData)dao.findForObject("kucunMapper.getKucunByspmcId", pd);
	}
	
	
	
	/*
	* 修改库存
	*/
	public void updatekucun(PageData pd)throws Exception{
		dao.update("kucunMapper.updatekucun", pd);
	}
	
	
	/*
	* 修改已存在的库存
	*/
	public void updatekucunByExist(PageData pd)throws Exception{
		dao.update("kucunMapper.updatekucunByExist", pd);
	}
	
	
	
	/************************删除入库单操作********************************/
	
	
}

