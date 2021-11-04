package com.gdj37.seodery.memory.dao;

import java.util.HashMap;
import java.util.List;

public interface ImemoryDao {

	public int getMSCnt(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getmemoryList(HashMap<String, String> params)throws Throwable;


}
