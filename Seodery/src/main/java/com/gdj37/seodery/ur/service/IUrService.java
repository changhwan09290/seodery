package com.gdj37.seodery.ur.service;

import java.util.HashMap;

public interface IUrService {

	HashMap<String, String> getm1(HashMap<String, String> params) throws Throwable;

	HashMap<String, String> login(HashMap<String, String> params) throws Throwable;

	int join(HashMap<String, String> params)throws Throwable;

}
