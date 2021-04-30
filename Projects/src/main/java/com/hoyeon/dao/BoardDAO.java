package com.hoyeon.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.hoyeon.dto.BoardDTO;

@Repository
public class BoardDAO {
	@Autowired
	private SqlSession sqlSession;


	public List<HashMap<String, Object>> list(Map<String, Object> map) {
		return sqlSession.selectList("board.list",map);
	}


	public void write(Map<String, Object> map) {
		sqlSession.insert("board.write", map);
	}


	public BoardDTO detail(int no) {
		return sqlSession.selectOne("board.detail",no);
	}
	
	
}
