package com.example.demo.repository;

import org.apache.ibatis.annotations.Mapper; 
import org.apache.ibatis.annotations.Select;

import com.example.demo.vo.Board;

@Mapper // MyBatis Mapper로 인터페이스를 지정하는 어노테이션
public interface BoardRepository { // BoardRepository 인터페이스 선언

    @Select("""
				SELECT *
				FROM board
				WHERE id = #{boardId}
				AND delStatus = 0;
			""")
    public Board getBoardById(int boardId); // 게시물 ID에 해당하는 데이터를 가져오는 메서드 선언
}
