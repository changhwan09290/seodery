package com.gdj37.seodery.walk.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class WalkDao implements IWalkDao {
	
	@Autowired
	public SqlSession sqlSession;

	@Override
	public String getWalkNmExists(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("walk.getWalkNmExists", params);
	}

	@Override
	public int addWK(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.insert("walk.addWK", params);
	}

	@Override
	public int updateWK(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.update("walk.updateWK", params);
	}

	@Override
	public int addWalk(HashMap<String, String> params) throws Throwable {
		// TODO Auto-generated method stub
		return sqlSession.insert("walk.addWalk", params);
	}
}
