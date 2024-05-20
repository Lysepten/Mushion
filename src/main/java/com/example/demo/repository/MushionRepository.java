package com.example.demo.repository;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import com.example.demo.vo.snapshotUrl;

@Mapper
public interface MushionRepository {
	
	@Select("""
			SELECT *
			FROM `snapshotUrl`
			WHERE fashionStyleId = #{fashionStyleId}
			""")
	public List<snapshotUrl> findByFashionStyleId(int fashionStyleId);

}