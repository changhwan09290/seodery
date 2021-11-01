package com.gdj37.seodery.park.dao;


import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ParkDao implements IParkDao{

	@Autowired
	public SqlSession sqlSession;

	@Override
	public int getPDCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("park.getPDCnt",params);
	}

	@Override
	public int addP(HashMap<String, String> params) throws Throwable {
		return sqlSession.insert("park.addP",params);
	}

	@Override
	public List<HashMap<String, String>> getPDList(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("park.getPDList",params);
	}

	@Override
	public String getParkNumIsExists(HashMap<String, String> params) throws Throwable {
		System.out.println("dao params >> " + params);
		return sqlSession.selectOne("park.getParkNumIsExists", params);
	}

	@Override
	public int updateP(HashMap<String, String> params) throws Throwable {
		return sqlSession.update("park.updateP", params);
	
}

	@Override
	public int addPK(HashMap<String, String> params) throws Throwable {
		System.out.println("params >>>>>>>>>>>>" + params);
		return sqlSession.insert("park.addPK", params);
	}

}