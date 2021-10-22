package com.gdj37.seodery.walk.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.gdj37.seodery.walk.dao.IWalkDao;

public class WalkService implements IWalkService {
	@Autowired
	public IWalkDao iwalkDao;
	//iwalkDao

}
