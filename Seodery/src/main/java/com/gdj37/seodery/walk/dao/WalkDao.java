package com.gdj37.seodery.walk.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;

public class WalkDao implements IWalkDao {
	@Autowired
	public SqlSession sqlSession;
}
