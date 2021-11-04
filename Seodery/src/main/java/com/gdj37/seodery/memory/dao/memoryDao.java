package com.gdj37.seodery.memory.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class memoryDao implements ImemoryDao{

	@Autowired
	public SqlSession sqlSession;

	@Override
	public int getMSCnt(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectOne("memory.getMSCnt", params);
	}

	@Override
	public List<HashMap<String, String>> getmemoryList(HashMap<String, String> params) throws Throwable {
		return sqlSession.selectList("memory.getmemoryList", params);
	}


}
