package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.repository.ArticleRepository;
import com.example.demo.util.Ut;
import com.example.demo.vo.Article;
import com.example.demo.vo.ResultData;
import com.example.demo.vo.topdb;

// 서비스 클래스를 나타내는 어노테이션
@Service
public class ArticleService {

    // 의존성 주입
    @Autowired
    private ArticleRepository articleRepository;

    // 생성자
    public ArticleService(ArticleRepository articleRepository) {
        this.articleRepository = articleRepository;
    }

    // 추천 리스트를 가져오는 메서드
    public List<topdb> getForMushionSuggestList() {
        return articleRepository.getForMushionSuggestList();
    }

    // 특정 게시글을 가져오는 메서드
    public Article getForPrintArticle(int loginedMemberId, int id) {
        Article article = articleRepository.getForPrintArticle(id);
        controlForPrintData(loginedMemberId, article);
        return article;
    }

    // 게시글 데이터에 수정 및 삭제 권한 정보를 설정하는 메서드
    private void controlForPrintData(int loginedMemberId, Article article) {
        if (article == null) {
            return;
        }
        ResultData userCanModifyRd = userCanModify(loginedMemberId, article);
        article.setUserCanModify(userCanModifyRd.isSuccess());

        ResultData userCanDeleteRd = userCanDelete(loginedMemberId, article);
        article.setUserCanDelete(userCanDeleteRd.isSuccess());
    }

    // 사용자가 게시글을 삭제할 수 있는지 확인하는 메서드
    public ResultData userCanDelete(int loginedMemberId, Article article) {
        if (article.getMemberId() != loginedMemberId) {
            return ResultData.from("F-2", Ut.f("%d번 글에 대한 삭제 권한이 없습니다", article.getId()));
        }
        return ResultData.from("S-1", Ut.f("%d번 글이 삭제 되었습니다", article.getId()));
    }

    // 사용자가 게시글을 수정할 수 있는지 확인하는 메서드
    public ResultData userCanModify(int loginedMemberId, Article article) {
        if (article.getMemberId() != loginedMemberId) {
            return ResultData.from("F-2", Ut.f("%d번 글에 대한 수정 권한이 없습니다", article.getId()));
        }
        return ResultData.from("S-1", Ut.f("%d번 글을 수정했습니다", article.getId()));
    }

    // 새로운 게시글을 작성하는 메서드
    public ResultData<Integer> writeArticle(int memberId, String title, String body, int boardId) {
        articleRepository.writeArticle(memberId, title, body, boardId);
        int id = articleRepository.getLastInsertId();
        return ResultData.from("S-1", Ut.f("%d번 글이 생성되었습니다", id), "id", id);
    }

    // 게시글을 삭제하는 메서드
    public void deleteArticle(int id) {
        articleRepository.deleteArticle(id);
    }

    // 게시글을 수정하는 메서드
    public void modifyArticle(int id, String title, String body) {
        articleRepository.modifyArticle(id, title, body);
    }

    // 특정 게시글을 가져오는 메서드
    public Article getArticle(int id) {
        return articleRepository.getArticle(id);
    }

    // 모든 게시글을 가져오는 메서드
    public List<Article> getArticles() {
        return articleRepository.getArticles();
    }

    // 특정 게시판의 게시글 수를 가져오는 메서드
    public int getArticlesCount(int boardId, String searchKeywordTypeCode, String searchKeyword) {
        return articleRepository.getArticlesCount(boardId, searchKeywordTypeCode, searchKeyword);
    }

    // 게시글 조회수를 증가시키는 메서드
    public ResultData increaseHitCount(int id) {
        int affectedRow = articleRepository.increaseHitCount(id);
        if (affectedRow == 0) {
            return ResultData.from("F-1", "해당 게시물 없음", "id", id);
        }
        return ResultData.from("S-1", "해당 게시물 조회수 증가", "id", id);
    }

    // 특정 게시글의 조회수를 가져오는 메서드
    public Object getArticleHitCount(int id) {
        return articleRepository.getArticleHitCount(id);
    }

    // 특정 페이지의 게시글 목록을 가져오는 메서드
    public List<Article> getForPrintArticles(int boardId, int itemsInAPage, int page, String searchKeywordTypeCode, String searchKeyword) {
        int limitFrom = (page - 1) * itemsInAPage;
        int limitTake = itemsInAPage;
        return articleRepository.getForPrintArticles(boardId, limitFrom, limitTake, searchKeywordTypeCode, searchKeyword);
    }

    // 좋아요 리액션 포인트를 증가시키는 메서드
    public ResultData increaseGoodReactionPoint(int relId) {
        int affectedRow = articleRepository.increaseGoodReactionPoint(relId);
        if (affectedRow == 0) {
            return ResultData.from("F-1", "없는 게시물");
        }
        return ResultData.from("S-1", "좋아요 증가", "affectedRow", affectedRow);
    }

    // 싫어요 리액션 포인트를 증가시키는 메서드
    public ResultData increaseBadReactionPoint(int relId) {
        int affectedRow = articleRepository.increaseBadReactionPoint(relId);
        if (affectedRow == 0) {
            return ResultData.from("F-1", "없는 게시물");
        }
        return ResultData.from("S-1", "싫어요 증가", "affectedRow", affectedRow);
    }

    // 좋아요 리액션 포인트를 감소시키는 메서드
    public ResultData decreaseGoodReactionPoint(int relId) {
        int affectedRow = articleRepository.decreaseGoodReactionPoint(relId);
        if (affectedRow == 0) {
            return ResultData.from("F-1", "없는 게시물");
        }
        return ResultData.from("S-1", "좋아요 감소", "affectedRow", affectedRow);
    }

    // 싫어요 리액션 포인트를 감소시키는 메서드
    public ResultData decreaseBadReactionPoint(int relId) {
        int affectedRow = articleRepository.decreaseBadReactionPoint(relId);
        if (affectedRow == 0) {
            return ResultData.from("F-1", "없는 게시물");
        }
        return ResultData.from("S-1", "싫어요 감소", "affectedRow", affectedRow);
    }

    // 특정 게시글의 좋아요 리액션 포인트를 가져오는 메서드
    public int getGoodRP(int relId) {
        return articleRepository.getGoodRP(relId);
    }

    // 특정 게시글의 싫어요 리액션 포인트를 가져오는 메서드
    public int getBadRP(int relId) {
        return articleRepository.getBadRP(relId);
    }

    // 현재 게시글의 ID를 가져오는 메서드
    public int getCurrentArticleId() {
        return articleRepository.getCurrentArticleId();
    }
}
