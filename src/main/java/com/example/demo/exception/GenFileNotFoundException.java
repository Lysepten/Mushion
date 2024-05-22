package com.example.demo.exception;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

//예외가 발생했을 때 응답 상태를 404로 설정하고 이유를 "genFile not found"로 지정하는 어노테이션
@ResponseStatus(code = HttpStatus.NOT_FOUND, reason = "genFile not found") 
public class GenFileNotFoundException extends RuntimeException { // RuntimeException을 확장한 GenFileNotFoundException 클래스 선언
}
