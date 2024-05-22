package com.example.demo.controller;

// 필요한 라이브러리와 클래스를 임포트
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

    // Autowired 어노테이션을 사용하여 의존성 주입
    @Autowired
    private Rq rq;

    @Autowired
    private ArticleService articleService;

    @Autowired
    private MushionService mushionService;

    // Mushion 메서드와 매핑
    @RequestMapping("/usr/home/Mushion")
    public String Mushion() {
        // Mushion 페이지 반환
        return "/usr/home/Mushion";
    }

    // MushionLogin 메서드와 매핑
    @RequestMapping("/usr/member/MushionLogin")
    public String MushionLogin() {
        // Mushion 로그인 페이지 반환
        return "/usr/member/MushionLogin";
    }

    // MushionJoin 메서드와 매핑
    @RequestMapping("/usr/member/MushionJoin")
    public String MushionJoin() {
        // Mushion 가입 페이지 반환
        return "/usr/member/MushionJoin";
    }

    // suggest 메서드와 매핑
    @RequestMapping("/usr/article/MushionSuggestList")
    public String suggest(Model model) {
        // articleService로부터 추천 목록을 가져옴
        List<topdb> topdbs = articleService.getForMushionSuggestList();
        // 모델에 추천 목록 추가
        model.addAttribute("topdbs", topdbs);
        // 추천 목록 페이지 반환
        return "/usr/article/MushionSuggestList";
    }

    // KakaoLoginAPI 메서드와 매핑
    @RequestMapping("/usr/home/KakaoLoginAPI")
    public String KakaoLoginAPI() {
        // 카카오 로그인 API 페이지 반환
        return "/usr/home/KakaoLoginAPI";
    }

    // 코드 파라미터를 받는 카카오 로그인 처리 메서드
    @RequestMapping("/usr/home/KakaoLogin")
    public String KakaoLoginAPI(@RequestParam String code, Model model) {
        // 받은 코드를 출력
        System.err.println("code name : " + code);
        // 모델에 코드 추가
        model.addAttribute("code", code);
        // 카카오 로그인 페이지 반환
        return "/usr/home/KakaoLogin";
    }

    // SpotifyAPI 메서드와 매핑
    @RequestMapping("/usr/home/SpotifyAPI")
    public String SpotifyAPI() {
        // 스포티파이 API 페이지 반환
        return "/usr/home/SpotifyAPI";
    }

    // SpotifyRedirect 메서드와 매핑
    @RequestMapping("/usr/home/SpotifyRedirect")
    public String SpotifyRedirect(@RequestParam String code, Model model) {
        // 받은 코드를 모델에 추가
        model.addAttribute("code", code);
        // 스포티파이 리디렉트 페이지 반환
        return "/usr/home/SpotifyRedirect";
    }

    // SpotifyPlayerTest 메서드와 매핑
    @RequestMapping("/usr/spotify/recommendTest")
    public String SpotifyPlayerTest() {
        // 스포티파이 추천 테스트 페이지 반환
        return "/usr/spotify/recommendTest";
    }

    // vargenres 메서드와 매핑
    @RequestMapping("/usr/home/genres")
    public String vargenres(HttpServletRequest req, Model model, String... genres) {
        // 장르가 제공되었는지 확인
        if (genres == null || genres.length == 0) {
            // 장르가 없으면 메시지와 함께 리디렉션
            return Ut.jsReplace("F-1", "값을 입력해주세요.", "/");
        }

        // 가장 빈도가 높은 장르를 얻음
        String maxGenre = mushionService.MaxGenre(genres);

        // 장르가 지원되는지 확인
        if (maxGenre.isEmpty()) {
            // 지원되지 않는 장르라면 메시지와 함께 리디렉션
            return Ut.jsReplace("F-1", "지원하지 않는 장르입니다.", "/usr/home/SpotifyAPI");
        }

        // 해당 장르에 대한 URL 목록을 얻음
        List<snapshotUrl> snapshotUrlList = mushionService.getSnapshotUrlsByGenre(maxGenre);

        // 장르에 맞는 스타일로 초기화
        Map<String, String> artistgenres = mushionService.initializegenreStyles();

        // 해당 장르에 대한 패션 스타일 얻음
        String fashionStyle = artistgenres.get(maxGenre);

        // 모델에 URL, 장르, 패션 스타일 추가
        model.addAttribute("snapshotUrlList", snapshotUrlList);
        model.addAttribute("maxGenre", maxGenre);
        model.addAttribute("fashionStyle", fashionStyle);

        // 스포티파이 추천 페이지 반환
        return "/usr/home/SpotifyRecommend";
    }
}
