package com.yizhan.service.enrollSystem.information;

import java.util.List;

import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import com.yizhan.dao.DaoSupport;
import com.yizhan.entity.Page;
import com.yizhan.util.PageData;

@Service("customerOperationService")
public class CustomerOperationService {
	
	@Resource(name = "daoSupport")
	private DaoSupport dao;
	//报名信息部分
	//1.前台
	/**
	 * 保存报名信息
	 * @param pd
	 * @throws Exception
	 */
	public void saveEnrollInfo(PageData pd) throws Exception{
		dao.save("customerOperationMapper.saveEnrollInfo", pd);
	}
	
	/**
	 * 根据身份证号以及培训工种获取报名信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public PageData getDataByIdcardAndTrainname(PageData pd) throws Exception{
		return (PageData) dao.findForObject("customerOperationMapper.getDataByIdcardAndTrainname", pd);
	}
	
	/**
	 * 根据身份证号获取报名信息
	 * @param pd
	 * @return
	 * @throws Exception
	 */
	public List<PageData> getDataByIdcard(PageData pd) throws Exception{
		return (List<PageData>) dao.findForList("customerOperationMapper.getDataByIdcard", pd);
	}
	//2.后台
	/**
	 * 获取列表
	 * @param pd
	 * @return
	 * @throws Exception 
	 */
	public List<PageData> getEnrollInfolistPage(Page page) throws Exception{
		return (List<PageData>) dao.findForList("customerOperationMapper.getEnrollInfolistPage", page);
	}
	
	
	
	
	
	
	//咨询服务部分
	//1.前台
	/**
	 * 保存咨询服务信息
	 * @param pd
	 * @throws Exception
	 */
	public void saveConsultService(PageData pd) throws Exception{
		dao.save("customerOperationMapper.saveConsultService", pd);
	}
	//2.后台
	/**
	 * 获取咨询列表
	 * @param pd
	 * @return
	 * @throws Exception 
	 */
	public List<PageData> getConsultServicelistPage(Page page) throws Exception{
		return (List<PageData>) dao.findForList("customerOperationMapper.getConsultServicelistPage", page);
	}
}
