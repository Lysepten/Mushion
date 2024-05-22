package com.example.demo.interceptor; 

import org.springframework.beans.factory.annotation.Autowired; 
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor; 

import com.example.demo.vo.Rq; 

import jakarta.servlet.http.HttpServletRequest; 
import jakarta.servlet.http.HttpServletResponse; 

@Component 
public class NeedLogoutInterceptor implements HandlerInterceptor { 

    @Autowired
    private Rq rq; 

    @Override 
    public boolean preHandle(HttpServletRequest req, HttpServletResponse resp, Object handler) throws Exception {
        Rq rq = (Rq) req.getAttribute("rq"); // "rq"라는 이름으로 속성을 가져와서 rq 변수에 할당

        if (rq.isLogined()) { // 로그인 상태인 경우
            System.out.println("==============로그아웃 하고 이용 하세요============");
            rq.printHistoryBack("로그아웃 후 이용해주세요"); // "로그아웃 후 이용해주세요" 메시지를 출력하고 이전 페이지로 이동

            return false; // 처리를 중단함
        }

        return HandlerInterceptor.super.preHandle(req, resp, handler); // 부모 클래스의 preHandle 메서드 호출 결과 반환
    }
}
