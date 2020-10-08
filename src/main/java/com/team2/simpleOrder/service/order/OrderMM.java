package com.team2.simpleOrder.service.order;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.ModelAndView;

import com.team2.simpleOrder.dao.order.IOrderDao;
import com.team2.simpleOrder.dao.order.IDetailOrderDao;
import com.team2.simpleOrder.dao.order.IOrderDao3;
import com.team2.simpleOrder.dto.Order;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class OrderMM {

	@Autowired
	private IOrderDao oDao;

	@Autowired
	private IDetailOrderDao oDao2;

	@Autowired
	private IOrderDao3 oDao3;

	ModelAndView mav;

	// 리스트 정보 가져오기
	public HashMap<String, Object> getTablelist(HttpSession session) {
		String c_code = session.getAttribute("c_code").toString();
		// 카테고리 가져오기
		List<Order> cList = oDao.getTcList(c_code);
		// 테이블 정보 가져오기
		List<Order> tList = oDao.getTList(c_code);
		// 새 리스트 만들기
		List<Order> ctgList = new ArrayList<Order>();
		HashMap<String, Object> hMap = new HashMap<String, Object>();
		for (int i = 0; i < cList.size(); i++) {
			Order odr = new Order();
			List<Integer> tNumList = new ArrayList<Integer>();
			for (int j = 0; j < tList.size(); j++) {
				if ((cList.get(i).getSc_code()).equals(tList.get(j).getSc_code())) {
					tNumList.add(tList.get(j).getSt_num());
				}
				odr.setTList(tNumList);
			}
			odr.setSc_name("<button class='category' id='ctg" + (i + 1) + "'onclick='opentable(event,\"table" + i
					+ "\")'>" + cList.get(i).getSc_name() + "</button>");
			odr.setSc_x(cList.get(i).getSc_x());
			odr.setSc_y(cList.get(i).getSc_y());
			ctgList.add(odr);
		}
		hMap.put("ctginfo", makeHtmlctgList(cList));
		hMap.put("tableinfo", makeHtmltableList(cList, ctgList));
		hMap.put("list", ctgList);
		return hMap;
	}

	private String makeHtmltableList(List<Order> cList, List<Order> ctgList) {
		StringBuilder sb = new StringBuilder();
		for (int i = 0; i < cList.size(); i++) {
			sb.append("<div id='table" + i + "' class='tList'>");
			sb.append("<table id='ordertable'>");
			int x = cList.get(i).getSc_x();
			int y = cList.get(i).getSc_y();
			for (int a = 0; a < x * y; a += x) {
				sb.append("<tr>");
				for (int b = a; b < a + x; b++) {
					sb.append("<td>");
					if (i < 10) {
						sb.append("<div class='tables' id='tnum" + "0" + (i + 1) + (b + 1) + "' data-code=" + "0"
								+ (i+1) + "-" + (b + 1) + " style = 'visibility: hidden;'>" + (b + 1) + "</div>");
					} else {
						sb.append("<div class='tables' id='tnum" + (i + 1) + (b + 1) + "' data-code=" + (i + 1) + "-"
								+ (b+1) + " style = 'visibility: hidden;'>" + (b + 1) + "</div>");
					}
					sb.append("</td>");
				}
				sb.append("</tr>");
			}
			sb.append("</table>");
			sb.append("</div>");
		}
		return sb.toString();
	}

	// 카테고리 html 로 만들기
	private String makeHtmlctgList(List<Order> cList) {
		StringBuilder sb = new StringBuilder();
		for (int i = 0; i < cList.size(); i++) {
			Order odr = cList.get(i);
			sb.append("<button class='category' id='ctg" + (i + 1) + "'onclick='opentable(event,\"table" + i + "\")'>"
					+ cList.get(i).getSc_name() + "</button>");
		}
		return sb.toString();
	}

	// 예약정보 가져오기
	public HashMap<String, String> getReservList(HttpSession session, String rsv_date) {
		Order odr = new Order();
		odr.setRsv_date(rsv_date);
		odr.setC_code(session.getAttribute("c_code").toString());
		List<Order> rList = oDao.getReservList(odr);
		return makehtmlrList(rList);
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
		} else if (rList.size() == 0) {
			sb.append("<tr>");
			sb.append("<td colspan='6'>예약 정보가 없습니다.</td>");
			sb.append("</tr>");
		}
		HashMap<String, String> hMap = new HashMap<String, String>();
		hMap.put("reservList", sb.toString());
		return hMap;
	}

	@Transactional
	public HashMap<String, String> updateReserv(HttpSession session, String rsv_code, String rsv_name, String rsv_date, String rsv_phone, String rsvm_memo) {
		Order odr = new Order();
		HashMap<String, String> hMap = new HashMap<String, String>();
		if(rsv_name.equals("")||rsv_phone.equals("")||rsv_date.equals("")) {
			hMap.put("result", "올바르게 입력되지 않았습니다. 올바르게 입력 후 등록 또는 수정하십시오");
			return hMap;
		}
		odr.setRsv_code(rsv_code);
		odr.setRsv_name(rsv_name);
		odr.setRsv_date(rsv_date);
		odr.setRsv_phone(rsv_phone);
		odr.setRsvm_memo(rsvm_memo);
		System.out.println(odr.getRsv_date());
		odr.setC_code(session.getAttribute("c_code").toString());
		if (odr.getRsv_code() == "") {
			odr.setRsv_code(null);
		}
		if (odr.getRsvm_memo() == "") {
			odr.setRsvm_memo(null);
		}
		// 코드가 null 일 경우 ==> 새로운 예약정보 등록
		if (odr.getRsv_code() == null) {
			// 회사 코드에 대해 예약이 하나라도 있는지 검색
			int cnt = oDao.selectReservcnt(odr.getC_code());
			boolean result = false;
			boolean memoresult = false;
			// 하나도 없다면 예약코드가 1인 데이터 insert / 하나라도 있다면 제일 숫자가 큰 예약코드에 1을 더한 예약코드 생성 뒤 insert
			switch (cnt) {
			case 0:
				result = oDao.insertFirstReserv(odr);
				break;

			default:
				result = oDao.insertReserv(odr);
			}
			// 메모 데이터가 있다면 예약메모테이블에 등록
			if (odr.getRsvm_memo() != null) {
				memoresult = oDao.insertReservmemo(odr);
			} else if (odr.getRsvm_memo() == null) {
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
		String c_code = session.getAttribute("c_code").toString();
		HashMap<String, String> hMap = new HashMap<String, String>();
		boolean result = oDao.deleteReserv(c_code, rsv_code);
		if (result) {
			hMap.put("result", "삭제되었습니다.");
		}else {
			hMap.put("result", "삭제 실패. 다시 시도해주세요");
		}
		return hMap;
	}

	public List<Order> getorderList(HttpSession session, int oac_status) {
		String c_code = session.getAttribute("c_code").toString();
		String bd_date = session.getAttribute("bd_date").toString();
		Order odr = new Order();
		List<Order> oList = oDao.getorderList(c_code, oac_status, bd_date);
		log.info("oList :" + oList);
		return oList;
	}

	//자리이동
	@Transactional
	public HashMap<String, String> changeSeat(HttpSession session, String fcode, String foac_num, String scode,
			String soac_num, int type) {
		log.info("soac_num"+soac_num);
		log.info("type"+type);
		String[] splitfcode = fcode.split("-");
		String fsc_code = splitfcode[0];
		int fst_num = Integer.parseInt(splitfcode[1]);
		String[] splitscode = scode.split("-");
		String ssc_code = splitscode[0];
		int sst_num = Integer.parseInt(splitscode[1]);
		System.out.println("fsc_code"+fsc_code+"fst_num"+fst_num+"ssc_code"+ssc_code+"sstnum:"+sst_num);
		HashMap<String, Object> instMap = new HashMap<String, Object>();
		instMap.put("c_code",session.getAttribute("c_code").toString());
		instMap.put("bd_date",session.getAttribute("bd_date").toString());
		instMap.put("fsc_code",fsc_code);
		instMap.put("fst_num",fst_num);
		instMap.put("ssc_code",ssc_code);
		instMap.put("sst_num",sst_num);
		instMap.put("foac_num",foac_num);
		instMap.put("scode",scode);
		if(type!=0) {instMap.put("soac_num",soac_num);};
		HashMap<String,String> hMap = new HashMap<String, String>();
		switch (type) {
		//단순 자리이동
		case 0:
			if(oDao.changeSeatver1(instMap)) {
				hMap.put("result", "이동이 완료되었습니다.<br/>페이지를 다시 로드합니다.");
			}
			break;
		//합석
		case 1:
			if(oDao.sumSeat(instMap)&&oDao.deleteOrdernum(instMap)) {
				hMap.put("result", "합석이 완료되었습니다.<br/>페이지를 다시 로드합니다.");
			}
			break;
		//자리교체
		case 2:
			if(oDao.changeSeatver2(instMap)&&oDao.changeSeatver1(instMap)) {
				hMap.put("result", "교체가 완료되었습니다.<br/>페이지를 다시 로드합니다.");
			};
			break;
		}
		return hMap;
	}



}
