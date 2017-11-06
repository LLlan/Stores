package com.yizhan.service.enrollSystem.system;

import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.yizhan.dao.DaoSupport;
import com.yizhan.entity.Page;
import com.yizhan.util.PageData;

@Service("subjectService")
public class SubjectService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	/**
	 * 获取列表
	 * @param page
	 * @return
	 * @throws Exception
	 */
	public List<PageData> subjectlistPage(Page page) throws Exception{
		return (List<PageData>) dao.findForList("subjectMapper.subjectlistPage", page);
	}
	
	/**
	 * 添加信息
	 * @param pd
	 * @throws Exception
	 */
	public void insert(PageData pd) throws Exception{
		dao.save("subjectMapper.insert", pd);
	}
	
	/**
	 * 根据主键ID获取对象信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getDateById(PageData pd) throws Exception{
		return (PageData) dao.findForObject("subjectMapper.getDateById", pd);
	}
	
	/**
	 * 根据name获取对象信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getDateByName(PageData pd) throws Exception{
		return (PageData) dao.findForObject("subjectMapper.getDateByName", pd);
	}
	
	/**
	 * 修改指定信息
	 * @param pd
	 * @throws Exception
	 */
	public void update(PageData pd) throws Exception{
		dao.update("subjectMapper.update", pd);
	}
	
	/**
	 * 删除操作
	 * @param pd
	 * @throws Exception
	 */
	public void delete(Map<String, Object> map) throws Exception{
		dao.delete("subjectMapper.delete", map);
	}
}
