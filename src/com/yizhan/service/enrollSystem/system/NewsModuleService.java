package com.yizhan.service.enrollSystem.system;

import java.util.List;
import java.util.Map;
import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yizhan.dao.DaoSupport;
import com.yizhan.entity.Page;
import com.yizhan.util.PageData;

@Service("newsModuleService")
public class NewsModuleService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**
	 * 获取列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getlistPage(Page page) throws Exception{
		return (List<PageData>) dao.findForList("newsModuleMapper.getlistPage", page);
	}
	/**
	 * 获取列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getList(PageData pd) throws Exception{
		return (List<PageData>) dao.findForList("newsModuleMapper.getList", pd);
	}
	/**
	 * 获取列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getListAll(PageData pd) throws Exception{
		return (List<PageData>) dao.findForList("newsModuleMapper.getListAll", pd);
	}
	
	/**
	 * 添加信息
	 * @param pd
	 * @throws Exception
	 */
	public void insert(PageData pd) throws Exception{
		dao.save("newsModuleMapper.insert", pd);
	}
	
	/**
	 * 根据主键ID获取对象信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getDateById(PageData pd) throws Exception{
		return (PageData) dao.findForObject("newsModuleMapper.getDateById", pd);
	}
	
	/**
	 * 修改指定信息
	 * @param pd
	 * @throws Exception
	 */
	public void update(PageData pd) throws Exception{
		dao.update("newsModuleMapper.update", pd);
	}
	
	/**
	 * 删除操作
	 * @param pd
	 * @throws Exception
	 */
	public void delete(Map<String, Object> map) throws Exception{
		dao.delete("newsModuleMapper.delete", map);
	}
	
	/**
	 * 获取指定id集合的数据
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> getListByIds(Map<String, Object> map) throws Exception{
		return (List<PageData>) dao.findForList("newsModuleMapper.getListByIds", map);
	}
	
	/**
	 * 删除图片路径
	 * @param pd
	 * @throws Exception
	 */
	public void deleteImgPath(PageData pd)throws Exception{
		dao.update("newsModuleMapper.deleteImgPath", pd);
	}
	
	/**
	 * 获取指定条件下的所有主图信息
	 * @param pd
	 * @throws Exception
	 */
	public List<PageData> getListByCondition(PageData pd) throws Exception{
		return (List<PageData>) dao.findForList("newsModuleMapper.getListByCondition", pd);
	}
}
