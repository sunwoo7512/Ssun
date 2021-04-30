package com.hoyeon.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.web.servlet.ModelAndView;

import com.hoyeon.dto.UserDTO;

@Repository
public class UserDAO {
	@Autowired
	private SqlSession sqlSession;

	public void join(UserDTO dto) {
		sqlSession.insert("user.join", dto);
		
	}

	public int idcheck(String id) {
		return sqlSession.selectOne("user.idcheck", id);
	}

	public int idcheck(UserDTO dto) {
		return sqlSession.selectOne("user.idcheck",dto);
	}
	
}
