package com.gdj37.seodery.park.dao;

import java.util.HashMap;
import java.util.List;

public interface IParkDao {

	List<HashMap<String, String>> getPDList(HashMap<String, String> params);

}
