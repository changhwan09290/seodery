package com.gdj37.seodery.Bicycle.Service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gdj37.seodery.Bicycle.Dao.IBicycleDao;

@Service
public class BicycleService implements IBicycleService {

	@Autowired
	public IBicycleDao iBicycleDao;

	@Override
	public int getASCnt(HashMap<String, String> params) throws Throwable {
		return iBicycleDao.getASCnt(params);
	}

	@Override
	public List<HashMap<String, String>> getASList(HashMap<String, String> params) throws Throwable {
		return iBicycleDao.getASList(params);
	}

	@Override
	public int getASAdd(HashMap<String, String> params) throws Throwable {
		return iBicycleDao.getASAdd(params);
	}

	@Override
	public HashMap<String, String> getASDtl(HashMap<String, String> params) throws Throwable {
		return iBicycleDao.getASDtl(params);
	}

	@Override
	public int getASUpdate(HashMap<String, String> params) throws Throwable {
		return iBicycleDao.getASUpdate(params);
	}

	@Override
	public int getASDelete(HashMap<String, String> params) throws Throwable {
		return iBicycleDao.getASDelete(params);
	}
}
