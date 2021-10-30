package com.gdj37.seodery.ur.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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

}
