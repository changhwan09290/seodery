package com.gdj37.seodery.Bicycle.Dao;

import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Repository;

@Repository
public interface IBicycleDao {

	public int getASCnt(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getASList(HashMap<String, String> params) throws Throwable;

	public int getASAdd(HashMap<String, String> params) throws Throwable;

	public HashMap<String, String> getASDtl(HashMap<String, String> params) throws Throwable;

	public int getASUpdate(HashMap<String, String> params) throws Throwable;

	public int getASDelete(HashMap<String, String> params) throws Throwable;
	
	
}
