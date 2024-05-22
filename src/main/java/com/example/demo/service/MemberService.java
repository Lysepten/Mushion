package com.example.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.example.demo.repository.MemberRepository;
import com.example.demo.util.Ut;
import com.example.demo.vo.Member;
import com.example.demo.vo.ResultData;

@Service
public class MemberService {

    // 사이트 메인 URI
	@Value("${custom.siteMainUri}")
	private String siteMainUri;
    // 사이트 이름
	@Value("${custom.siteName}")
	private String siteName;

	@Autowired
	private MemberRepository memberRepository;

    // 회원가입 기능
	public ResultData<Integer> join(String loginId, String loginPw, String name, String nickname, String cellphoneNum,
			String email) {

        // 이미 존재하는 로그인 아이디 확인
		Member existsMember = getMemberByLoginId(loginId);

		if (existsMember != null) {
            // 이미 사용중인 아이디 에러 반환
			return ResultData.from("F-7", Ut.f("이미 사용중인 아이디(%s)입니다", loginId));
		}

        // 이미 존재하는 이름과 이메일 확인
		existsMember = getMemberByNameAndEmail(name, email);

		if (existsMember != null) {
            // 이미 사용중인 이름과 이메일 에러 반환
			return ResultData.from("F-8", Ut.f("이미 사용중인 이름(%s)과 이메일(%s)입니다", name, email));
		}

        // 비밀번호 암호화
		loginPw = Ut.sha256(loginPw);

        // 회원 정보 저장
		memberRepository.join(loginId, loginPw, name, nickname, cellphoneNum, email);

        // 마지막에 추가된 회원의 ID 가져오기
		int id = memberRepository.getLastInsertId();

		return ResultData.from("S-1", "회원가입이 완료되었습니다.", "id", id);

	}

    // 이름과 이메일로 회원 정보 가져오기
	public Member getMemberByNameAndEmail(String name, String email) {
		return memberRepository.getMemberByNameAndEmail(name, email);
	}

    // 로그인 아이디로 회원 정보 가져오기
	public Member getMemberByLoginId(String loginId) {
		return memberRepository.getMemberByLoginId(loginId);
	}

    // 회원 정보 가져오기
	public Member getMember(int id) {
		return memberRepository.getMember(id);
	}

    // 회원 정보 수정(비밀번호 포함)
	public ResultData modify(int loginedMemberId, String loginPw, String name, String nickname, String cellphoneNum,
			String email) {

        // 비밀번호 암호화
		loginPw = Ut.sha256(loginPw);

        // 회원 정보 수정
		memberRepository.modify(loginedMemberId, loginPw, name, nickname, cellphoneNum, email);
		return ResultData.from("S-1", "회원정보 수정 완료");
	}

    // 회원 정보 수정(비밀번호 제외)
	public ResultData modifyWithoutPw(int loginedMemberId, String name, String nickname, String cellphoneNum,
			String email) {
        // 회원 정보 수정
		memberRepository.modifyWithoutPw(loginedMemberId, name, nickname, cellphoneNum, email);
		return ResultData.from("S-1", "회원정보 수정 완료");
	}

    // 임시 비밀번호 설정
	private void setTempPassword(Member actor, String tempPassword) {
        // 임시 비밀번호 설정 후 회원 정보 수정
		memberRepository.modify(actor.getId(), Ut.sha256(tempPassword), null, null, null, null);
	}

}
