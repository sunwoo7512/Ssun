package com.hoyeon.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.hoyeon.dao.UserDAO;
import com.hoyeon.dto.UserDTO;

@Service
public class UserService {

	@Autowired
	private UserDAO userDAO;

	public void join(UserDTO dto) {
		userDAO.join(dto);
	
	}

	public int idcheck(String id) {
		return userDAO.idcheck(id);
	}

	public int checkid(UserDTO dto) {
		return userDAO.idcheck(dto);
	}
}
