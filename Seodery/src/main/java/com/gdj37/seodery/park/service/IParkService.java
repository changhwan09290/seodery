package com.gdj37.seodery.park.service;

import java.util.HashMap;
import java.util.List;

public interface IParkService {

	public int getPDCnt(HashMap<String, String> params) throws Throwable;

	public List<HashMap<String, String>> getPDList(HashMap<String, String> params);

}
