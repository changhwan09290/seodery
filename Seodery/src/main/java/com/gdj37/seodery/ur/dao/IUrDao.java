package com.gdj37.seodery.ur.dao;

import java.util.HashMap;

public interface IUrDao {

	HashMap<String, String> getm1(HashMap<String, String> params) throws Throwable;

	HashMap<String, String> login(HashMap<String, String> params)throws Throwable;

	int join(HashMap<String, String> params)throws Throwable;

}
