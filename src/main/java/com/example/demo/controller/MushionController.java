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
import com.example.demo.util.Ut;
import com.example.demo.vo.Rq;
import com.example.demo.vo.topdb;

import jakarta.servlet.http.HttpServletRequest;
@Controller
public class MushionController {
	
	@Autowired
	private Rq rq;
	
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
	public String VarArgsTest(HttpServletRequest req, Model model, String... args) {
		
		Rq rq = (Rq) req.getAttribute("rq");
		
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
				if(args[i].contains("Jazz") || args[i].contains("jazz")) {
					Jazz++;
				}
				if(args[i].contains("Hip hop") || args[i].contains("hip hop") || args[i].contains("rap")) {
					Hiphop++;
				}
				if(args[i].contains("Rock") || args[i].contains("rock")) {
					Rock++;
				}
				if(args[i].contains("Pop") || args[i].contains("pop")) {
					Pop++;
				}
				if(args[i].contains("Blues") || args[i].contains("blues")) {
					Blues++;
				}
				if(args[i].contains("Classical") || args[i].contains("classical")) {
					Classical++;
				}
				if(args[i].contains("Country") || args[i].contains("country")) {
					Country++;
				}
				if(args[i].contains("Dance") || args[i].contains("dance")) {
					Dance++;
				}
				if(args[i].contains("Electronic") || args[i].contains("electronic")) {
					Electronic++;
				}
				if(args[i].contains("Folk") || args[i].contains("folk")) {
					Folk++;
				}
				if(args[i].contains("Metal") || args[i].contains("metal")) {
					Metal++;
				}
				if(args[i].contains("Punk") || args[i].contains("punk")) {
					Punk++;
				}
				if(args[i].contains("Reggae") || args[i].contains("reggae")) {
					Reggae++;
				}
				if(args[i].contains("RhythmAndBlues") || args[i].contains("r&b")) {
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
		
		if(max == 0) {
			maxGenre = "";
			return Ut.jsReplace("F-1", "지원하지 않는 장르입니다.", "/usr/home/SpotifyAPI");
		}
		
		System.err.println("재즈 포인트 : " + Jazz + "\n 힙합 포인트 : " + Hiphop + "\n 락 포인트 : " + Rock + "\n 팝 포인트 : " + Pop +
				"\n Blues : " + Blues + "\n Classical : " + Classical + "\n Country : " + Country + "\n Dance : " + Dance + "\n Electronic : " + Electronic + "\n Folk : " + Folk +
				"\n Metal : " + Metal + "\n Punk : " + Punk + "\n Reggae : " + Reggae + "\n RhythmAndBlues : " + RhythmAndBlues);
		
		String artistGenre = maxGenre;
		
		if(maxGenre.equals("Jazz")) {
			maxGenre = "Classic";
		}
		if(maxGenre.equals("Hiphop")) {
			maxGenre = "Street";
		}
		if(maxGenre.equals("Rock")) {
			maxGenre = "Grunge";
		}
		if(maxGenre.equals("Pop")) {
			maxGenre = "Minimal";
		}
		if(maxGenre.equals("Blues")) {
			maxGenre = "Casual";
		}
		if(maxGenre.equals("Classical")) {
			maxGenre = "Classic";
		}
		if(maxGenre.equals("Country")) {
			maxGenre = "Hippie";
		}
		if(maxGenre.equals("Dance")) {
			maxGenre = "Sporty";
		}
		if(maxGenre.equals("Electronic")) {
			maxGenre = "Sporty";
		}
		if(maxGenre.equals("Folk")) {
			maxGenre = "Bohemian";
		}
		if(maxGenre.equals("Metal")) {
			maxGenre = "Biker";
		}
		if(maxGenre.equals("Punk")) {
			maxGenre = "Punk";
		}
		if(maxGenre.equals("Reggae")) {
			maxGenre = "Resort";
		}
		if(maxGenre.equals("RhythmAndBlues")) {
			maxGenre = "Vintage";
		}
		
		model.addAttribute("maxGenre", maxGenre);
		model.addAttribute("artistGenre", artistGenre);
		
		return "/usr/home/SpotifyRecommend";
	}
}