package com.team2.simpleOrder.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.team2.simpleOrder.dao.IMemberDao;
import com.team2.simpleOrder.dto.Member;

@Service
public class MemberMM {
	
	@Autowired
	private IMemberDao mDao;
	
	ModelAndView mav;
	
	public ModelAndView insertMember(Member mb) {
		mav = new ModelAndView();
		String path;
		
		if(mDao.insertMember(mb)) {
			path = "/";
		}else {
			path = "null";
		}
		mav.setViewName(path);
		return mav;
	}

}
