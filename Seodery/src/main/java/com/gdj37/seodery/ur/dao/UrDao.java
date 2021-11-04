package com.gdj37.seodery.ur.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.gdj37.seodery.ur.dto.MemberDTO;

@Repository
public class UrDao implements IUrDao  {
	@Autowired SqlSession sqlsession;
	
	@Override
	public HashMap<String, String> getm1(HashMap<String, String> params) throws Throwable {
		return sqlsession.selectOne("Member.getm1",params);
	}

	@Override
	public HashMap<String, String> login(HashMap<String, String> params) throws Throwable {
		return sqlsession.selectOne("Member.login",params);
	}

	@Override
	public int join(HashMap<String, String> params) throws Throwable {
		return sqlsession.insert("Member.join",params);
	}
	// 마이페이지
		@Transactional
		public int update_mypage(MemberDTO member) throws Exception{
			return sqlsession.update("member.update_mypage", member);
		}
		// 아이디 중복 검사
		public int check_id(String id) throws Exception{
			return sqlsession.selectOne("member.check_id", id);
		}
		
		// 이메일 중복 검사
		public int check_email(String email) throws Exception{
			return sqlsession.selectOne("member.check_email", email);
		}
		
		// 회원가입
		@Transactional
		public int join_member(MemberDTO member) throws Exception{
			return sqlsession.insert("member.join_member", member);
		}
	}

