package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.service.ReactionPointService;
import com.example.demo.service.ReplyService;
import com.example.demo.util.Ut;
import com.example.demo.vo.Reply;
import com.example.demo.vo.ResultData;
import com.example.demo.vo.Rq;

import jakarta.servlet.http.HttpServletRequest;

@Controller
public class UsrReplyController {

    @Autowired
    private Rq rq;

    @Autowired
    private ReplyService replyService;

    @Autowired
    private ReactionPointService reactionPointService;

    // 댓글 작성 기능
    @RequestMapping("/usr/reply/doWrite")
    @ResponseBody
    public String doWrite(HttpServletRequest req, String relTypeCode, int relId, String body) {

        // 요청 객체에서 Rq 객체 받아오기
        Rq rq = (Rq) req.getAttribute("rq");

        // 입력값 유효성 검사
        if (Ut.isNullOrEmpty(relTypeCode)) {
            return Ut.jsHistoryBack("F-1", "relTypeCode을 입력해주세요");
        }
        if (Ut.isEmpty(relId)) {
            return Ut.jsHistoryBack("F-2", "relId을 입력해주세요");
        }
        if (Ut.isNullOrEmpty(body)) {
            return Ut.jsHistoryBack("F-3", "내용을 입력해주세요");
        }

        // 댓글 작성 서비스 호출
        ResultData<Integer> writeReplyRd = replyService.writeReply(rq.getLoginedMemberId(), relTypeCode, relId, body);

        // 작성된 댓글의 ID 받아오기
        int id = (int) writeReplyRd.getData1();

        // 결과 반환
        return Ut.jsReplace(writeReplyRd.getResultCode(), writeReplyRd.getMsg(), "../article/detail?id=" + relId);
    }

    // 댓글 삭제 기능
    @RequestMapping("/usr/reply/doDelete")
    @ResponseBody
    public String doDelete(HttpServletRequest req, int id, String replaceUri) {
        // 요청 객체에서 Rq 객체 받아오기
        Rq rq = (Rq) req.getAttribute("rq");

        // 삭제할 댓글 조회
        Reply reply = replyService.getReply(id);

        // 삭제할 댓글이 없을 경우 처리
        if (reply == null) {
            return Ut.jsHistoryBack("F-1", Ut.f("%d번 댓글은 존재하지 않습니다", id));
        }

        // 댓글 삭제 권한 확인
        ResultData loginedMemberCanDeleteRd = replyService.userCanDelete(rq.getLoginedMemberId(), reply);

        // 삭제 권한이 있을 경우 댓글 삭제
        if (loginedMemberCanDeleteRd.isSuccess()) {
            replyService.deleteReply(id);
        }

        // 대체 URI가 없을 경우 기본적인 URI 설정
        if (Ut.isNullOrEmpty(replaceUri)) {
            switch (reply.getRelTypeCode()) {
                case "article":
                    replaceUri = Ut.f("../article/detail?id=%d", reply.getRelId());
                    break;
            }
        }

        // 결과 반환
        return Ut.jsReplace(loginedMemberCanDeleteRd.getResultCode(), loginedMemberCanDeleteRd.getMsg(), replaceUri);
    }

    // 댓글 수정 기능
    @RequestMapping("/usr/reply/doModify")
    @ResponseBody
    public String doModify(HttpServletRequest req, int id, String body) {
        // 요청 객체에서 Rq 객체 받아오기
        Rq rq = (Rq) req.getAttribute("rq");

        // 수정할 댓글 조회
        Reply reply = replyService.getReply(id);

        // 수정할 댓글이 없을 경우 처리
        if (reply == null) {
            return Ut.jsHistoryBack("F-1", Ut.f("%d번 댓글은 존재하지 않습니다", id));
        }

        // 댓글 수정 권한 확인
        ResultData loginedMemberCanModifyRd = replyService.userCanModify(rq.getLoginedMemberId(), reply);

        // 수정 권한이 있을 경우 댓글 수정
        if (loginedMemberCanModifyRd.isSuccess()) {
            replyService.modifyReply(id, body);
        }

        // 수정된 댓글 내용 반환
        reply = replyService.getReply(id);

        return reply.getBody();
    }
}
