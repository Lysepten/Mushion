package com.example.demo.interceptor;

import org.springframework.beans.factory.annotation.Autowired; 
import org.springframework.stereotype.Component; 
import org.springframework.web.servlet.HandlerInterceptor;

import com.example.demo.util.Ut; 
import com.example.demo.vo.Rq;

import jakarta.servlet.http.HttpServletRequest; 
import jakarta.servlet.http.HttpServletResponse;

@Component // 스프링 컴포넌트로 이 클래스를 선언하는 어노테이션
public class NeedLoginInterceptor implements HandlerInterceptor { // NeedLoginInterceptor 클래스가 HandlerInterceptor 인터페이스를 구현함을 선언

    @Autowired
    private Rq rq; // Rq 타입의 private 필드 rq 선언

    @Override
    public boolean preHandle(HttpServletRequest req, HttpServletResponse resp, Object handler) throws Exception {
        Rq rq = (Rq) req.getAttribute("rq"); // "rq"라는 이름으로 속성을 가져와서 rq 변수에 할당

        if (!rq.isLogined()) { // 로그인 상태가 아닌 경우
            System.out.println("==============로그인 하고 이용하세요============");
            String afterLoginUri = rq.getEncodedCurrentUri(); // 현재 URI를 인코딩하여 afterLoginUri에 할당
            rq.jsprintReplace("F-A", "로그인 후 이용해주세요", "../member/MushionLogin?afterLoginUri=" + afterLoginUri); // F-A 타입의 메시지와 로그인 후 이용해주세요 메시지를 출력하고 로그인 페이지로 이동

            return false; // 처리를 중단함
        }

        return HandlerInterceptor.super.preHandle(req, resp, handler); // 부모 클래스의 preHandle 메서드 호출 결과 반환
    }
}
