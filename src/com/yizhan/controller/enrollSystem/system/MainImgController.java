package com.yizhan.controller.enrollSystem.system;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.yizhan.controller.base.BaseController;
import com.yizhan.entity.Page;
import com.yizhan.service.enrollSystem.system.MainImgService;
import com.yizhan.util.Const;
import com.yizhan.util.DateUtil;
import com.yizhan.util.DelAllFile;
import com.yizhan.util.FileUpload;
import com.yizhan.util.PageData;
import com.yizhan.util.PathUtil;
import com.yizhan.util.Tools;

/** 
 * 类名称：中心主图管理控制层
 * 创建人：zjh 
 * 创建时间：2017-9-28 11:19:35
 */
@Controller
@RequestMapping(value="/api/mainImg")
public class MainImgController extends BaseController{

	@Resource(name="mainImgService")
	private MainImgService mainImgService;
	
	
	/**
	 * 获取列表
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/mainImglistPage")
	public ModelAndView mainImglistPage(Page page) throws Exception{
		logBefore(logger, "获取列表");
		ModelAndView mv=new ModelAndView();
		PageData pd=new PageData();
		pd=this.getPageData();
		page.setPd(pd);
		
		List<PageData> list=mainImgService.mainImglistPage(page);
		mv.addObject("pd", pd);
		mv.addObject("list", list);
		
		mv.setViewName("enrollSystem/system/mainImg/mainImg_list");
		return mv;
	}
	/**
	 * 进入添加页面
	 * @return
	 */
	@RequestMapping(value="/toAdd")
	public ModelAndView toAdd(){
		logBefore(logger, "进入添加页面");
		ModelAndView mv=new ModelAndView();
		mv.addObject("msg", "insert");
		mv.setViewName("enrollSystem/system/mainImg/mainImg_edit");
		return mv;
	}
	/**
	 * 添加信息
	 * @return
	 * @throws Exception
	 */
	@RequestMapping(value="/insert")
	public ModelAndView insert(
			@RequestParam(required=false) MultipartFile file,
			String status,
			String type
			) throws Exception{
		logBefore(logger, "添加信息");
		ModelAndView mv=new ModelAndView();
		PageData pd=new PageData();
		
		//保存图片
		String filePath=Const.FILEPATHIMG + "mainimg/" + DateUtil.getDays() + "/";
		String fileName=FileUpload.fileUpAndZip(file,PathUtil.getClasspath() + filePath, this.get32UUID(),375,220);
		
		//保存信息
		pd.put("main_img_id", this.get32UUID());
		pd.put("status", status);
		pd.put("type", type);
		pd.put("img_path", filePath+fileName);
		
		mainImgService.insert(pd);
		
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
		pd=mainImgService.getDateById(pd);
		mv.addObject("pd", pd);
		mv.addObject("msg", "update");
		
		mv.setViewName("enrollSystem/system/mainImg/mainImg_edit");
		return mv;
	}
	/**
	 * 对指定对象进行修改
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/update")
	public ModelAndView update(
			@RequestParam(required=false) MultipartFile file,
			String status,
			String type,
			String img_path,
			String main_img_id
			) throws Exception{
		logBefore(logger, "对指定对象进行修改");
		ModelAndView mv=new ModelAndView();
		PageData pd=new PageData();
		
		if(file!=null && !file.isEmpty()){
			//保存图片
			String filePath=Const.FILEPATHIMG + "mainimg/" + DateUtil.getDays() + "/";
			String fileName=FileUpload.fileUpAndZip(file,PathUtil.getClasspath() + filePath, this.get32UUID(),375,220);
			pd.put("img_path", filePath+fileName);
		}else{
			pd.put("img_path", img_path);
		}
		
		//更新信息
		pd.put("main_img_id", main_img_id);
		pd.put("status", status);
		pd.put("type", type);
		
		mainImgService.update(pd);
		mv.addObject("msg","success");
		mv.setViewName("save_result");
		return mv;
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
		List<PageData> paths=mainImgService.getListByIds(map);
		for(PageData temp:paths){
			if(Tools.notEmpty(temp.getString("img_path"))){
				DelAllFile.delFolder(PathUtil.getClasspath() + temp.getString("img_path"));//删除图片文件
			}
		}
		
		//执行删除操作
		mainImgService.delete(map);
		writer.close();
	}
	
	/**
	 * 删除图片路径
	 * @param out
	 */
	@RequestMapping(value="/deleteImgPath")
	public void deleteImgPath(PrintWriter out) {
		logBefore(logger, "删除图片");
		try{
			PageData pd = new PageData();
			pd = this.getPageData();
			String PATH = pd.getString("img_path");//图片路径
			DelAllFile.delFolder(PathUtil.getClasspath() + pd.getString("img_path"));//删除图片
			if(PATH != null){
				mainImgService.deleteImgPath(pd);//删除数据中图片数据
			}	
			out.write("success");
			out.close();
		}catch(Exception e){
			logger.error(e.toString(), e);
		}
	}
}
