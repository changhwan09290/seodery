package com.gdj37.seodery.walk.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class WalkDao implements IWalkDao {
	
	@Autowired
	public SqlSession sqlSession;
}
