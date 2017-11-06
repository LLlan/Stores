package com.yizhan.service.business.jinhuo;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fh.util.Const;
import com.yizhan.dao.DaoSupport;
import com.yizhan.entity.Page;
import com.yizhan.util.PageData;


@Service("jinhuoService")
public class JinhuoService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	
	/*
	*列表
	*/
	public List<PageData>jinhuolistPage(Page page)throws Exception{
		return (List<PageData>)dao.findForList("jinhuoMapper.jinhuolistPage", page);
	}
	
	
	/*
	* 新增
	*/
	public void saveJinhuo(PageData pd)throws Exception{
		dao.save("jinhuoMapper.saveJinhuo", pd);
	}
	
	
	/*
	* 修改
	*/
	public void updateJinhuo(PageData pd)throws Exception{
		dao.update("jinhuoMapper.updateJinhuo", pd);
	}
	
	

	/*
	* 根据id获取详情数据，用于修改
	*/
	public PageData getDataByID(PageData pd)throws Exception{
		return (PageData)dao.findForObject("jinhuoMapper.getDataByID", pd);
	}
	
	
	/*
	* 删除
	*/
	public void deleteJinhuo(PageData pd)throws Exception{
		dao.delete("jinhuoMapper.deleteJinhuo", pd);
	}
	
	

	/*
	* 根据id获取详情数据，用于修改
	*/
	public PageData getDataToView(PageData pd)throws Exception{
		return (PageData)dao.findForObject("jinhuoMapper.getDataToView", pd);
	}
	
	
	
	
	/************************删除入库单操作********************************/
	
	
	/*
	* 批量删除
	*/
	public void deleteAll(String[] ArrayDATA_IDS)throws Exception{
		dao.delete("StorageMapper.deleteAll", ArrayDATA_IDS);
	}
	
}

