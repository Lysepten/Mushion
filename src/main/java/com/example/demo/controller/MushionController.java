package com.example.demo.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.demo.service.ArticleService;
import com.example.demo.service.MushionService;
import com.example.demo.util.Ut;
import com.example.demo.vo.Rq;
import com.example.demo.vo.snapshotUrl;
import com.example.demo.vo.topdb;

import jakarta.servlet.http.HttpServletRequest;
@Controller
public class MushionController {
	
	@Autowired
	private Rq rq;
	
	@Autowired
	private ArticleService articleService;
	
	@Autowired
	private MushionService mushionService;

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
	
	@RequestMapping("/usr/spotify/recommendTest")
	public String SpotifyPlayerTest() {
		
		return "/usr/spotify/recommendTest";
	}

	 @RequestMapping("/usr/home/genres")
	    public String vargenres(HttpServletRequest req, Model model, String... genres) {

	        if (genres == null || genres.length == 0) {
	            return Ut.jsReplace("F-1", "값을 입력해주세요.", "/");
	        }

	        String maxGenre = MushionService.MaxGenre(genres);

	        if (maxGenre.isEmpty()) {
	            return Ut.jsReplace("F-1", "지원하지 않는 장르입니다.", "/usr/home/SpotifyAPI");
	        }

	        List<snapshotUrl> snapshotUrlList = mushionService.getSnapshotUrlsByGenre(maxGenre);

	        Map<String, String> artistgenres = mushionService.initializegenreStyles();

	        String fashionStyle = artistgenres.get(maxGenre);

	        model.addAttribute("snapshotUrlList", snapshotUrlList);
	        model.addAttribute("maxGenre", maxGenre);
	        model.addAttribute("fashionStyle", fashionStyle);
 
	        return "/usr/home/SpotifyRecommend";
	    }

}