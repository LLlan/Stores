package com.yizhan.controller.business.jinhuo;

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
import com.yizhan.service.business.jinhuo.JinhuoService;
import com.yizhan.service.business.kucun.kucunService;
import com.yizhan.service.business.stock.StockService;
import com.yizhan.util.AppUtil;
import com.yizhan.util.DateUtil;
import com.yizhan.util.ObjectExcelView;
import com.yizhan.util.Const;
import com.yizhan.util.OrderNoUtil;
import com.yizhan.util.PageData;
import com.yizhan.util.Tools;
/** 
 * 类名称：进货
 * 创建人：lj 
 * 创建时间：2016-10-26
 */
@Controller
@RequestMapping(value="/jinhuo")
public class JinhuoController extends BaseController {
	
	@Resource(name="jinhuoService")
	private JinhuoService jinhuoService;
	@Resource(name="goodsService")
	private GoodsService goodsService;
	@Resource(name="kucunService")
	private kucunService kucunService;
	
	/**
	 * 保存库存
	 * 功能：
	 * 作者：lj
	 * 日期：2017-2-6
	 */
	@RequestMapping(value="/saveJinhuo")
	public ModelAndView saveJinhuo() throws Exception{
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		PageData pd2 = new PageData();
		PageData pd3 = new PageData();
		pd = this.getPageData();
		pd.put("sp_id", this.get32UUID());
		jinhuoService.saveJinhuo(pd);
		
		
		//根据物品id查询该物品是否存在库存
		PageData resultData = kucunService.selectKucunExist(pd);
		//进货，判断库存被是否存在改物品的库存，存在即修改
		if(resultData!=null){
			//已存在的库存
			Double r_weight = Double.valueOf(resultData.get("weight").toString()).doubleValue();   
			//要页面传来的要添加的数量
			Double shuliang = Double.valueOf(pd.getString("shuliang")).doubleValue();
			//最后要修改的库存
			Double weight = r_weight + shuliang;
			pd3.put("weight", weight);
			pd3.put("spmc_id", pd.getString("spmc_id"));
			//修改
			kucunService.updatekucunByExist(pd3);
			
		}else{
			//新增到库存
			pd2.put("kucun_id", this.get32UUID());
			pd2.put("spmc_id", pd.get("spmc_id"));
			pd2.put("jinhuo_id", pd.get("sp_id"));
			pd2.put("weight", pd.get("shuliang"));
			kucunService.saveKucun(pd2);
		}
		
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	

	/**
	 * 去新增页面
	 */
	@RequestMapping(value="/goAddPage")
	public ModelAndView goAddPage(Page page)throws Exception{
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		
		Subject subject = SecurityUtils.getSubject();
		Session session = subject.getSession();
		User user = (User)session.getAttribute(Const.SESSION_USER);
		pd.put("userName", user.getNAME());
		pd.put("jinhuo_time", DateUtil.getTime());
		mv.addObject("msg", "saveJinhuo");
		mv.addObject("pd", pd);
		List<PageData> goodsList =  goodsService.goodslist(page);
		mv.addObject("goodsList", goodsList);
		
		
		
		//页面跳转
		mv.setViewName("business/jinhuo/jinhuo_edit");
		return mv;
	}
	
	/**
	 * 库存列表
	 * 功能：
	 * 作者：lj
	 * 日期：2017-2-6
	 */
	@RequestMapping(value="/jinhuoListPage")
	public ModelAndView jinhuoListPage(Page page) throws Exception{
		logBefore(logger, "进货列表jinhuoListPage");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		page.setPd(pd);
		List<PageData> jinhuoList = jinhuoService.jinhuolistPage(page);
		mv.addObject("pd", pd);
		mv.addObject("jinhuoList", jinhuoList);
		mv.setViewName("business/jinhuo/jinhuo_list");
		return mv;
		
	}
	
	/**
	 * 去修改页面，并把详细数据查出来显示在页面上
	 * 功能：
	 * 作者：lj
	 * 日期：2017-2-6
	 */
	@RequestMapping(value="/edit")
	public ModelAndView edit(Page page) throws Exception{
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		pd.put("sp_id", pd.get("tagID"));
		pd=jinhuoService.getDataByID(pd);
		mv.addObject("pd",pd);
		List<PageData> goodsList =  goodsService.goodslist(page);
		mv.addObject("goodsList", goodsList);
		mv.addObject("msg","update");
		mv.setViewName("business/jinhuo/jinhuo_edit");
		return mv;
	}
	
	/**
	 * 修改库存
	 * 功能：
	 * 作者：lj
	 * 日期：2017-2-6
	 */
	@RequestMapping(value="/update")
	public ModelAndView update() throws Exception{
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		PageData pd2 = new PageData();
		pd = this.getPageData();
		jinhuoService.updateJinhuo(pd);
		//修改库存
		pd2.put("jinhuo_id", pd.get("sp_id"));
		pd2.put("spmc_id", pd.get("spmc_id"));
		pd2.put("weight", pd.get("shuliang"));
		kucunService.updatekucun(pd2);
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
		PageData pd2 = new PageData();
		pd = this.getPageData();
		pd.put("sp_id", pd.getString("tagID"));
		pd.put("spmc_id", pd.getString("spmc_id"));
		//根据物品id查询该物品是否存在库存
		PageData resultData = kucunService.selectKucunExist(pd);
		//进货，判断库存被是否存在改物品的库存，存在即修改
		if(resultData!=null){
			//已存在的库存
			Double r_weight = Double.valueOf(resultData.get("weight").toString()).doubleValue();   
			//要页面传来的要添加的数量
			Double ym_weight = Double.valueOf(pd.getString("shuliang")).doubleValue(); 
			//货品id
			pd2.put("spmc_id", pd.getString("spmc_id"));
			//最后要修改的库存
			Double weight = r_weight - ym_weight;
			pd2.put("weight", weight);
			//修改
			kucunService.updatekucunByExist(pd2);
			
		}
		//删除
		jinhuoService.deleteJinhuo(pd);
		writer.close();
	}
	
	
	/**
	 * 详情
	 */
	@RequestMapping(value="/view")
	public ModelAndView view(){
		logBefore(logger, "详情view");
		ModelAndView mv = this.getModelAndView();
		PageData pd = new PageData();
		try{
			pd = this.getPageData();
			pd.put("sp_id", pd.get("sp_id"));
			pd = jinhuoService.getDataToView(pd);
			mv.addObject("pd",pd);
			mv.setViewName("view/jinhuo_print");
			mv.addObject(Const.SESSION_QX,this.getHC());	//按钮权限
		} catch(Exception e){
			logger.error(e.toString(), e);
		}
		return mv;
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
