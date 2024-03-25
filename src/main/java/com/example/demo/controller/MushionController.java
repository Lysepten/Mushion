package com.example.demo.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

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
	
	@RequestMapping("/usr/home/KakaoLoginAPI")
	public String KakaoLoginAPI() {

		
		return "/usr/home/KakaoLoginAPI";
	}

	@RequestMapping("/usr/home/KakaoLogin")
	public String KakaoLoginAPI(@RequestParam String code, Model model) {
		System.err.println("code name : " + code);

		model.addAttribute("code", code);

		return "/usr/home/KakaoLogin";
	}

	@RequestMapping("/usr/home/SpotifyAPI")
	public String SpotifyAPI() {

		
		return "/usr/home/SpotifyAPI";
	}
	
	@RequestMapping("/usr/home/SpotifyRedirect")
	public String SpotifyRedirect(@RequestParam String code, Model model) {
		
		model.addAttribute("code", code);
		
		return "/usr/home/SpotifyRedirect";
	}
	
	@RequestMapping("/usr/home/ArgsTestPage")
	public String ArgsTest() {
		
		return "/usr/home/ArgsTestPage";
	}

	@RequestMapping("/usr/home/VarArgsTest")
	public String VarArgsTest(Model model, String... args) {
		
		Map<String, Integer> recommend = new HashMap<>();
		
		int Jazz = 0;
		int	Hiphop = 0;
		int Rock = 0;
		int Pop = 0;
		
		if(args == null) {
			return "값을 입력해주세요";
		}
		if(args != null) {
			for(int i = 0; i < args.length; i++) {
				if(args[i].equals("Jazz")) {
					Jazz++;
				}
				if(args[i].equals("Hiphop")) {
					Hiphop++;
				}
				if(args[i].equals("Rock")) {
					Rock++;
				}
				if(args[i].contains("pop")) {
					Pop++;
				}
			}
		}
		
		int max = 0;
		String maxGenre = "";
		
		recommend.put("Jazz", Jazz);
		recommend.put("Hiphop", Hiphop);
		recommend.put("Rock", Rock);
		recommend.put("Pop", Pop);
		
		for (Map.Entry<String, Integer> entry : recommend.entrySet()) {
            if (entry.getValue() > max) {
            	max = entry.getValue();
            	maxGenre = entry.getKey();
            }
        }
		
		
//		System.err.println("재즈 포인트 : " + Jazz + "\n 힙합 포인트 : " + Hiphop + "\n 락 포인트 : " + Rock + "\n 팝 포인트 : " + Pop);
		System.err.println(maxGenre);
		
		return "/usr/home/SpotifyRecommend";
	}
}
