package com.yizhan.controller.enrollSystem.system;

import java.io.PrintWriter;
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
import com.yizhan.service.enrollSystem.system.ExpertLibraryService;
import com.yizhan.service.enrollSystem.system.ExpertPositionService;
import com.yizhan.util.AppUtil;
import com.yizhan.util.PageData;

/** 
 * 类名称：专家库信息管理控制层
 * 创建人：zjh 
 * 创建时间：2017-9-29 09:38:50
 */
@Controller
@RequestMapping(value="/api/expertLibrary")
public class ExpertLibraryController extends BaseController{
	
	@Resource(name="expertLibraryService")
	private ExpertLibraryService expertLibraryService;
	
	@Resource(name="expertPositionService")
	private ExpertPositionService expertPositionService;
	
	/**
	 * 获取列表
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/getlistPage")
	public ModelAndView getlistPage(Page page) throws Exception{
		logBefore(logger, "获取列表");
		ModelAndView mv=new ModelAndView();
		PageData pd=new PageData();
		pd=this.getPageData();
		page.setPd(pd);
		
		List<PageData> list=expertLibraryService.getlistPage(page);
		mv.addObject("pd", pd);
		mv.addObject("list", list);
		
		mv.setViewName("enrollSystem/system/expertLibrary/expertLibrary_list");
		return mv;
	}
	/**
	 * 进入添加页面
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/toAdd")
	public ModelAndView toAdd() throws Exception{
		logBefore(logger, "进入添加页面");
		ModelAndView mv=new ModelAndView();
		PageData pd=new PageData();
		
		//获取专家职称
		List<PageData> list=expertPositionService.getlist(pd);
		mv.addObject("list", list);
		
		mv.addObject("msg", "insert");
		mv.setViewName("enrollSystem/system/expertLibrary/expertLibrary_edit");
		return mv;
	}
	/**
	 * 添加信息
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/insert")
	public ModelAndView insert() throws Exception{
		logBefore(logger, "添加信息");
		ModelAndView mv=new ModelAndView();
		PageData pd=new PageData();
		pd=this.getPageData();
		
		//保存信息
		PageData savePd=new PageData();
		savePd.put("expert_library_id", this.get32UUID());
		savePd.put("userName", pd.getString("userName"));
		savePd.put("sex", pd.getString("sex"));
		savePd.put("position", pd.getString("position"));
		savePd.put("contract_number", pd.getString("contract_number"));
		savePd.put("Inauguration_company", pd.getString("Inauguration_company"));
		
		expertLibraryService.insert(savePd);
		
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	/**
	 * 进入修改页面
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/toEdit")
	public ModelAndView toEdit() throws Exception{
		logBefore(logger, "进入修改页面");
		ModelAndView mv=new ModelAndView();
		PageData pd=new PageData();
		pd=this.getPageData();
		
		//获取指定对象信息
		pd=expertLibraryService.getDateById(pd);
		mv.addObject("pd", pd);
		mv.addObject("msg", "update");
		
		//获取专家职称
		List<PageData> list=expertPositionService.getlist(pd);
		mv.addObject("list", list);
		
		mv.setViewName("enrollSystem/system/expertLibrary/expertLibrary_edit");
		return mv;
	}
	/**
	 * 对指定对象进行修改
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/update")
	public ModelAndView update() throws Exception{
		logBefore(logger, "对指定对象进行修改");
		ModelAndView mv=new ModelAndView();
		PageData pd=new PageData();
		pd=this.getPageData();
		
		//更新信息
		PageData updatePd=new PageData();
		updatePd.put("expert_library_id", pd.getString("expert_library_id"));
		updatePd.put("position", pd.getString("position"));
		updatePd.put("userName", pd.getString("userName"));
		updatePd.put("sex", pd.getString("sex"));
		updatePd.put("contract_number", pd.getString("contract_number"));
		updatePd.put("Inauguration_company", pd.getString("Inauguration_company"));
		
		expertLibraryService.update(updatePd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
	}
	
	/**
	 * 根据name获取对象信息
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/getDateByName")
	@ResponseBody
	public Object getDateByName() throws Exception{
		logBefore(logger, "---根据name获取对象信息--");
		Map<String, Object> map=new HashMap<String, Object>();
		PageData pd=new PageData();
		pd=this.getPageData();
		
		String respCode="00";
		String resqMsg="该名称已存在";
		
		PageData selectPd=new PageData();
		selectPd.put("userName", pd.getString("userName"));
		selectPd=expertLibraryService.getDateByName(selectPd);
		
		if(selectPd==null){
			respCode="01";
			resqMsg="该名称不存在";
		}
		
		map.put("respCode", respCode);
		map.put("resqMsg", resqMsg);
		return AppUtil.returnObject(pd, map);
	}
	
	/**
	 * 根据ID删除指定对象的信息
	 * @param writer
	 * @throws Exception
	 */
	@RequestMapping(value="/delete")
	public void delete(PrintWriter writer) throws Exception{
		logBefore(logger, "---根据ID删除指定对象的信息--");
		PageData pd=new PageData();
		Map<String, Object> map=new HashMap<String, Object>();
		pd=this.getPageData();
		String id[]=pd.getString("ids").split(",");
		List<String> ids=new ArrayList<String>();
		for (int i = 0; i < id.length; i++) {
			ids.add(id[i]);
		}
		map.put("ids", ids);
		
		//获取要删除数据的图片路径,并执行删除图片操作
		/*List<PageData> paths=expertLibraryService.getListByIds(map);
		for(PageData temp:paths){
			if(Tools.notEmpty(temp.getString("img_path"))){
				DelAllFile.delFolder(PathUtil.getClasspath() + temp.getString("img_path"));//删除图片文件
			}
		}*/
		
		//执行删除操作
		expertLibraryService.delete(map);
		writer.close();
	}
}
