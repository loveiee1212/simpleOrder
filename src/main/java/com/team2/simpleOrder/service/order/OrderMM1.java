package com.team2.simpleOrder.service.order;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.ModelAndView;

import com.team2.simpleOrder.dao.order.IOrderDao1;
import com.team2.simpleOrder.dao.order.IOrderDao2;
import com.team2.simpleOrder.dao.order.IOrderDao3;
import com.team2.simpleOrder.dto.Order;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class OrderMM1 {

	@Autowired
	private IOrderDao1 oDao;

	@Autowired
	private IOrderDao2 oDao2;

	@Autowired
	private IOrderDao3 oDao3;

	ModelAndView mav;

	// 리스트 정보 가져오기
	public List<Order> getTablelist() {
		String c_code = "123123123123";
		System.out.println("c_code:" + c_code);
		// 카테고리 가져오기
		List<Order> cList = oDao.getTcList(c_code);
		System.out.println(cList);
		// 테이블 정보 가져오기
		List<Order> tList = oDao.getTList(c_code);
		System.out.println("tList" + tList);
		// 새 리스트 만들기
		List<Order> ctgList = new ArrayList<Order>();
		for (int i = 0; i < cList.size(); i++) {
			Order odr = new Order();
			List<Integer> tNumList = new ArrayList<Integer>();
			for (int j = 0; j < tList.size(); j++) {
				if ((cList.get(i).getSc_code()).equals(tList.get(j).getSc_code())) {
					System.out
							.println("카테고리 이름 :" + cList.get(i).getSc_name() + "/ 테이블 번호 :" + tList.get(j).getSt_num());
					System.out.println("=============================");
					tNumList.add(tList.get(j).getSt_num());
				}
				odr.setTList(tNumList);
			}
			odr.setSc_name("<button class='category' id='ctg"+(i+1)+"'onclick='opentable(event,\"table" + i + "\")'>"
					+ cList.get(i).getSc_name() + "</button>");
			odr.setSc_x(cList.get(i).getSc_x());
			odr.setSc_y(cList.get(i).getSc_y());
			ctgList.add(odr);
			System.out.println("-------------------------");
		}
		System.out.println(ctgList);
		return ctgList;
	}


	// 예약정보 가져오기
	public HashMap<String, String> getReservList(Order odr) {
		List<Order> rList = oDao.getReservList(odr);
		System.out.println("rList" + rList);
		HashMap<String, String> hMap = makehtmlrList(rList);
		return hMap;
	}

	// 가져온 예약정보를 html 태그를 추가해 hMap로 반환하기
	private HashMap<String, String> makehtmlrList(List<Order> rList) {
		StringBuilder sb = new StringBuilder();
		sb.append("<tr>");
		sb.append("<th style='width: 80px;'>No.</th>");
		sb.append("<th>연락처</th>");
		sb.append("<th>성함</th>");
		sb.append("<th>예약일시</th>");
		sb.append("<th>메모</th>");
		sb.append("</tr>");
		if (rList != null) {
			for (int i = 0; i < rList.size(); i++) {
				Order odr = rList.get(i);
				sb.append("<form action='deletereservlist' method='post'>");
				sb.append("<tr data-code='" + odr.getRsv_code() + "'>");
				sb.append("<td style=\"width: 80px;\">" + (i + 1) + "</td>");
				sb.append("<td style='width:100px;'>" + odr.getRsv_phone() + "</td>");
				sb.append("<td>" + odr.getRsv_name() + "</td>");
				sb.append("<td>" + odr.getRsv_date() + "</td>");
				if (odr.getRsvm_memo() == null) {
					sb.append("<td></td>");
				} else {
					sb.append("<td>" + odr.getRsvm_memo() + "</td>");
				}
				sb.append("</tr>");
				sb.append("</form>");
			}
		} else if (rList.size()==0) {
			sb.append("<tr>");
			sb.append("<td colspan='6'>예약 정보가 없습니다.</td>");
			sb.append("</tr>");
		}
		HashMap<String, String> hMap = new HashMap<String, String>();
		hMap.put("reservList", sb.toString());
		return hMap;
	}

	@Transactional
	public HashMap<String, String> updateReserv(HttpSession session, Order odr) {
		// String c_code=session.getAttribute("c_code").toString();
		String c_code = "123123123123";
		odr.setC_code(c_code);
		log.info("odr : " + odr);
		// 수정인지 예약인지 구분하기
		HashMap<String, String> hMap = new HashMap<String, String>();
		if (odr.getRsv_code() == "") {
			odr.setRsv_code(null);
		}
		if (odr.getRsvm_memo() == "") {
			odr.setRsvm_memo(null);
		}

		// 코드가 null 일 경우 ==> 새로운 예약정보 등록
		if (odr.getRsv_code() == null) {
			// 회사 코드에 대해 예약이 하나라도 있는지 검색
			int cnt = oDao.selectReservcnt(c_code);
			boolean result = false;
			boolean memoresult = false;
			// 하나도 없다면 예약코드가 1인 데이터 insert / 하나라도 있다면 제일 숫자가 큰 예약코드에 1을 더한 예약코드 생성 뒤 insert
			switch (cnt) {
			case 0:
				System.out.println("11");
				result = oDao.insertFirstReserv(odr);
				break;
				
			default:
				System.out.println("22");
				result = oDao.insertReserv(odr);
			}
			// 메모 데이터가 있다면 예약메모테이블에 등록
			log.info("result:"+result);
			System.out.println(odr.getRsvm_memo());
			if (odr.getRsvm_memo()!= null) {
				memoresult = oDao.insertReservmemo(odr);
			}else if(odr.getRsvm_memo()== null) {
				System.out.println("0000000000000000000000000");
				hMap.put("result", "등록이 완료되었습니다.");
				return hMap;
			}
			// 결과가 둘다 true라면 hMap 반환
			if (result && memoresult) {
				hMap.put("result", "등록이 완료되었습니다.");
				return hMap;
			}
		}
		// 예약코드가 있다면 update 진행
		else if (odr.getRsv_code() != null) {
			// 예약코드와 회사코드에 대한 예약메모 데이터가 있는지 확인
			int cnt = oDao.selectReservmemocnt(odr);
			// 예약메모에 정보가 없는데 삽입할 메모가 있다면 메모테이블에 insert 작업 진행
			if (cnt == 0 && odr.getRsvm_memo() != null) {
				oDao.insertReservmemo(odr);
			}
			// 예약메모에 정보가 있는데 삽입할 메모가 없다면 메모테이블에 삭제 작업 진행
			if (odr.getRsvm_memo() == null && cnt != 0) {
				oDao.deleteReservmemo(odr);
			}
			// 예약테이블과 메모테이블 업데이트 진행
			boolean result = oDao.updateReserv(odr);

			if (result) {
				hMap.put("result", "수정이 완료되었습니다.");
			}
		}
		return hMap;
	}

	public HashMap<String, String> deleteReserv(HttpSession session, String rsv_code) {
		//String c_code = session.getAttribute("c_code").toString();
		String c_code = "123123123123";
		HashMap<String, String> hMap = new HashMap<String, String>();
		boolean result = oDao.deleteReserv(c_code,rsv_code);
		if(result) {
			hMap.put("result", "삭제되었습니다.");
		}
		return hMap;
	}

	public List<Order> getorderList(HttpSession session, int oac_status) {
		String c_code = session.getAttribute("c_code").toString();
		String bd_date = session.getAttribute("bd_date").toString();
		Order odr = new Order();
		List<Order> oList = oDao.getorderList(c_code,oac_status,bd_date);
		log.info("oList :"+oList);
		List<Order> odrList = new ArrayList<Order>();
		HashMap<String, List<String>> pdMap = new HashMap<String, List<String>>();
		List<String> pdnList = new ArrayList<String>();
		List<String> pdcList = new ArrayList<String>();
		List<String> pdccList = new ArrayList<String>();
		List<Integer> cntList = new ArrayList<Integer>();
		for(int i = 0; i<oList.size();i++) {
			odr=oList.get(i);
			if(odr.getSc_code()==odr.getSc_code()&&odr.getSt_num()==odr.getSt_num()) {
				odr.setSc_code(odr.getSc_code());
				odr.setSt_num(odr.getSt_num());
				odr.setOac_num(odr.getOac_num());
				pdcList.add(odr.getPd_code());
				pdnList.add(odr.getPd_name());
				pdccList.add(odr.getPdc_code());
				cntList.add(odr.getOh_cnt());
			}
			pdMap.put("pdcList", pdcList);
			pdMap.put("pdnList", pdnList);
			pdMap.put("pdccList", pdccList);
			odr.setPdMap(pdMap);
			odr.setCntList(cntList);
		}
		odr.setPd_name(null);
		odr.setPdc_code(null);
		odr.setPd_code(null);
		odrList.add(odr);
		log.info("odrList:"+odrList);
		return odrList;
	}

}
