package com.yizhan.service.enrollSystem.system;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yizhan.dao.DaoSupport;
import com.yizhan.entity.Page;
import com.yizhan.util.PageData;

@Service("expertPositionService")
public class ExpertPositionService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**
	 * 获取列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getlistPage(Page page) throws Exception{
		return (List<PageData>) dao.findForList("expertPositionMapper.getlistPage", page);
	}
	
	/**
	 * 添加信息
	 * @param pd
	 * @throws Exception
	 */
	public void insert(PageData pd) throws Exception{
		dao.save("expertPositionMapper.insert", pd);
	}
	
	/**
	 * 根据主键ID获取对象信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getDateById(PageData pd) throws Exception{
		return (PageData) dao.findForObject("expertPositionMapper.getDateById", pd);
	}
	
	/**
	 * 根据name获取对象信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getDateByName(PageData pd) throws Exception{
		return (PageData) dao.findForObject("expertPositionMapper.getDateByName", pd);
	}
	
	/**
	 * 修改指定信息
	 * @param pd
	 * @throws Exception
	 */
	public void update(PageData pd) throws Exception{
		dao.update("expertPositionMapper.update", pd);
	}
	
	/**
	 * 删除操作
	 * @param pd
	 * @throws Exception
	 */
	public void delete(Map<String, Object> map) throws Exception{
		dao.delete("expertPositionMapper.delete", map);
	}
	
	/**
	 * 获取列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getlist(PageData pd) throws Exception{
		return (List<PageData>) dao.findForList("expertPositionMapper.getlist", pd);
	}
}
