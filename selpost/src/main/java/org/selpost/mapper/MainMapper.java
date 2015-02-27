package org.selpost.mapper;

import java.util.List;

import org.selpost.util.Criteria;
import org.selpost.util.PageMaker;
import org.selpost.vo.NewsVO;

public interface MainMapper {
//	
//	@Select
//	public PageMaker PageMaker  
	
	public List<NewsVO> listPage(Criteria cri)throws Exception;

	public PageMaker countPaging(Criteria cri)throws Exception;
	
	
}
