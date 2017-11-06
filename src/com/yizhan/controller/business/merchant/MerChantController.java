package com.yizhan.controller.business.merchant;

import java.io.PrintWriter;
import java.net.URLDecoder;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.session.Session;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.yizhan.controller.base.BaseController;
import com.yizhan.entity.Page;
import com.yizhan.entity.system.User;
import com.yizhan.service.business.goods.GoodsService;
import com.yizhan.service.business.merchant.MerChantService;
import com.yizhan.util.AppUtil;
import com.yizhan.util.DateUtil;
import com.yizhan.util.ObjectExcelView;
import com.yizhan.util.Const;
import com.yizhan.util.OrderNoUtil;
import com.yizhan.util.PageData;
import com.yizhan.util.Tools;
/** 
 * 类名称：商家信息
 * 创建人：yizhan 
 * 创建时间：2016-10-26
 */
@Controller
@RequestMapping(value="/merchant")
public class MerChantController extends BaseController {
	@Resource(name="merChantService")
	private MerChantService merChantService;
	
	/**
	 * 保存商品
	 * 功能：
	 * 作者：lj
	 * 日期：2017-2-6
	 */
	@RequestMapping(value="/saveMerChant")
	public ModelAndView saveGoods() throws Exception{
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("merchant_id", this.get32UUID());
		merChantService.saveMerChant(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	

	/**
	 * 去新增页面
	 */
	@RequestMapping(value="/goAddPage")
	public ModelAndView goAddPage()throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		//把结果集放在mv中
		mv.addObject("msg", "saveMerChant");
		mv.addObject("pd", pd);
		//页面跳转
		mv.setViewName("business/merchant/merchant_edit");
		return mv;
	}
	
	/**
	 * 商品列表
	 * 功能：
	 * 作者：lj
	 * 日期：2017-2-6
	 */
	@RequestMapping(value="/MerChantlistPage")
	public ModelAndView goodsListPage(Page page) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		List<PageData> merChantList = merChantService.MerChantlistPage(page);
		
		mv.addObject("merChantList", merChantList);
		mv.setViewName("business/merchant/merchant_list");
		return mv;
		
	}
	
	/**
	 * 去修改页面，并把详细数据查出来显示在页面上
	 * 功能：
	 * 作者：lj
	 * 日期：2017-2-6
	 */
	@RequestMapping(value="/edit")
	public ModelAndView editGoods() throws Exception{
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("merchant_id", pd.get("tagID"));
		pd = merChantService.getDataByID(pd);
		mv.addObject("pd",pd);
		mv.addObject("msg","update");
		mv.setViewName("business/merchant/merchant_edit");
		return mv;
	}
	
	/**
	 * 修改商品
	 * 功能：
	 * 作者：lj
	 * 日期：2017-2-6
	 */
	@RequestMapping(value="/update")
	public ModelAndView update() throws Exception{
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		merChantService.updateMerChant(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 删除
	 * @throws Exception
	 */
	@RequestMapping(value="/del")
	public void delete(PrintWriter writer) throws Exception{
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("merchant_id", pd.getString("tagID"));
		merChantService.deleteMerChant(pd);
		writer.close();
	}
	
	
	
	
	/* ===============================权限================================== */
	public Map<String, String> getHC(){
		Subject currentUser = SecurityUtils.getSubject();  //shiro管理的session
		Session session = currentUser.getSession();
		return (Map<String, String>)session.getAttribute(Const.SESSION_QX);
	}
	/* ===============================权限================================== */
	
	@InitBinder
	public void initBinder(WebDataBinder binder){
		 //让name属性无法被接收
        //binder.setDisallowedFields("name");
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		binder.registerCustomEditor(Date.class, new CustomDateEditor(format,true));
	}
}
