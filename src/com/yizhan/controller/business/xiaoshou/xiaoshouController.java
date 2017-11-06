package com.yizhan.controller.business.xiaoshou;

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

import com.hp.hpl.sparta.xpath.ThisNodeTest;
import com.yizhan.controller.base.BaseController;
import com.yizhan.entity.Page;
import com.yizhan.entity.system.User;
import com.yizhan.service.business.bank.BankService;
import com.yizhan.service.business.goods.GoodsService;
import com.yizhan.service.business.jinhuo.JinhuoService;
import com.yizhan.service.business.kehu.kehuService;
import com.yizhan.service.business.kucun.kucunService;
import com.yizhan.service.business.merchant.MerChantService;
import com.yizhan.service.business.stock.StockService;
import com.yizhan.service.business.xiaoshou.XiaoshouService;
import com.yizhan.util.AppUtil;
import com.yizhan.util.DateUtil;
import com.yizhan.util.ObjectExcelView;
import com.yizhan.util.Const;
import com.yizhan.util.OrderNoUtil;
import com.yizhan.util.PageData;
import com.yizhan.util.Tools;
/** 
 * 类名称：销售
 * 创建人：lj 
 * 创建时间：2016-10-26
 */
@Controller
@RequestMapping(value="/xiaoshou")
public class xiaoshouController extends BaseController {
	
	@Resource(name="xiaoshouService")
	private XiaoshouService xiaoshouService;
	@Resource(name="goodsService")
	private GoodsService goodsService;
	@Resource(name="kucunService")
	private kucunService kucunService;
	@Resource(name="kehuService")
	private kehuService kehuService;
	@Resource(name="bankService")
	private BankService bankService;
	@Resource(name="merChantService")
	private MerChantService merChantService;
	/**
	 * 保存库存
	 * 功能：
	 * 作者：lj
	 * 日期：2017-2-6
	 */
	@RequestMapping(value="/saveXiaoshou")
	public ModelAndView saveXiaoshou(HttpServletRequest request) throws Exception{
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		PageData pd2 = new PageData();
		pd = this.getPageData();
		//主键id
		String xiaoshou_id = this.get32UUID();
		PageData xs_Pd = new PageData();
		//销售单id 主键
		xs_Pd.put("xiaoshou_id", xiaoshou_id);
		//顾客名称
		xs_Pd.put("gkmc_id", pd.get("gkmc_id"));
		xs_Pd.put("xiaoshou_time", pd.get("xiaoshou_time"));
		xs_Pd.put("all_totol", pd.get("all_totol"));
		xs_Pd.put("all_totol_dx", pd.get("all_totol_dx"));
		xs_Pd.put("jbr", pd.get("jbr"));
		xs_Pd.put("remark", pd.get("remark"));
		xiaoshouService.saveXiaoShou(xs_Pd);
		
		
		//添加到销售货物表中 
		String spmc_ids[] = request.getParameterValues("spmc_id");
		String ggxhs[] = request.getParameterValues("ggxh");
		String jianshus[] =request.getParameterValues("jianshu");
		String danjias[] =request.getParameterValues("danjia");
		String moneys[] =request.getParameterValues("money");
		String money_dxs[] =request.getParameterValues("money_dx");
		
		for(int i=0;i<moneys.length;i++){
			//添加到销售-货品表中
			PageData xs_goodsPd = new PageData();
			xs_goodsPd.put("xiaoshou_goods_id", this.get32UUID());
			xs_goodsPd.put("xiaoshou_id", xiaoshou_id);
			xs_goodsPd.put("spmc_id", spmc_ids[i]);
			xs_goodsPd.put("ggxh", ggxhs[i]);
			xs_goodsPd.put("jianshu", jianshus[i]);
			xs_goodsPd.put("danjia", danjias[i]);
			xs_goodsPd.put("money", moneys[i]);
			xs_goodsPd.put("money_dx", money_dxs[i]);
			xiaoshouService.saveXiaoShouGoods(xs_goodsPd);
			
			//查库存
			PageData kuncunData = new PageData(); 
		    kuncunData = kucunService.selectKucunExist(xs_goodsPd);
			PageData cData= new PageData();
			//原库存
			Double old_kucun = Double.valueOf(kuncunData.get("weight").toString()).doubleValue();      
			//现在的库存即件数
			Double new_Kucun = Double.valueOf(xs_goodsPd.getString("jianshu")).doubleValue();
			//余下的库存 = 原来的库存 - 销售的库存（件数）
			Double yu_kucun =old_kucun - new_Kucun;
			cData.put("weight", yu_kucun);
			cData.put("spmc_id", xs_goodsPd.getString("spmc_id"));
			//修改
			kucunService.updatekucun(cData);
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
		pd.put("xiaoshou_time", DateUtil.getTime());
		
		mv.addObject("msg", "saveXiaoshou");
		mv.addObject("pd", pd);
		List<PageData> goodsList =  goodsService.goodshaveKucunlistPage(page);
		mv.addObject("goodsList", goodsList);
		
		List<PageData> kehuList  = kehuService.kehulistPage(page);
		mv.addObject("kehuList", kehuList);
		//页面跳转
		mv.setViewName("business/xiaoshou/xiaoshou_edit");
		return mv;
	}
	
	/**
	 * 销售列表
	 * 功能：
	 * 作者：lj
	 * 日期：2017-2-6
	 */
	@RequestMapping(value="/xiaoshouListPage")
	public ModelAndView jinhuoListPage(Page page) throws Exception{
		logBefore(logger, "xiaoshouListPage");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		page.setPd(pd);
		List<PageData> xiaoshouList = xiaoshouService.xiaoshoulistPage(page);
		mv.addObject("xiaoshouList", xiaoshouList);
		mv.setViewName("business/xiaoshou/xiaoshou_list");
		return mv;
		
	}
	
	
	/**
	 * ----详情页----
	 * 功能：
	 * 作者：lj
	 * 日期：2017-2-6
	 */
	@RequestMapping(value="/xiaoshouDetail")
	public ModelAndView xiaoshouDetail(Page page) throws Exception{
		logBefore(logger, "xiaoshouDetail");
		ModelAndView mv = new ModelAndView();
		PageData pd = new PageData();
		pd = this.getPageData();
		//表格数据
		List<PageData> GoodsDetailList = xiaoshouService.xiaoshouGoodsDetail(pd);
		//表头数据
		PageData xiaoshou = xiaoshouService.xiaoshouDetail(pd);
		//账号信息
		List<PageData> bankList =bankService.BanklistPage(page);
		//商家信息
		List<PageData> merChantList = merChantService.MerChantlistPage(page);
		
		mv.addObject("bankList", bankList);
		mv.addObject("merChantList", merChantList);
		mv.addObject("xiaoshouDetailList", GoodsDetailList);
		mv.addObject("xiaoshou", xiaoshou);
		mv.setViewName("view/xiaoshou_print");
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
		pd.put("xiaoshou_id", pd.get("tagID"));
		//货物
		List<PageData> goodsList =  goodsService.goodslist(page);
		//mv.addObject("goodsList", goodsList);
		List<PageData> resultList = new ArrayList<PageData>();
		
		//表格数据
		List<PageData> GoodsDetailList = xiaoshouService.xiaoshouGoodsDetail(pd);
		for(int i=0;i<GoodsDetailList.size();i++){
			PageData pdGoods = new PageData();
			pdGoods.put("spmc_id", GoodsDetailList.get(i).get("spmc_id"));
			pdGoods.put("danjia", GoodsDetailList.get(i).get("danjia"));
			pdGoods.put("jianshu", GoodsDetailList.get(i).get("jianshu"));
			pdGoods.put("money", GoodsDetailList.get(i).get("money"));
			pdGoods.put("ggxh", GoodsDetailList.get(i).get("ggxh"));
			pdGoods.put("goodsList", goodsList);
			resultList.add(pdGoods);
		}
		mv.addObject("resultList", resultList);
		
		//表头数据
		PageData xiaoshou = xiaoshouService.xiaoshouDetail(pd);
		mv.addObject("xiaoshou", xiaoshou);
		
		//客户
		List<PageData> kehuList  = kehuService.kehulistPage(page);
		mv.addObject("kehuList", kehuList);
		
		mv.addObject("msg","update");
		mv.setViewName("business/xiaoshou/xiaoshou_detail");
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
		pd = this.getPageData();
		xiaoshouService.updateJinhuo(pd);
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
		pd.put("xiaoshou_id", pd.getString("tagID"));
		xiaoshouService.deleteXiaoshou(pd);
		xiaoshouService.deleteXiaoshouGoods(pd);
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
			pd = xiaoshouService.getDataToView(pd);
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
