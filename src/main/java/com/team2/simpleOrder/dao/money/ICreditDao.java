package com.team2.simpleOrder.dao.money;

import java.util.HashMap;
import java.util.List;

public interface ICreditDao {

	List<HashMap<String, Object>> getcreditList(HashMap<String, Object> selectMap);

}
