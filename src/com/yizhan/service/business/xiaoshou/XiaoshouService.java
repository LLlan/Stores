package com.yizhan.service.business.xiaoshou;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fh.util.Const;
import com.yizhan.dao.DaoSupport;
import com.yizhan.entity.Page;
import com.yizhan.util.PageData;


@Service("xiaoshouService")
public class XiaoshouService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	
	/*
	*列表
	*/
	public List<PageData>xiaoshoulistPage(Page page)throws Exception{
		return (List<PageData>)dao.findForList("xiaoshouMapper.xiaoshoulistPage", page);
	}
	
	
	/**
	 * 销售单详情页数据-表格数据(货品数据)
	 * 功能：
	 * 作者：lj
	 * 日期：2017-2-10
	 */
	public List<PageData>xiaoshouGoodsDetail(PageData pd)throws Exception{
		return (List<PageData>)dao.findForList("xiaoshouMapper.xiaoshouGoodsDetail", pd);
	}
	
	

	/**
	 * 销售单详情页数据-表头页尾数据
	 * 功能：
	 * 作者：lj
	 * 日期：2017-2-10
	 */
	public PageData xiaoshouDetail(PageData pd)throws Exception{
		return (PageData)dao.findForObject("xiaoshouMapper.xiaoshouDetail", pd);
	}
	
	
	/*
	* 新增
	*/
	public void saveXiaoShouGoods(PageData pd)throws Exception{
		dao.save("xiaoshouMapper.saveXiaoShouGoods", pd);
	}
	
	
	/*
	* 新增
	*/
	public void saveXiaoShou(PageData pd)throws Exception{
		dao.save("xiaoshouMapper.saveXiaoShou", pd);
	}
	
	
	/*
	* 修改
	*/
	public void updateJinhuo(PageData pd)throws Exception{
		dao.update("xiaoshouMapper.updateJinhuo", pd);
	}
	
	

	/*
	* 根据id获取详情数据，用于修改
	*/
	public PageData getDataByID(PageData pd)throws Exception{
		return (PageData)dao.findForObject("xiaoshouMapper.getDataByID", pd);
	}
	
	
	/*
	* 删除销售表
	*/
	public void deleteXiaoshou(PageData pd)throws Exception{
		dao.delete("xiaoshouMapper.deleteXiaoshou", pd);
	}
	
	
	/*
	 * 删除销售物品表
	 */
	public void deleteXiaoshouGoods(PageData pd)throws Exception{
		dao.delete("xiaoshouMapper.deleteXiaoshouGoods", pd);
	}
	
	

	/*
	* 根据id获取详情数据，用于修改
	*/
	public PageData getDataToView(PageData pd)throws Exception{
		return (PageData)dao.findForObject("xiaoshouMapper.getDataToView", pd);
	}
	
	
	
	
	/************************删除入库单操作********************************/
	
	
}

