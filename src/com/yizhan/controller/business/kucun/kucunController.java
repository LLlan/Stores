package com.yizhan.controller.business.kucun;

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
 * 类名称：库存
 * 创建人：lj 
 * 创建时间：2016-10-26
 */
@Controller
@RequestMapping(value="/kucun")
public class kucunController extends BaseController {
	@Resource(name="stockService")
	private StockService stockService;
	@Resource(name="kucunService")
	private kucunService kucunService;
	
	
	/**
	 * 库存列表
	 * 功能：
	 * 作者：lj
	 * 日期：2017-2-6
	 */
	@RequestMapping(value="/kucunlistPage")
	public ModelAndView stockListPage(Page page) throws Exception{
		ModelAndView mv = new ModelAndView();
		List<PageData> kucunList = kucunService.kucunlistPage(page);
		mv.addObject("kucunList", kucunList);
		mv.setViewName("business/kucun/kucun_list");
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
		pd.put("stock_id", pd.get("tagID"));
		pd=stockService.getDataByID(pd);
		mv.addObject("pd",pd);
		mv.addObject("msg","update");
		mv.setViewName("business/stock/stock_edit");
		return mv;
	}
	
	
	/**
	 * 根据商品id获取库存
	 * 功能：
	 * 作者：lj
	 * 日期：2017-2-6
	 */
	@RequestMapping(value="/getKucunByspmcId")
	@ResponseBody
	public Object getKucunByspmcId() throws Exception{
		PageData pd = new PageData();
		Map map = new HashMap();
		pd = this.getPageData();
		pd.put("spmc_id", pd.get("tagetID"));
		pd=kucunService.getKucunByspmcId(pd);
		map.put("weight", pd.get("weight"));
		map.put("kucun_id", pd.get("kucun_id"));
		map.put("spmc_id", pd.get("spmc_id"));
		return AppUtil.returnObject(pd, map);
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
		pd = this.getPageData();
		stockService.updateStock(pd);
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
		pd.put("stock_id", pd.getString("tagID"));
		stockService.deleteStock(pd);
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
