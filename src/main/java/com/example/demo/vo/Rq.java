package com.example.demo.vo;

import java.io.IOException;

import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Component;

import com.example.demo.service.MemberService;
import com.example.demo.util.Ut;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.Getter;

@Component
@Scope(value = "request", proxyMode = ScopedProxyMode.TARGET_CLASS)
public class Rq {
	@Getter
	private boolean isLogined;
	@Getter
	private int loginedMemberId; // 로그인된 회원의 ID입니다.
	@Getter
	private Member loginedMember; // 로그인된 회원 객체입니다.
	
	private HttpSession session; // 세션 객체입니다.

	private HttpServletRequest req; // 요청 객체입니다.
	private HttpServletResponse resp; // 응답 객체입니다.

	public Rq(HttpServletRequest req, HttpServletResponse resp, MemberService memberService) {
		this.req = req;
		this.resp = resp;
		this.session = req.getSession(); // 현재 요청에 대한 세션을 가져옵니다.

		HttpSession httpSession = req.getSession(); // 세션 객체를 다시 가져옵니다.

		if (httpSession.getAttribute("loginedMemberId") != null) { // 세션에 로그인된 회원 ID가 있는지 확인합니다.
			isLogined = true; // 로그인 상태를 true로 설정합니다.
			loginedMemberId = (int) httpSession.getAttribute("loginedMemberId"); // 로그인된 회원 ID를 세션에서 가져옵니다.
			loginedMember = memberService.getMember(loginedMemberId); // 로그인된 회원 객체를 서비스에서 가져옵니다.
		}

		this.req.setAttribute("rq", this); // 요청 객체에 현재 Rq 객체를 속성으로 설정합니다.
	}

	public void printHistoryBack(String msg) throws IOException {
		resp.setContentType("text/html; charset=UTF-8");  // 응답의 콘텐츠 타입을 설정합니다.
		println("<script>"); // 스크립트 태그를 출력합니다.
		if (!Ut.isEmpty(msg)) {
			System.err.println("alert('" + msg + "');"); // 에러 스트림에 메시지를 출력합니다.
			println("alert('" + msg + "');"); // 경고창을 출력합니다.
		}
		println("history.back();"); // 이전 페이지로 돌아가는 스크립트를 출력합니다.
		println("</script>"); // 스크립트 태그를 닫습니다.
	}

	private void println(String str) {
		print(str + "\n"); // 문자열 끝에 줄바꿈 문자를 추가하여 출력합니다.
	}

	private void print(String str) {
		try {
			resp.getWriter().append(str); // 응답의 Writer를 사용하여 문자열을 출력합니다.
		} catch (IOException e) {
			e.printStackTrace(); // 출력 중 예외가 발생하면 스택 트레이스를 출력합니다.
		}
	}

	public void logout() {
		session.removeAttribute("loginedMemberId"); // 세션에 로그인된 회원 ID를 설정합니다.
		session.removeAttribute("loginedMember"); // 세션에 로그인된 회원 객체를 설정합니다.
	}

	public void login(Member member) {
		session.setAttribute("loginedMemberId", member.getId()); // 세션에 로그인된 회원 ID를 설정합니다.
		session.setAttribute("loginedMember", member); // 세션에 로그인된 회원 객체를 설정합니다. 
	}

	public void initBeforeActionInterceptor() {

	}

	public String historyBackOnView(String msg) {
		req.setAttribute("msg", msg); // 요청 객체에 메시지를 속성으로 설정합니다.
		req.setAttribute("historyBack", true); // 요청 객체에 historyBack 속성을 true로 설정합니다.
		return "usr/common/js";
	}

	public String getCurrentUri() {
		String currentUri = req.getRequestURI(); // 현재 요청 URI를 가져옵니다.
		String queryString = req.getQueryString(); // 쿼리 문자열을 가져옵니다.

		System.err.println(currentUri); // 에러 스트림에 현재 URI를 출력합니다.
		System.err.println(queryString); // 에러 스트림에 쿼리 문자열을 출력합니다.

		if (currentUri != null && queryString != null) {
			currentUri += "?" + queryString; // 쿼리 문자열이 있으면 URI에 추가합니다.
		}

		System.out.println(currentUri); // 표준 출력에 현재 URI를 출력합니다.

		return currentUri; // 현재 URI를 반환합니다.
	}

	public void jsprintReplace(String resultCode, String msg, String replaceUri) {
		resp.setContentType("text/html; charset=UTF-8"); // 응답의 콘텐츠 타입을 설정합니다.
		print(Ut.jsReplace(resultCode, msg, replaceUri)); // 자바스크립트를 사용하여 페이지를 교체합니다.

	}

	public String getLoginUri() {
		return "../member/MushionLogin?afterLoginUri=" + getAfterLoginUri(); // 로그인 URI를 반환합니다.
	}

	private String getAfterLoginUri() {
		return getEncodedCurrentUri();  // 현재 URI를 인코딩하여 반환합니다.
	}

	public String getEncodedCurrentUri() {
		return Ut.getEncodedCurrentUri(getCurrentUri()); // 현재 URI를 인코딩하여 반환합니다.
	}

	public String getLogoutUri() {
		return "../member/doLogout?afterLogoutUri=" + getAfterLogoutUri(); // 로그아웃 URI를 반환합니다.
	}

	private String getAfterLogoutUri() {

		String requestUri = req.getRequestURI();

		return getEncodedCurrentUri(); // 현재 URI를 인코딩하여 반환합니다.
	}

	public String getImgUri(int id) {
		return "/common/genFile/file/article/" + id + "/extra/Img/1"; // 이미지 URI를 반환합니다.
	}

	public String getProfileFallbackImgUri() { // 프로필 이미지가 없을 경우 표시할 기본 이미지 URI를 반환
		return "https://t4.ftcdn.net/jpg/04/73/25/49/360_F_473254957_bxG9yf4ly7OBO5I0O5KABlN930GwaMQz.jpg"; 
	}

	public String getProfileFallbackImgOnErrorHtml() { // 프로필 이미지 로드에 실패했을 때 대체 이미지를 사용하도록 하는 HTML 코드를 반환
		return "this.src = '" + getProfileFallbackImgUri() + "'";
	}

	public String getFindLoginIdUri() { // 로그인 ID 찾기 페이지로 이동하는 URI를 반환
		return "../member/findLoginId?afterFindLoginIdUri=" + getAfterFindLoginIdUri();
	}

	private String getAfterFindLoginIdUri() { // 로그인 ID 찾기 후 돌아올 URI를 반환
		return getEncodedCurrentUri();
	}

	public String getFindLoginPwUri() {  // 로그인 비밀번호 찾기 페이지로 이동하는 URI를 반환
		return "../member/findLoginPw?afterFindLoginPwUri=" + getAfterFindLoginPwUri();
	}

	private String getAfterFindLoginPwUri() {  // 로그인 비밀번호 찾기 후 돌아올 URI를 반환
		return getEncodedCurrentUri();
	}

}