package com.team2.simpleOrder.dao.order;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.team2.simpleOrder.dto.Order;

public interface IOrderDao1 {
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
	
	List<Order> getorderList(@Param("c_code") String c_code,@Param("oac_status") int oac_status,@Param("bd_date") String bd_date);
	
	
	

}
