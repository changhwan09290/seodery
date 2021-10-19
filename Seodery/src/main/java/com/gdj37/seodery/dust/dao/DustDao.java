package com.gdj37.seodery.dust.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class DustDao implements IDustDao{

	@Autowired
	public SqlSession sqlSession;
}
