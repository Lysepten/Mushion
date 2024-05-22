package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.repository.ReplyRepository;
import com.example.demo.util.Ut;
import com.example.demo.vo.Reply;
import com.example.demo.vo.ResultData;

@Service
public class ReplyService {

    private final ReplyRepository replyRepository;

    @Autowired
    public ReplyService(ReplyRepository replyRepository) {
        this.replyRepository = replyRepository;
    }

    // 로그인한 회원과 관련된 댓글 리스트 가져오기
    public List<Reply> getForPrintReplies(int loginedMemberId, String relTypeCode, int relId) {
        List<Reply> replies = replyRepository.getForPrintReplies(loginedMemberId, relTypeCode, relId);

        for (Reply reply : replies) {
            controlForPrintData(loginedMemberId, reply);
        }

        return replies;
    }

    // 댓글 작성 기능
    public ResultData<Integer> writeReply(int loginedMemberId, String relTypeCode, int relId, String body) {
        replyRepository.writeReply(loginedMemberId, relTypeCode, relId, body);

        int id = replyRepository.getLastInsertId();

        return ResultData.from("S-1", Ut.f("%d번 댓글이 생성되었습니다", id), "id", id);
    }

    // 댓글 삭제 권한 확인
    public ResultData userCanDelete(int loginedMemberId, Reply reply) {
        if (reply.getMemberId() != loginedMemberId) {
            return ResultData.from("F-2", Ut.f("%d번 댓글에 대한 삭제 권한이 없습니다", reply.getId()));
        }

        return ResultData.from("S-1", Ut.f("%d번 댓글이 삭제 되었습니다", reply.getId()));
    }

    // 댓글 수정 권한 확인
    public ResultData userCanModify(int loginedMemberId, Reply reply) {
        if (reply.getMemberId() != loginedMemberId) {
            return ResultData.from("F-2", Ut.f("%d번 댓글에 대한 수정 권한이 없습니다", reply.getId()));
        }

        return ResultData.from("S-1", Ut.f("%d번 댓글을 수정했습니다", reply.getId()));
    }

    // 댓글 조회
    public Reply getReply(int id) {
        return replyRepository.getReply(id);
    }

    // 댓글 삭제
    public ResultData deleteReply(int id) {
        replyRepository.deleteReply(id);
        return ResultData.from("S-1", Ut.f("%d번 댓글을 삭제했습니다", id));
    }

    // 댓글 수정
    public void modifyReply(int id, String body) {
        replyRepository.modifyReply(id, body);
    }

    // 댓글 출력 데이터 제어
    private void controlForPrintData(int loginedMemberId, Reply reply) {
        if (reply == null) {
            return;
        }
        ResultData userCanModifyRd = userCanModify(loginedMemberId, reply);
        reply.setUserCanModify(userCanModifyRd.isSuccess());

        ResultData userCanDeleteRd = userCanDelete(loginedMemberId, reply);
        reply.setUserCanDelete(userCanDeleteRd.isSuccess());
    }
}
