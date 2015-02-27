package org.selpost.mapper;

import java.util.List;

import org.selpost.vo.CategoryVO;
import org.selpost.vo.NewsVO;
import org.selpost.vo.TagVO;



public interface EditMapper {
	
	public void newsInsert(NewsVO nvo)throws Exception;
	
	public List<NewsVO> newsSelect()throws Exception;
	
	public void newsUpdate(NewsVO vo)throws Exception;
	
	public void newsDelete(int n_no)throws Exception;
	
	public List<CategoryVO> newsCategorySelect()throws Exception;

	public List<CategoryVO> newsCategorySecondSelect(String group_codeID)throws Exception;

	public void tagCreate(TagVO tvo)throws Exception;

	public List<TagVO> tagList(TagVO tvo)throws Exception;

	public List<TagVO> editTagList()throws Exception;

	public void editorTagCreate(TagVO tvo)throws Exception;

	public void editorTagDelete(TagVO tvo)throws Exception;

	public int lastNewsNo()throws Exception;
	
}
