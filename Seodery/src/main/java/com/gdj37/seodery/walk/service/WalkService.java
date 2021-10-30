package com.gdj37.seodery.walk.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdj37.seodery.walk.dao.IWalkDao;

@Service
public class WalkService implements IWalkService {
	
	@Autowired
	public IWalkDao iWalkDao;
}
