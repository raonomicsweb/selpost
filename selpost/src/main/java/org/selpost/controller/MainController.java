package org.selpost.controller;



import javax.inject.Inject;

import org.selpost.service.MainService;
import org.selpost.util.Criteria;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
//@RequestMapping("*")
public class MainController {

	@Inject
	private MainService ms;
	
	@RequestMapping("/main")
	public String Main(@ModelAttribute("cri")Criteria cri, Model model) throws Exception {
		cri.setPage(cri.getPage());
		model.addAttribute("list", ms.listPage(cri));
		model.addAttribute("pageMaker", ms.countPaging(cri).calcPage(cri));
		return "main/main";
	}
	@RequestMapping("/domestic")
	public String domestic(Criteria cri, Model model)throws Exception{
		return "main/domestic";
	}
	@RequestMapping("/foreign")
	public String foreign(Criteria cri, Model model)throws Exception{
		return "main/foreign";
	}
	@RequestMapping("/stockMarket")
	public String KOSPI(Criteria cri, Model model)throws Exception{
		return "main/stockMarket";
	}
	@RequestMapping("/economicTerms")
	public String economicterms(Criteria cri, Model model)throws Exception{
		return "main/economicTerms";
	}
	@RequestMapping("/collectiveIssues")
	public String issue(Criteria cri, Model model)throws Exception{
		return "main/collectiveIssues";
	}
	@RequestMapping("/collectiveIssues/list")
	public String issueList(Criteria cri, Model model)throws Exception{
		return "main/collectiveIssues";
	}
	@RequestMapping("/forum")
	public String forum(Criteria cri, Model model)throws Exception{
		return "main/forum";
	}
	@RequestMapping("/forum/list")
	public String forumList(Criteria cri, Model model)throws Exception{
		return "main/forum";
	}
	
}
