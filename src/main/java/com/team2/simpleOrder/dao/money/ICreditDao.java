package com.team2.simpleOrder.dao.money;

import java.util.HashMap;
import java.util.List;

public interface ICreditDao {
	//외상 리스트 조회
	List<HashMap<String, Object>> getcreditList(HashMap<String, Object> selectMap);
	//외상 상세정보 상품 리스트 조회
	List<HashMap<String, Object>> getdetailCredit(HashMap<String, Object> selecthMap);

}
