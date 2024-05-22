package com.example.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.repository.BoardRepository;
import com.example.demo.vo.Board;

@Service // 이 클래스를 서비스 컴포넌트로 선언하는 어노테이션
public class BoardService {

    @Autowired // BoardRepository 인스턴스를 주입하도록 지시하는 어노테이션
    private BoardRepository boardRepository; // BoardRepository 유형의 private 필드 boardRepository 선언

    public BoardService(BoardRepository boardRepository) { // BoardRepository 매개변수를 사용하는 생성자
        this.boardRepository = boardRepository; // 매개변수를 필드에 할당
    }

    public Board getBoardById(int boardId) { // ID에 해당하는 게시물을 가져오는 메서드 선언
        return boardRepository.getBoardById(boardId); // boardRepository의 getBoardById 메서드를 호출한 결과를 반환
    }
}
