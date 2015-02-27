package org.selpost.controller;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.inject.Inject;

import org.selpost.service.EditService;
import org.selpost.util.S3util;
import org.selpost.vo.CategoryVO;
import org.selpost.vo.NewsVO;
import org.selpost.vo.TagVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
@RequestMapping("/admin/*")
public class EditController {
	
	private static final Logger logger = LoggerFactory.getLogger(EditController.class);
	
	@Inject
	private EditService es;
	
	@Inject
	private S3util s3util;
	
	@RequestMapping("/edit")
	public String editMain(Model model)throws Exception{
		model.addAttribute("category", es.newsCategorySelect());
		return "edit/edit";
	}
	@RequestMapping("/category")
	@ResponseBody
	public List<CategoryVO> category(String group_codeID)throws Exception{
		return es.newsCategorySecondSelect(group_codeID);
	}

	@RequestMapping("/edit/insert")
	public String newInsert(NewsVO nvo)throws Exception{
		logger.info("editvo : "+nvo);
		es.newsInsert(nvo);
		return "redirect:/admin/edit";
	}
	
	@RequestMapping(value = "/s3upload", method = RequestMethod.POST, produces="text/html;charset=UTF-8")
	@ResponseBody
	public String s3upload(String file) throws Exception{
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		int n_no = es.lastNewsNo();
		s3util.createFolder("selpost", sdf.format(date)+"("+n_no+")");
		String[] filePath = file.split("/");
		int lastIndex = filePath.length;
		String fileName = filePath[lastIndex-1];
		s3util.fileUpload("selpost/"+sdf.format(date)+"-"+n_no, new File(file));
		String fileAccessURL = s3util.getFileURL("selpost", fileName);
		String fileURL = fileAccessURL.split("\\?")[0];
		return fileURL;
	}
	
	//opinion
//	@RequestMapping(value="/tagcreate", method = RequestMethod.POST)
//	@ResponseBody
//	public String tagCreate(TagVO tvo)throws Exception{
//		es.tagCreate(tvo);
//		return tvo.getTag_codeID();
//	}
	
//	@RequestMapping(value="/taglist", method = RequestMethod.GET)
//	@ResponseBody
//	public List<TagVO> tagList(TagVO tvo)throws Exception{
//		System.out.println("tagList.....");
//		logger.info("tag CodeID : " + tvo.getTag_codeID());
//		List<TagVO> list = es.tagList(tvo);
//		logger.info("tagList : " + list);
//		return es.tagList(tvo);
//	}
	
	@RequestMapping(value = "/taglist")
	@ResponseBody
	public List<TagVO> eidtorTagList()throws Exception{
		logger.info("eidtorTagList.....");
		List<TagVO> list = es.editTagList();
		logger.info("tagList : " + list);
		return list;
	}
	@RequestMapping(value="/tagcreate", method = RequestMethod.POST)
	@ResponseBody
	public String tagCreate(TagVO tvo)throws Exception{
		es.editorTagCreate(tvo);
		return "";
	}
	@RequestMapping(value="/tagdelete", method = RequestMethod.POST)
	@ResponseBody
	public String tagDelete(TagVO tvo)throws Exception{
		es.editorTagDelete(tvo);
		return "";
	}
	
}