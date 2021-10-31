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
	public List<HashMap<String, String>> getPDList(HashMap<String, String> params) {
		return sqlSession.selectList("getPDList", params);
	}
	
}
