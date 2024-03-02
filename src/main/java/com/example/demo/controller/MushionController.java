package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.vo.Member;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class MushionController {

	@RequestMapping("/usr/home/Mushion")
	public String Mushion() {

		return "/usr/home/Mushion";
	}
	
	@RequestMapping("/usr/member/MushionLogin")
	public String MushionLogin() {

		return "/usr/member/MushionLogin";
	}

}
