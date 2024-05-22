package com.example.demo.interceptor;

import org.springframework.beans.factory.annotation.Autowired; 
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor; 

import com.example.demo.vo.Rq;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Component // 스프링 컴포넌트로 이 클래스를 선언하는 어노테이션
public class BeforeActionInterceptor implements HandlerInterceptor { // BeforeActionInterceptor 클래스가 HandlerInterceptor 인터페이스를 구현함을 선언

    @Autowired // 스프링이 여기에 Rq 인스턴스를 주입하도록 지시하는 어노테이션
    private Rq rq; // Rq 타입의 private 필드 rq 선언

    @Override // 재정의한 메서드임을 나타내는 어노테이션
    public boolean preHandle(HttpServletRequest req, HttpServletResponse resp, Object handler) throws Exception {
        rq.initBeforeActionInterceptor(); // rq 객체의 initBeforeActionInterceptor 메서드 호출

        return HandlerInterceptor.super.preHandle(req, resp, handler); // 부모 클래스의 preHandle 메서드 호출 결과 반환
    }
}
