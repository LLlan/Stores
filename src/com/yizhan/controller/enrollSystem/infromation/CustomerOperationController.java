package com.yizhan.controller.enrollSystem.infromation;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import com.yizhan.controller.base.BaseController;
import com.yizhan.entity.Page;
import com.yizhan.service.enrollSystem.information.CustomerOperationService;
import com.yizhan.service.enrollSystem.system.ContactUsService;
import com.yizhan.service.enrollSystem.system.ExpertLibraryService;
import com.yizhan.service.enrollSystem.system.MainImgService;
import com.yizhan.service.enrollSystem.system.NewsDetailesService;
import com.yizhan.service.enrollSystem.system.NewsModuleService;
import com.yizhan.service.enrollSystem.system.TrainCategoryService;
import com.yizhan.util.AppUtil;
import com.yizhan.util.ChineseUtill;
import com.yizhan.util.DateUtil;
import com.yizhan.util.PageData;
import com.yizhan.util.Tools;

/** 
 * 类名称：用户操作（前端操作）控制层
 * 创建人：zjh 
 * 创建时间：2017-9-28 11:19:35
 */
@Controller
@RequestMapping(value="/api/customerOperation")
public class CustomerOperationController extends BaseController{

	@Resource(name="mainImgService")
	private MainImgService mainImgService;
	
	@Resource(name="trainCategoryService")
	private TrainCategoryService trainCategoryService;
	
	@Resource(name="customerOperationService")
	private CustomerOperationService customerOperationService;
	
	@Resource(name="contactUsService")
	private ContactUsService contactUsService;
	
	@Resource(name="expertLibraryService")
	private ExpertLibraryService expertLibraryService;
	
	@Resource(name="newsModuleService")
	private NewsModuleService newsModuleService;
	
	@Resource(name="newsDetailesService")
	private NewsDetailesService newsDetailesService;
	
	//TODO 新闻资讯
	/**
	 * 新闻资讯中心
	 */
	@RequestMapping(value="/newsCenter")
	public ModelAndView newsCenter()throws Exception{
		logBefore(logger, "新闻资讯获取列表");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		
		//获取主页大图
		PageData pd1 = new PageData();
		pd1.put("type", 2); 
		pd1.put("status", 1); 
		List<PageData> mainImgList=mainImgService.getListByCondition(pd1);
		mv.addObject("mainImgList", mainImgList);
		
		//获取新闻资讯模块
		PageData pd2=new PageData();
		pd2.put("status", 1);
		List<PageData> list=newsModuleService.getList(pd2);
		mv.addObject("list", list);
		
		mv.setViewName("enrollSystem/information/xinwenZixun");
		return mv;
	}
	
	/**
	 * 新闻资讯列表
	 */
	@RequestMapping(value="/newsList")
	public ModelAndView newsList()throws Exception{
		logBefore(logger, "新闻资讯列表");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		
		//获取资讯列表
		pd.put("news_module_fid", pd.getString("news_module_id")); 
		List<PageData> newsList=newsDetailesService.getList(pd);
		mv.addObject("newsList", newsList);
		
		mv.setViewName("enrollSystem/information/zhengce");
		return mv;
	}
	
	/**
	 * 新闻资讯详情
	 */
	@RequestMapping(value="/newsDetailes")
	public ModelAndView newsDetailes()throws Exception{
		logBefore(logger, "新闻资讯详情");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		
		//新闻资讯详情
		pd.put("news_detailes_id", pd.getString("news_detailes_id")); 
		PageData newsDetailes=newsDetailesService.getDateById(pd);
		mv.addObject("newsDetailes", newsDetailes);
		
		mv.setViewName("enrollSystem/information/xiangqing");
		return mv;
	}
	
	//TODO 服务中心
	/**
	 * 服务中心
	 */
	@RequestMapping(value="/serviceCenter")
	public ModelAndView serviceCenter()throws Exception{
		logBefore(logger, "获取列表");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		
		//获取主页大图
		PageData pd1 = new PageData();
		pd1.put("type", 1); 
		pd1.put("status", 1); 
		List<PageData> mainImgList=mainImgService.getListByCondition(pd1);
		mv.addObject("mainImgList", mainImgList);
		
		mv.setViewName("enrollSystem/information/fuwuCenter");
		return mv;
	}
	
	//TODO 我要报名
	//1.前台
	/**
	 * 报名时选择培训工种
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/toEnrollOfSelectTrainCategory")
	public ModelAndView toEnrollOfSelectTrainCategory() throws Exception{
		logBefore(logger, "报名时选择培训工种");
		ModelAndView mv=new ModelAndView();
		
		//获取主页大图
		PageData pd1 = new PageData();
		pd1.put("type", 3); 
		pd1.put("status", 1); 
		List<PageData> mainImgList=mainImgService.getListByCondition(pd1);
		mv.addObject("mainImgList", mainImgList);
		
		//获取培训工种
		PageData pd2=new PageData();
		pd2.put("status", 1);
		List<PageData> list=trainCategoryService.getListByCondition(pd2);
		mv.addObject("list", list);
		
		mv.setViewName("enrollSystem/information/baoming1");
		return mv;
	}
	
	/**
	 * 填写报名信息
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/toEnrollOfWriteEnrollInfo")
	public ModelAndView toEnrollOfWriteEnrollInfo() throws Exception{
		logBefore(logger, "填写报名信息");
		ModelAndView mv=new ModelAndView();
		PageData pd=new PageData();
		pd=this.getPageData();
		
		System.out.println("--------------是否乱码---------------："+pd.getString("train_category_name"));
		mv.addObject("train_category_name", ChineseUtill.toChinese(pd.getString("train_category_name")));
		mv.setViewName("enrollSystem/information/baoming");
		return mv;
	}
	
	@RequestMapping(value="/isExsitOfEnrollInfo")
	@ResponseBody
	public Object isExsitOfEnrollInfo() throws Exception{
		logBefore(logger, "是否已经报名");
		Map<String, Object> map = new HashMap<String, Object>();
		PageData pd = new PageData();
		pd=this.getPageData();
		
		String respCode="00";
		String respMsg="已经报名";
		
		//tempData==null 时：说明尚未报名
		PageData tempData=customerOperationService.getDataByIdcardAndTrainname(pd);
		if(tempData==null){
			respCode="01";
			respMsg="尚未报名";
		}
		
		map.put("respCode", respCode);
		map.put("respMsg", respMsg);
		map.put("tempData", tempData);
		return AppUtil.returnObject(pd, map);
	}
	
	/**
	 * 保存报名信息
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/saveEnrollInfo")
	public ModelAndView saveEnrollInfo() throws Exception{
		logBefore(logger, "保存报名信息");
		ModelAndView mv=new ModelAndView();
		PageData pd=new PageData();
		pd=this.getPageData();
		
		//保存
		PageData savePd=new PageData();
		savePd.put("enroll_info_id", this.get32UUID());
		savePd.put("userName", pd.getString("userName"));
		savePd.put("sex", pd.getString("sex"));
		savePd.put("ID_number", pd.getString("ID_number"));
		savePd.put("compayName", pd.getString("compayName"));
		savePd.put("tax_number", pd.getString("tax_number"));
		savePd.put("contact_number", pd.getString("contact_number"));
		savePd.put("company_detaile_address", pd.getString("company_detaile_address"));
		savePd.put("diploma_receive_method", pd.getString("diploma_receive_method"));
		savePd.put("train_category_name", pd.getString("train_category_name"));
		savePd.put("addTime", DateUtil.getTime());
		customerOperationService.saveEnrollInfo(savePd);
		
		mv.addObject("pd", pd);
		mv.setViewName("enrollSystem/information/success");
		//mv.setViewName("redirect:api/customerOperation/serviceCenter.do");
		return mv;
	}
	
	//2.后台
	/**
	 * 获取报名信息
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/getEnrollInfolistPage")
	public ModelAndView getEnrollInfolistPage(Page page) throws Exception{
		logBefore(logger, "获取报名信息");
		ModelAndView mv=new ModelAndView();
		PageData pd=new PageData();
		pd=this.getPageData();
		
		List<PageData> list=customerOperationService.getEnrollInfolistPage(page);
		mv.addObject("pd", pd);
		mv.addObject("list", list);
		
		mv.addObject("pd", pd);
		mv.setViewName("enrollSystem/system/enrollInfor/enrollInfor_list");
		return mv;
	}
	
	
	//TODO 成绩查询(证书查询)
	/**
	 * 去成绩查询(证书查询)页面
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/toSearch")
	public ModelAndView toSearchMark() throws Exception{
		logBefore(logger, "去成绩查询(证书查询)页面");
		ModelAndView mv=new ModelAndView();
		PageData pd=new PageData();
		pd=this.getPageData();
		
		mv.addObject("pd", pd);
		mv.setViewName("enrollSystem/information/search");
		return mv;
	}
	
	/**
	 * 成绩查询(证书查询)结果
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/searchResult")
	public ModelAndView searchMarkResult() throws Exception{
		logBefore(logger, "成绩查询(证书查询)结果");
		ModelAndView mv=new ModelAndView();
		PageData pd=new PageData();
		pd=this.getPageData();
		
		//获取信息
		pd.put("ID_number", pd.getString("ID_number"));
		List<PageData> list = customerOperationService.getDataByIdcard(pd);
		
		for (PageData pd1:list) {
			List<PageData> tempList = new ArrayList<PageData>();
			if(Tools.notEmpty(pd1.getString("subjects"))){
				String subjects[]=pd1.getString("subjects").split(",");
				String scores[]=pd1.getString("scores").split(",");
				for (int i = 0; i < subjects.length; i++) {
					PageData tempData = new PageData();
					tempData.put("subject", subjects[i]);
					tempData.put("score", scores[i]);
					tempList.add(tempData);
				}
			}
			pd1.put("cjList", tempList);
		}
		mv.addObject("list", list);
		
		mv.addObject("pd", pd);
		mv.setViewName("enrollSystem/information/result");
		return mv;
	}
	
	//TODO 联系方式
	/**
	 * 联系方式
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/contact")
	public ModelAndView contact() throws Exception{
		logBefore(logger, "联系方式");
		ModelAndView mv=new ModelAndView();
		PageData pd=new PageData();
		pd=this.getPageData();
		
		List<PageData> list = contactUsService.contactUsList(pd);
		mv.addObject("list", list);
		
		mv.setViewName("enrollSystem/information/contact");
		return mv;
	}
	
	//TODO 咨询服务
	//1.前台
	/**
	 * 去咨询服务页面
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/toConsultService")
	public ModelAndView toConsultService() throws Exception{
		logBefore(logger, "去咨询服务页面");
		ModelAndView mv=new ModelAndView();
		
		mv.setViewName("enrollSystem/information/zixunfuwu");
		return mv;
	}
	
	/**
	 * 保存咨询服务信息
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/saveConsultService")
	public ModelAndView saveConsultService() throws Exception{
		logBefore(logger, "保存咨询服务信息");
		ModelAndView mv=new ModelAndView();
		PageData pd=new PageData();
		pd=this.getPageData();
		
		//保存
		PageData savePd=new PageData();
		savePd.put("consult_service_id", this.get32UUID());
		savePd.put("consult_person_name", pd.getString("consult_person_name"));
		savePd.put("contact_number", pd.getString("contact_number"));
		savePd.put("content", pd.getString("content"));
		savePd.put("consult_time", DateUtil.getTime());
		savePd.put("status", "0");
		
		customerOperationService.saveConsultService(savePd);
		
		mv.addObject("pd", pd);
		mv.setViewName("enrollSystem/information/success");
		//mv.setViewName("redirect:api/customerOperation/serviceCenter.do");
		return mv;
	}
	
	//2.后台
	/**
	 * 获取咨询列表
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/getConsultServicelistPage")
	public ModelAndView getConsultServicelistPage(Page page) throws Exception{
		logBefore(logger, "获取列表");
		ModelAndView mv=new ModelAndView();
		PageData pd=new PageData();
		pd=this.getPageData();
		page.setPd(pd);
		
		List<PageData> list=customerOperationService.getConsultServicelistPage(page);
		mv.addObject("pd", pd);
		mv.addObject("list", list);
		
		mv.setViewName("enrollSystem/system/consultService/consultService_list");
		return mv;
	}
	
	//TODO 专家库
	/**
	 * 去搜索专家库页面
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/toSearchExpertLibrary")
	public ModelAndView toSearchExpertLibrary() throws Exception{
		logBefore(logger, "去搜索专家库页面");
		ModelAndView mv=new ModelAndView();
		
		mv.setViewName("enrollSystem/information/zhuangjia");
		return mv;
	}
	
	/**
	 * 搜索专家库结果
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/resultExpertLibrary")
	public ModelAndView resultExpertLibrary() throws Exception{
		logBefore(logger, "搜索专家库结果");
		ModelAndView mv=new ModelAndView();
		PageData pd=new PageData();
		pd=this.getPageData();
		
		String respCode="00";
		
		//查询
		PageData pdInfo = new PageData();
		pdInfo=expertLibraryService.getDateByName(pd);
		if(pdInfo!=null){
			respCode="01";
		}
		mv.addObject("pd", pdInfo);
		
		mv.addObject("userName", pd.getString("userName"));
		mv.addObject("respCode", respCode);
		mv.setViewName("enrollSystem/information/zhuangjia1");
		//mv.setViewName("redirect:api/customerOperation/serviceCenter.do");
		return mv;
	}
}
