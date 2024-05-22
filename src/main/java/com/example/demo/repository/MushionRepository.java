package com.example.demo.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.example.demo.vo.snapshotUrl;

// MyBatis 매퍼 인터페이스를 나타내는 어노테이션
@Mapper
public interface MushionRepository {

    // 특정 패션 스타일 ID에 해당하는 URL을 조회하는 쿼리
    @Select("""
            SELECT *
            FROM `snapshotUrl`
            WHERE fashionStyleId = #{fashionStyleId}
            """)
    // 패션 스타일 ID로 URL을 찾는 메서드
    public List<snapshotUrl> findByFashionStyleId(int fashionStyleId);

}
