package com.gdj37.seodery.dust.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdj37.seodery.park.dao.IParkDao;

@Service
public class DustService implements IDustService{

	@Autowired
	public IParkDao iParkDao;
}
