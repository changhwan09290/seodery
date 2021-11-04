package com.gdj37.seodery.ur.controller;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

public class IdCheckFormController {
	// 중복체크 이동
	@RequestMapping(value = "/IdCheckForm")
	public ModelAndView IdCheckForm(ModelAndView mav) throws Exception{
		
		
		mav.setViewName("Member/IdCheckForm");
		
		return mav;
	}

}
