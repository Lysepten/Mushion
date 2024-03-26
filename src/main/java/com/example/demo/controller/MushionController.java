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
		int Blues = 0;
		int Classical = 0;
		int Country = 0;
		int Dance = 0;
		int Electronic = 0;
		int Folk = 0;
		int Metal = 0;
		int Punk = 0;
		int Reggae = 0;
		int RhythmAndBlues = 0;
		
		
		
		
		if(args == null) {
			return "값을 입력해주세요";
		}
		if(args != null) {
			for(int i = 0; i < args.length; i++) {
				if(args[i].contains("Jazz")) {
					Jazz++;
				}
				if(args[i].contains("Hiphop")) {
					Hiphop++;
				}
				if(args[i].contains("Rock")) {
					Rock++;
				}
				if(args[i].contains("pop")) {
					Pop++;
				}
				if(args[i].contains("Blues")) {
					Blues++;
				}
				if(args[i].contains("Classical")) {
					Classical++;
				}
				if(args[i].contains("Country")) {
					Country++;
				}
				if(args[i].contains("Dance")) {
					Dance++;
				}
				if(args[i].contains("Electronic")) {
					Electronic++;
				}
				if(args[i].contains("Folk")) {
					Folk++;
				}
				if(args[i].contains("Metal")) {
					Metal++;
				}
				if(args[i].contains("Punk")) {
					Punk++;
				}
				if(args[i].contains("Reggae")) {
					Reggae++;
				}
				if(args[i].contains("RhythmAndBlues") || args[i].contains("R&B")) {
					RhythmAndBlues++;
				}
			}
		}
		
		int max = 0;
		String maxGenre = "";
		
		recommend.put("Jazz", Jazz);
		recommend.put("Hiphop", Hiphop);
		recommend.put("Rock", Rock);
		recommend.put("Pop", Pop);
		recommend.put("Blues", Blues);
		recommend.put("Classical", Classical);
		recommend.put("Country", Country);
		recommend.put("Dance", Dance);
		recommend.put("Electronic", Electronic);
		recommend.put("Folk", Folk);
		recommend.put("Metal", Metal);
		recommend.put("Punk", Punk);
		recommend.put("Reggae", Reggae);
		recommend.put("RhythmAndBlues", RhythmAndBlues);

		
		for (Map.Entry<String, Integer> entry : recommend.entrySet()) {
            if (entry.getValue() > max) {
            	max = entry.getValue();
            	maxGenre = entry.getKey();
            }
        }
		
		System.err.println("재즈 포인트 : " + Jazz + "\n 힙합 포인트 : " + Hiphop + "\n 락 포인트 : " + Rock + "\n 팝 포인트 : " + Pop +
				"\n Blues : " + Blues + "\n Classical : " + Classical + "\n Country : " + Country + "\n Dance : " + Dance + "\n Electronic : " + Electronic + "\n Folk : " + Folk +
				"\n Metal : " + Metal + "\n Punk : " + Punk + "\n Reggae : " + Reggae + "\n RhythmAndBlues : " + RhythmAndBlues);
		
//		System.err.println(maxGenre);
		
		model.addAttribute("maxGenre", maxGenre);
		
		return "/usr/home/SpotifyRecommend";
	}
}
