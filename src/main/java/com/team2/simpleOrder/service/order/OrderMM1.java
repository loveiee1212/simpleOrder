package com.team2.simpleOrder.service.order;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.team2.simpleOrder.dao.order.IOrderDao1;
import com.team2.simpleOrder.dao.order.IOrderDao2;
import com.team2.simpleOrder.dao.order.IOrderDao3;
import com.team2.simpleOrder.dto.Order;

@Service
public class OrderMM1 {

	@Autowired
	private IOrderDao1 oDao;

	@Autowired
	private IOrderDao2 oDao2;

	@Autowired
	private IOrderDao3 oDao3;

	ModelAndView mav;

	
	
	//리스트 정보 가져오기
	public List<Order> getTablelist() {
		String c_code = "123123123123";
		System.out.println("c_code:" + c_code);
		//카테고리 가져오기
		List<Order> cList = oDao.getTcList(c_code);
		System.out.println(cList);
		//테이블 정보 가져오기
		List<Order> tList = oDao.getTList(c_code);
		System.out.println("tList" + tList);
		//새 리스트 만들기
		List<Order> ctgList = new ArrayList<Order>();
		for (int i = 0; i < cList.size(); i++) {
			Order odr = new Order();
			List<Integer> tNumList = new ArrayList<Integer>();
			for (int j = 0; j < tList.size(); j++) {
				if ((cList.get(i).getSc_name()).equals(tList.get(j).getSc_name())) {
					System.out
							.println("카테고리 이름 :" + cList.get(i).getSc_name() + "/ 테이블 번호 :" + tList.get(j).getSt_num());
					System.out.println("=============================");
					tNumList.add(tList.get(j).getSt_num());
				}
				odr.setTList(tNumList);
			}
			odr.setSc_name("<button class='category' onclick='opentable(event,\"table" + i + "\")'>"
					+ cList.get(i).getSc_name() + "</button>");
			odr.setSc_x(cList.get(i).getSc_x());
			odr.setSc_y(cList.get(i).getSc_y());
			ctgList.add(odr);
			System.out.println("-------------------------");
		}
		System.out.println(ctgList);
		return ctgList;
	}

	//예약정보 가져오기
	public HashMap<String, String> getReservList(Order odr) {
		List<Order> rList = oDao.getReservList(odr);
		System.out.println("rList" + rList);
		HashMap<String, String> hMap = makehtmlrList(rList);
		return hMap;
	}

	
	//가져온 예약정보를 html 태그를 추가해 hMap로 반환하기
	private HashMap<String, String> makehtmlrList(List<Order> rList) {
		StringBuilder sb = new StringBuilder();
		sb.append("<tr>");
		sb.append("<th style=\"width: 80px;\">No.</th>");
		sb.append("<th>연락처</th>");
		sb.append("<th>성함</th>");
		sb.append("<th>예약일시</th>");
		sb.append("<th>메모</th>");
		sb.append("<th style=\"width: 120px;\">취소</th>");
		sb.append("</tr>");
		if(rList!=null) {
		for (int i = 0; i < rList.size(); i++) {
			Order odr = rList.get(i);
			sb.append("<form action='deletereservlist' method='post'>");
			sb.append("<tr data-code='"+odr.getRsv_code()+"'>");
			sb.append("<td style=\"width: 80px;\">"+(i+1)+"</td>");
			sb.append("<td>"+odr.getRsv_phone()+"</td>");
			sb.append("<td>"+odr.getRsv_name()+"</td>");
			sb.append("<td>"+odr.getRsv_date()+"</td>");
			sb.append("<td>"+odr.getRsvm_memo()+"</td>");
			sb.append("<td><button>예약취소</button></td>");
			sb.append("</tr>");
			sb.append("</form>");
		}
	}
	else if(rList==null) {
		sb.append("<tr>");
		sb.append("<td colspan='6'>예약 정보가 없습니다.</td>");
		sb.append("</tr>");
	}
		HashMap<String, String> hMap = new HashMap<String, String>();
		hMap.put("reservList", sb.toString());
		return hMap;
	}

}
