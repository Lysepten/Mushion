package com.example.demo.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;

import com.example.demo.service.ArticleService;
import com.example.demo.service.BoardService;
import com.example.demo.service.GenFileService;
import com.example.demo.service.ReactionPointService;
import com.example.demo.service.ReplyService;
import com.example.demo.util.Ut;
import com.example.demo.vo.Article;
import com.example.demo.vo.Board;
import com.example.demo.vo.Reply;
import com.example.demo.vo.ResultData;
import com.example.demo.vo.Rq;

import jakarta.servlet.http.HttpServletRequest;

// 컨트롤러 클래스를 나타내는 어노테이션
@Controller
public class UsrArticleController {

    // 의존성 주입
    @Autowired
    private Rq rq;

    @Autowired
    private ArticleService articleService;

    @Autowired
    private BoardService boardService;

    @Autowired
    private ReplyService replyService;

    @Autowired
    private GenFileService genFileService;

    @Autowired
    private ReactionPointService reactionPointService;

    // 기본 생성자
    public UsrArticleController() {

    }

    // 게시글 리스트를 보여주는 메서드
    @RequestMapping("/usr/article/list")
    public String showList(HttpServletRequest req, Model model, @RequestParam(defaultValue = "1") int boardId,
                           @RequestParam(defaultValue = "1") int page,
                           @RequestParam(defaultValue = "title,body") String searchKeywordTypeCode,
                           @RequestParam(defaultValue = "") String searchKeyword) {

        Rq rq = (Rq) req.getAttribute("rq");

        // 게시판 정보를 가져옴
        Board board = boardService.getBoardById(boardId);

        // 게시글 수를 가져옴
        int articlesCount = articleService.getArticlesCount(boardId, searchKeywordTypeCode, searchKeyword);

        if (board == null) {
            return rq.historyBackOnView("없는 게시판 입니다.");
        }

        // 한 페이지에 글 10개씩
        int itemsInAPage = 10;

        // 페이지 수 계산
        int pagesCount = (int) Math.ceil(articlesCount / (double) itemsInAPage);

        // 특정 페이지에 해당하는 게시글 목록을 가져옴
        List<Article> articles = articleService.getForPrintArticles(boardId, itemsInAPage, page, searchKeywordTypeCode, searchKeyword);

        // 모델에 속성 추가
        model.addAttribute("board", board);
        model.addAttribute("boardId", boardId);
        model.addAttribute("page", page);
        model.addAttribute("pagesCount", pagesCount);
        model.addAttribute("searchKeywordTypeCode", searchKeywordTypeCode);
        model.addAttribute("searchKeyword", searchKeyword);
        model.addAttribute("articlesCount", articlesCount);
        model.addAttribute("articles", articles);

        // 게시글 리스트 페이지 반환
        return "usr/article/list";
    }

    // 게시글 상세 정보를 보여주는 메서드
    @RequestMapping("/usr/article/detail")
    public String showDetail(HttpServletRequest req, Model model, int id) {
        Rq rq = (Rq) req.getAttribute("rq");

        // 게시글 정보를 가져옴
        Article article = articleService.getForPrintArticle(rq.getLoginedMemberId(), id);
        // 사용자의 리액션 데이터를 가져옴
        ResultData usersReactionRd = reactionPointService.usersReaction(rq.getLoginedMemberId(), "article", id);

        if (usersReactionRd.isSuccess()) {
            model.addAttribute("userCanMakeReaction", usersReactionRd.isSuccess());
        }

        // 해당 게시글의 댓글 목록을 가져옴
        List<Reply> replies = replyService.getForPrintReplies(rq.getLoginedMemberId(), "article", id);

        int repliesCount = replies.size();

        // 모델에 속성 추가
        model.addAttribute("article", article);
        model.addAttribute("replies", replies);
        model.addAttribute("repliesCount", repliesCount);
        model.addAttribute("isAlreadyAddGoodRp", reactionPointService.isAlreadyAddGoodRp(rq.getLoginedMemberId(), id, "article"));
        model.addAttribute("isAlreadyAddBadRp", reactionPointService.isAlreadyAddBadRp(rq.getLoginedMemberId(), id, "article"));

        // 게시글 상세 페이지 반환
        return "usr/article/detail";
    }

    // 게시글 조회수를 증가시키는 메서드
    @RequestMapping("/usr/article/doIncreaseHitCountRd")
    @ResponseBody
    public ResultData doIncreaseHitCountRd(int id) {
        // 조회수 증가
        ResultData increaseHitCountRd = articleService.increaseHitCount(id);

        if (increaseHitCountRd.isFail()) {
            return increaseHitCountRd;
        }

        // 증가된 조회수와 함께 결과 데이터를 반환
        ResultData rd = ResultData.newData(increaseHitCountRd, "hitCount", articleService.getArticleHitCount(id));
        rd.setData2("id", id);

        return rd;
    }

    // 게시글 작성 페이지를 보여주는 메서드
    @RequestMapping("/usr/article/write")
    public String showJoin(Model model) {
        // 현재 게시글 ID를 가져옴
        int currentId = articleService.getCurrentArticleId();

        // 모델에 속성 추가
        model.addAttribute("currentId", currentId);

        // 게시글 작성 페이지 반환
        return "usr/article/write";
    }

    // 게시글 작성 요청을 처리하는 메서드
    @RequestMapping("/usr/article/doWrite")
    @ResponseBody
    public String doWrite(HttpServletRequest req, int boardId, String title, String body, String replaceUri,
                          MultipartRequest multipartRequest) {
        Rq rq = (Rq) req.getAttribute("rq");

        // 제목이 비어 있는지 확인
        if (Ut.isNullOrEmpty(title)) {
            return Ut.jsHistoryBack("F-1", "제목을 입력해주세요");
        }
        // 내용이 비어 있는지 확인
        if (Ut.isNullOrEmpty(body)) {
            return Ut.jsHistoryBack("F-2", "내용을 입력해주세요");
        }

        // 게시글 작성
        ResultData<Integer> writeArticleRd = articleService.writeArticle(rq.getLoginedMemberId(), title, body, boardId);

        int id = (int) writeArticleRd.getData1();

        // 작성된 게시글을 가져옴
        Article article = articleService.getArticle(id);

        // 파일 업로드 처리
        Map<String, MultipartFile> fileMap = multipartRequest.getFileMap();
        for (String fileInputName : fileMap.keySet()) {
            MultipartFile multipartFile = fileMap.get(fileInputName);
            if (!multipartFile.isEmpty()) {
                genFileService.save(multipartFile, id);
            }
        }

        // 작성 완료 후 게시글 상세 페이지로 이동
        return Ut.jsReplace(writeArticleRd.getResultCode(), writeArticleRd.getMsg(), "../article/detail?id=" + id);
    }

    // 게시글 수정 페이지를 보여주는 메서드
    @RequestMapping("/usr/article/modify")
    public String showModify(HttpServletRequest req, Model model, int id) {
        Rq rq = (Rq) req.getAttribute("rq");

        // 수정할 게시글을 가져옴
        Article article = articleService.getForPrintArticle(rq.getLoginedMemberId(), id);

        if (article == null) {
            return Ut.jsHistoryBack("F-1", Ut.f("%d번 글은 존재하지 않습니다", id));
        }

        // 모델에 속성 추가
        model.addAttribute("article", article);

        // 게시글 수정 페이지 반환
        return "usr/article/modify";
    }

    // 게시글 수정 요청을 처리하는 메서드
    @RequestMapping("/usr/article/doModify")
    @ResponseBody
    public String doModify(HttpServletRequest req, int id, String title, String body) {
        Rq rq = (Rq) req.getAttribute("rq");

        // 수정할 게시글을 가져옴
        Article article = articleService.getArticle(id);

        if (article == null) {
            return Ut.jsHistoryBack("F-1", Ut.f("%d번 글은 존재하지 않습니다", id));
        }

        // 사용자가 수정할 수 있는지 확인
        ResultData loginedMemberCanModifyRd = articleService.userCanModify(rq.getLoginedMemberId(), article);

        if (loginedMemberCanModifyRd.isSuccess()) {
            // 게시글 수정
            articleService.modifyArticle(id, title, body);
        }

        // 수정 완료 후 게시글 상세 페이지로 이동
        return Ut.jsReplace(loginedMemberCanModifyRd.getResultCode(), loginedMemberCanModifyRd.getMsg(),
                "../article/detail?id=" + id);
    }

    // 게시글 삭제 요청을 처리하는 메서드
    @RequestMapping("/usr/article/doDelete")
    @ResponseBody
    public String doDelete(HttpServletRequest req, int id) {
        Rq rq = (Rq) req.getAttribute("rq");

        // 삭제할 게시글을 가져옴
        Article article = articleService.getArticle(id);

        if (article == null) {
            return Ut.jsHistoryBack("F-1", Ut.f("%d번 글은 존재하지 않습니다", id));
        }

        // 사용자가 삭제할 수 있는지 확인
        ResultData loginedMemberCanDeleteRd = articleService.userCanDelete(rq.getLoginedMemberId(), article);

        if (loginedMemberCanDeleteRd.isSuccess()) {
            // 게시글 삭제
            articleService.deleteArticle(id);
        }

        // 삭제 완료 후 게시글 리스트 페이지로 이동
        return Ut.jsReplace(loginedMemberCanDeleteRd.getResultCode(), loginedMemberCanDeleteRd.getMsg(),
                "../article/list");
    }
}
