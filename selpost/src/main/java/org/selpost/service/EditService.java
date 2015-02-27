package org.selpost.service;

import java.util.List;

import javax.inject.Inject;

import org.selpost.mapper.EditMapper;
import org.selpost.vo.CategoryVO;
import org.selpost.vo.NewsVO;
import org.selpost.vo.TagVO;
import org.springframework.stereotype.Service;

@Service
public class EditService implements EditMapper{

	@Inject
	private EditMapper em;

	@Override
	public void newsInsert(NewsVO nvo) throws Exception {
		em.newsInsert(nvo);
	}

	@Override
	public List<NewsVO> newsSelect() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void newsUpdate(NewsVO vo) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void newsDelete(int n_no) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<CategoryVO> newsCategorySelect() throws Exception {
		
		return em.newsCategorySelect();
	}

	public List<CategoryVO> newsCategorySecondSelect(String group_codeID)throws Exception {
		return em.newsCategorySecondSelect(group_codeID);
	}

	public void tagCreate(TagVO tvo)throws Exception {
		em.tagCreate(tvo);
	}

	public List<TagVO> tagList(TagVO tvo)throws Exception {
		return em.tagList(tvo);
	}

	public List<TagVO> editTagList() throws Exception {
		return em.editTagList();
	}

	public void editorTagCreate(TagVO tvo)throws Exception {
		em.editorTagCreate(tvo);
	}

	public void editorTagDelete(TagVO tvo)throws Exception {
		em.editorTagDelete(tvo);
		
	}
	public int lastNewsNo()throws Exception {
		return em.lastNewsNo();
	}

}
