package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class UsrHomeController {

    // /usr/home/main 경로를 처리하는 메서드
    @RequestMapping("/usr/home/main")
    public String showMain() {
        // 사용자의 메인 홈페이지를 보여줌
        return "/usr/home/main";
    }

    // / 경로를 처리하는 메서드
    @RequestMapping("/")
    public String showRoot() {
        // 사용자를 /usr/home/main 경로로 리다이렉트
        return "redirect:/usr/home/main";
    }
}
