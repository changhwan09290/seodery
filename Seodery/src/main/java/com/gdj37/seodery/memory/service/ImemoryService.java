package com.gdj37.seodery.memory.service;

import java.util.HashMap;
import java.util.List;

public interface ImemoryService {

	public int getMSCnt(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getmemoryList(HashMap<String, String> params)throws Throwable;


}
