package com.yizhan.service.system.appuser;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.yizhan.dao.DaoSupport;
import com.yizhan.entity.Page;
import com.yizhan.util.PageData;


@Service("appuserService")
public class AppuserService {

	@Resource(name = "daoSupport")
	private DaoSupport dao;
	
	
	/**
	 *app用户列表
	 * 作者：lj
	 * 日期：2016-12-22
	 */
	public List<PageData> appUserlistPage(Page page)throws Exception{
		return (List<PageData>) dao.findForList("AppuserMapper.appUserlistPage", page);
	}
	
	/*
	* 通过id获取数据
	*/
	public PageData findByPhone(PageData pd)throws Exception{
		return (PageData)dao.findForObject("AppuserMapper.findByPhone", pd);
	}
	
	
	/*
	* 保存用户
	*/
	public void saveU(PageData pd)throws Exception{
		dao.save("AppuserMapper.saveU", pd);
	}
	
	/*
	* 登录判断
	*/
	public PageData getUserByNameAndPwd(PageData pd)throws Exception{
		return (PageData)dao.findForObject("AppuserMapper.getUserByNameAndPwd", pd);              
	}
	
	/*
	 * 查该用户是否完善资料
	 */
	public PageData getCompleteDataByPhone(PageData pd)throws Exception{	
		return (PageData)dao.findForObject("AppuserMapper.getCompleteDataByPhone", pd);              
	}
	
	
	
	/**
	 * 根据电话号码获取业主个人信息
	 * 作者：lj
	 * 日期：2016-12-19
	 */
	public PageData getProprietorByPhone(PageData pd) throws Exception{
		return (PageData)dao.findForObject("AppuserMapper.getProprietorByPhone", pd);
	}
	
	
	/**
	 * 
	 * 功能：修改密码
	 * 作者：lj
	 * 日期：2016-12-17
	 * @throws Exception 
	 */
	public void updatePwd(PageData pd) throws Exception{
		dao.update("AppuserMapper.updatePwd", pd);
	}
	
	/*
	* 更新最近一次登录时间
	*/
	public void updateLastLogin(PageData pd)throws Exception{
		dao.update("AppuserMapper.updateLastLogin", pd);
	}
	
	
	/*
	* 保存设备报修的图片
	*/
	public void saveRepairsImage(PageData pd)throws Exception{
		dao.save("AppuserMapper.saveRepairsImage", pd);
	}
	

	/*
	* 保存用户投诉
	*/
	public void saveComplaint(PageData pd)throws Exception{
		dao.save("AppuserMapper.saveComplaint", pd);
	}
	
	/*
	* 保存用户投诉的图片
	*/
	public void saveComplaintImage(PageData pd)throws Exception{
		dao.save("AppuserMapper.saveComplaintImage", pd);
	}
	
	
	/**
	 *更新投诉图片id
	 * 
	 */
	public void updateComplaintImageId(PageData pd) throws Exception{
		dao.update("AppuserMapper.updateComplaintImageId", pd);
	}
	
	
	/**
	 * 保存用户反馈信息
	 * @param pd
	 * @throws Exception
	 */
	public void saveFeedBack(PageData pd) throws Exception{
		dao.save("feedbackMapper.savefeedback", pd);
	}
	
	
	//======================================================================================
	
	/*
	* 通过id获取数据
	*/
	public PageData findByUiId(PageData pd)throws Exception{
		return (PageData)dao.findForObject("AppuserMapper.findByUiId", pd);
	}
	/*
	* 通过loginname获取数据
	*/
	public PageData findByUId(PageData pd)throws Exception{
		return (PageData)dao.findForObject("AppuserMapper.findByUId", pd);
	}
	
	/*
	* 通过邮箱获取数据
	*/
	public PageData findByUE(PageData pd)throws Exception{
		return (PageData)dao.findForObject("AppuserMapper.findByUE", pd);
	}
	
	/*
	* 通过编号获取数据
	*/
	public PageData findByUN(PageData pd)throws Exception{
		return (PageData)dao.findForObject("AppuserMapper.findByUN", pd);
	}
	

	/*
	* 修改用户
	*/
	public void editU(PageData pd)throws Exception{
		dao.update("AppuserMapper.editU", pd);
	}
	/*
	* 删除用户
	*/
	public void deleteU(PageData pd)throws Exception{
		dao.delete("AppuserMapper.deleteU", pd);
	}
	/*
	* 批量删除用户
	*/
	public void deleteAllU(String[] USER_IDS)throws Exception{
		dao.delete("AppuserMapper.deleteAllU", USER_IDS);
	}
	/*
	*用户列表(全部)
	*/
	public List<PageData> listAllUser(PageData pd)throws Exception{
		return (List<PageData>) dao.findForList("AppuserMapper.listAllUser", pd);
	}
	
	/*
	*用户列表(用户组)
	*/
	public List<PageData> listPdPageUser(Page page)throws Exception{
		return (List<PageData>) dao.findForList("AppuserMapper.userlistPage", page);
	}
	
	/*
	* 保存用户IP
	*/
	public void saveIP(PageData pd)throws Exception{
		dao.update("AppuserMapper.saveIP", pd);
	}
	
	
	
	//======================================================================================
	
	
}

