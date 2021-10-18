package com.gdj37.seodery.park.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdj37.seodery.park.dao.IParkDao;

@Service
public class ParkService implements IParkService{

	@Autowired
	public IParkDao iParkDao;
}
