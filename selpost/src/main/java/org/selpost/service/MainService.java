package org.selpost.service;

import java.util.List;

import javax.inject.Inject;

import org.selpost.mapper.MainMapper;
import org.selpost.util.Criteria;
import org.selpost.util.PageMaker;
import org.selpost.vo.NewsVO;
import org.springframework.stereotype.Service;

@Service
public class MainService implements MainMapper {
	
	@Inject
	private MainMapper mm;
	
	@Override
	public List<NewsVO> listPage(Criteria cri) throws Exception {
		return mm.listPage(cri);
	}

	public PageMaker countPaging(Criteria cri) throws Exception {
		return mm.countPaging(cri);
		
	}

}
