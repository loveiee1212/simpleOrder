package com.team2.simpleOrder.dao.order;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Update;

import com.team2.simpleOrder.dto.Order;

public interface IOrderDao {
	//좌석 카테고리 리스트
	List<Order> getTcList(String c_code);
	//좌석 리스트
	List<Order> getTList(String c_code);
	//예약정보 조회
	List<Order> getReservList(Order odr);
	//예약테이블 갯수 조회
	int selectReservcnt(String c_code);
	//예약테이블에 아무것도 없을 때 예약코드가 1인 데이터 삽입
	boolean insertFirstReserv(Order odr);
	//마지막 예약코드에 1을 더한 예약코드 데이터 삽입
	boolean insertReserv(Order odr);
	//예약메모 갯수 검색
	int selectReservmemocnt(Order odr);	
	//예약메모테이블에 insert
	boolean insertReservmemo(Order odr);
	//예약메모테이블에 데이터 삭제
	void deleteReservmemo(Order odr);
	//예약정보 update
	boolean updateReserv(Order odr);
	//예약삭제
	boolean deleteReserv(@Param("c_code") String c_code, @Param("rsv_code") String rsv_code);
	//주문정보 조회
	List<Order> getorderList(@Param("c_code") String c_code,@Param("oac_status") int oac_status,@Param("bd_date") String bd_date);
	//단순 자리이동
	@Update("UPDATE ORDER_AND_CREDIT SET SC_CODE=#{ssc_code},ST_NUM=#{sst_num} WHERE C_CODE =#{c_code} AND BD_DATE=#{bd_date} AND OAC_NUM = #{foac_num}")
	boolean changeSeatver1(HashMap<String, Object> instMap);
	//자리교체
	@Update("UPDATE ORDER_AND_CREDIT SET SC_CODE=#{fsc_code},ST_NUM=#{fst_num} WHERE C_CODE =#{c_code} AND BD_DATE=#{bd_date} AND OAC_NUM = #{soac_num}")
	boolean changeSeatver2(HashMap<String, Object> instMap);
	//합석(자리를 옮기는 쪽의 주문정보가 상실)
	@Update("UPDATE ORDER_HISTORY SET OAC_NUM=#{soac_num} WHERE C_CODE = #{c_code} AND BD_DATE =#{bd_date} AND OAC_NUM =#{foac_num}")
	boolean sumSeat(HashMap<String, Object> instMap);
	//합석(옮긴 뒤 주문번호 상태 바꾸기)
	@Update("UPDATE ORDER_AND_CREDIT SET OAC_STATUS = 2 WHERE C_CODE = #{c_code} AND BD_DATE =#{bd_date} AND OAC_NUM =#{foac_num}")
	boolean deleteOrdernum(HashMap<String, Object> instMap);
	
	
	

}
