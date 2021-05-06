package com.hoyeon.dao;

import java.util.ArrayList;
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


	public void write(BoardDTO dto) {
		sqlSession.insert("board.write", dto);
	}


	public BoardDTO detail(int bno) {
		return sqlSession.selectOne("board.detail", bno);
	}
	
	public BoardDTO detail(BoardDTO dto) {
		return sqlSession.selectOne("board.update", dto);
	}


	public void update2(Map<String, Object> map) {
		sqlSession.update("board.update2",map);
		
	}


	public void delete(Map<String, Object> map) {
		sqlSession.delete("board.delete", map);
	}


	public void commentInsert(Map<String, Object> map) {
		sqlSession.insert("comment.commentInsert", map);
		
	}


	public List<HashMap<String, Object>> commentList(int bno) {
	
		return sqlSession.selectList("comment.commentList",bno);
	}


	public List<HashMap<String, Object>> newWrite(Map<String, Object> map) {
		return sqlSession.selectList("board.newWrite", map);
	}


	public List<HashMap<String, Object>> popularWrite(Map<String, Object> map) {
		return sqlSession.selectList("board.popularWrite",map);
	}
	
}
