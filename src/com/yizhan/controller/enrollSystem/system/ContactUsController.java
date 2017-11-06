package com.yizhan.controller.enrollSystem.system;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import com.yizhan.controller.base.BaseController;
import com.yizhan.entity.Page;
import com.yizhan.service.enrollSystem.system.ContactUsService;
import com.yizhan.util.PageData;

/** 
 * 类名称：联系我们管理控制层
 * 创建人：zjh 
 * 创建时间：2017-9-29 09:38:50
 */
@Controller
@RequestMapping(value="/api/contactUs")
public class ContactUsController extends BaseController{

	@Resource(name="contactUsService")
	private ContactUsService contactUsService;
	
	/**
	 * 获取列表
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping(value="/contactUslistPage")
	public ModelAndView contactUslistPage(Page page) throws Exception{
		logBefore(logger, "获取列表");
		ModelAndView mv=new ModelAndView();
		PageData pd=new PageData();
		pd=this.getPageData();
		page.setPd(pd);
		
		List<PageData> list=contactUsService.contactUslistPage(page);
		mv.addObject("pd", pd);
		mv.addObject("list", list);
		
		mv.setViewName("enrollSystem/system/contactUs/contactUs_list");
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
		mv.setViewName("enrollSystem/system/contactUs/contactUs_edit");
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
		savePd.put("contact_us_id", this.get32UUID());
		savePd.put("title", pd.getString("title"));
		savePd.put("content", pd.getString("content"));
		savePd.put("sort", pd.get("sort"));
		
		contactUsService.insert(savePd);
		
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
		pd=contactUsService.getDateById(pd);
		mv.addObject("pd", pd);
		mv.addObject("msg", "update");
		
		mv.setViewName("enrollSystem/system/contactUs/contactUs_edit");
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
		updatePd.put("contact_us_id", pd.getString("contact_us_id"));
		updatePd.put("title", pd.getString("title"));
		updatePd.put("content", pd.getString("content"));
		updatePd.put("sort", pd.get("sort"));
		
		contactUsService.update(updatePd);
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
		/*List<PageData> paths=contactUsService.getListByIds(map);
		for(PageData temp:paths){
			if(Tools.notEmpty(temp.getString("img_path"))){
				DelAllFile.delFolder(PathUtil.getClasspath() + temp.getString("img_path"));//删除图片文件
			}
		}*/
		
		//执行删除操作
		contactUsService.delete(map);
		writer.close();
	}
	
	/**
	 * 删除图片路径
	 * @param out
	 */
	/*@RequestMapping(value="/deleteImgPath")
	public void deleteImgPath(PrintWriter out) {
		logBefore(logger, "删除图片");
		try{
			PageData pd = new PageData();
			pd = this.getPageData();
			String PATH = pd.getString("img_path");//图片路径
			DelAllFile.delFolder(PathUtil.getClasspath() + pd.getString("img_path"));//删除图片
			if(PATH != null){
				contactUsService.deleteImgPath(pd);//删除数据中图片数据
			}	
			out.write("success");
			out.close();
		}catch(Exception e){
			logger.error(e.toString(), e);
		}
	}*/
}
