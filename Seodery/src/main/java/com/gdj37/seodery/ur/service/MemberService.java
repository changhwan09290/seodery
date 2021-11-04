package com.gdj37.seodery.ur.service;

import javax.servlet.http.HttpServletResponse;

import com.gdj37.seodery.ur.dto.MemberDTO;

public interface MemberService {
	public void check_id(String id, HttpServletResponse response) throws Exception;

	public void check_email(String email, HttpServletResponse response) throws Exception;

	public int join_member(MemberDTO member, HttpServletResponse response) throws Exception;

	public Object update_mypage(MemberDTO member, HttpServletResponse response)  throws Exception;
	}
