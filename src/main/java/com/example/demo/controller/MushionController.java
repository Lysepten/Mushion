package com.example.demo.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.service.ArticleService;
import com.example.demo.vo.topdb;

@Controller
public class MushionController {
	
	@Autowired
	private ArticleService articleService;

	@RequestMapping("/usr/home/Mushion")
	public String Mushion() {

		return "/usr/home/Mushion";
	}
	
	@RequestMapping("/usr/member/MushionLogin")
	public String MushionLogin() {

		return "/usr/member/MushionLogin";
	}
	
	@RequestMapping("/usr/member/MushionJoin")
	public String MushionJoin() {

		return "/usr/member/MushionJoin";
	}
	
	@RequestMapping("/usr/article/MushionSuggestList")
	public String suggest(Model model) {
		
		List<topdb> topdbs = articleService.getForMushionSuggestList();
		
		model.addAttribute("topdbs", topdbs);
		
		return "/usr/article/MushionSuggestList";
	}
	
}
