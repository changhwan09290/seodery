package com.gdj37.seodery.ur.service;

import java.io.PrintWriter;
import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Service;
import com.gdj37.seodery.ur.dao.UrDao;
import com.gdj37.seodery.ur.dto.MemberDTO;

@Service
public abstract class MemberServiceImpl implements MemberService {

	@Override
	public void check_id(String id, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void check_email(String email, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int join_member(MemberDTO member, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		return 0;
	}

	
}
