package com.team2.simpleOrder.dao.money;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Update;

public interface ICreditAndPaymentDao {
	// 외상 리스트 조회
	List<HashMap<String, Object>> getcreditList(HashMap<String, Object> selectMap);

	// 외상 상세정보 상품 리스트 조회
	List<HashMap<String, Object>> getdetailCredit(HashMap<String, Object> selecthMap);

	// 결제정보가 있는지 select
	HashMap<String, Integer> selectpay(HashMap<String, Object> selectMap);

	// 결제하기
	boolean moneyPayment(HashMap<String, Object> insertMap);
	// 결제 완료 --> 주문테이블 업데이트

	@Update("UPDATE ORDER_AND_CREDIT SET OAC_STATUSCHANGETIME = NOW(),OAC_STATUS = -1 WHERE C_CODE = #{c_code} AND BD_DATE = #{bd_date} AND OAC_NUM = #{oac_num}")
	boolean updateOac(HashMap<String, String> hMap);

	@Update("UPDATE ORDER_AND_CREDIT SET OAC_STATUSCHANGETIME = NOW(),OAC_STATUS = 0 WHERE C_CODE = #{c_code} AND BD_DATE = #{bd_date} AND OAC_NUM = #{oac_num}")
	boolean addcreditList(HashMap<String, String> updateMap);

}
