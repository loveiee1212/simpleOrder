package com.team2.simpleOrder.service.money;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.ModelAndView;

import com.team2.simpleOrder.dao.money.IBillDao;
import com.team2.simpleOrder.dao.money.ICreditAndPaymentDao;

@Service
public class BillMM {
	@Autowired
	IBillDao bDao;
	
	@Autowired
	ICreditAndPaymentDao cDao;

	public ModelAndView getBillList(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		HashMap<String, String> selectMap = new HashMap<String,String>();
		selectMap.put("c_code", session.getAttribute("c_code").toString());
		selectMap.put("bd_date",session.getAttribute("bd_date").toString().substring(0,10));
		selectMap.put("oac_num", null);
		List<HashMap<String, Object>> bList = bDao.getBillList(selectMap);
		mav.addObject("bList", makeHtmlbList(bList));
		mav.setViewName("money/billcontrol");
		return mav;
	}
	
	// 영수증 상세정보 불러오기
		public HashMap<String, Object> getDetailBill(HttpSession session, String bd_date, String oac_num, int oac_status) {
			String c_code = session.getAttribute("c_code").toString();
			HashMap<String, Object> comList = new HashMap<String, Object>();
			HashMap<String, Object> hMap = new HashMap<String, Object>();
			List<HashMap<String, Object>> pList = new ArrayList<HashMap<String, Object>>();
			List<HashMap<String, Object>> payList = new ArrayList<HashMap<String, Object>>();
			// 사업장정보 담기
			comList = bDao.getcompanyList(c_code);
			// 상품정보 담기
			pList = bDao.getproductList(c_code, bd_date, oac_num);
			// 결제정보 담기
			payList = bDao.getpayList(c_code, bd_date, oac_num);
			String companyList = makehtmlcList(comList);
			String productList = makehtmlproductList(pList, oac_status);
			String paymentList = makehtmlpaymentList(payList, oac_status);
			hMap.put("productList", productList);
			hMap.put("companyName", comList.get("C_NAME").toString());
			hMap.put("companyList", companyList);
			hMap.put("paymentList", paymentList);
			hMap.put("oac_status",oac_status);
			return hMap;
		}
	
	//반품으로 변경
	@Transactional
	public HashMap<String, String> cancelPay(HttpSession session, String bd_date, String oac_num, int oac_status) {
		String c_code = session.getAttribute("c_code").toString();
		HashMap<String, Object> insertMap = new HashMap<String, Object>();
		insertMap.put("c_code", c_code);
		insertMap.put("bd_date", bd_date);
		insertMap.put("oac_num", oac_num);
		HashMap<String, String> hMap = new HashMap<String, String>();
		if(bDao.cancelPay(c_code, bd_date, oac_num)) {
			cDao.updatestockList(insertMap);
			hMap.put("result", "결제 취소가 완료되었습니다.");
		}else {
			hMap.put("result", "결제 취소 실패. 다시 시도해주세요");
		}
		return hMap;
	}

	// 전체내역 html 태그 변환 출력
	private String makeHtmlbList(List<HashMap<String, Object>> bList) {
		StringBuilder sb = new StringBuilder();
		sb.append("<table>");
		sb.append("<tr>");
		sb.append("<th style='width : 10px;'>No.</th>");
		sb.append("<th>주문번호</th>");
		sb.append("<th>영업일</th>");
		sb.append("<th>현금결제금액</th>");
		sb.append("<th>카드결제금액</th>");
		sb.append("<th>주문상태</th>");
		sb.append("</tr>");
		for (int i = 0; i < bList.size(); i++) {
			sb.append("<tr class='blist_tr'>");
			sb.append("<td style='width : 10px;'>" + ( i +1) + "</td>");
			sb.append("<td><input type ='hidden' id='oac_num' value='" + bList.get(i).get("OAC_NUM").toString() + "'>"
					+ bList.get(i).get("OAC_NUM").toString() + "</td>");
			sb.append("<td><input type='hidden' id='bd_date' value='" + bList.get(i).get("BD_DATE") + "'>"
					+ bList.get(i).get("BD_DATE").toString().substring(0, 10) + "</td>");
			if (bList.get(i).get("GET_CASH") == null) {
				sb.append("<td></td>");
				sb.append("<td></td>");
			} else {
				sb.append("<td id='getcashvalue'>" + bList.get(i).get("TOTALCASH") + "</td>");
				sb.append("<td id='getCardvalue'>" + bList.get(i).get("TOTALCARD") + "</td>");
			}
			sb.append("<td><input type='hidden' id ='oac_status' data-code='" + bList.get(i).get("oac_status") + "'>"
					+ bList.get(i).get("oac_name") + "</td>");
			sb.append("</tr>");
		}
		sb.append("</table>");
		return sb.toString();
	}

	

	// 결제정보 담기
	private String makehtmlpaymentList(List<HashMap<String, Object>> payList, int oac_status) {
		StringBuilder sb = new StringBuilder();
		if (payList.size() > 0) {
			sb.append("<table id='payTable'>");
			int total = 0;
			switch (oac_status) {
			// 반품
			case -2:
				for (int i = 0; i < payList.size(); i++) {
					// 카드결제
					if (Integer.parseInt(payList.get(i).get("PMT_CASH").toString()) == 0) {
						sb.append("<tr>");
						sb.append("<th class='leftT' colspan='2'>카드 결제금액</th>");
						sb.append("<td class='rightT' colspan='2'>"
								+ ((-1) * Integer.parseInt(payList.get(i).get("PMT_CARD").toString())) + "</td>");
						sb.append("</tr>");
					} else {
						// 현금결제
						sb.append("<tr>");
						sb.append("<th class='leftT' colspan='2'>현금 결제금액</th>");
						sb.append("<td class='rightT' colspan='2'>"
								+ ((-1) * Integer.parseInt(payList.get(i).get("PMT_CASH").toString())) + "</td>");
						sb.append("</tr>");
						sb.append("<tr>");
					}
					sb.append("<tr>");
					sb.append("<td colspan='4'></td>");
					sb.append("</tr>");

				}
				break;
			// 결제
			case -1:
				for (int i = 0; i < payList.size(); i++) {
					total += Integer.parseInt(payList.get(i).get("PMT_CASH").toString());
					total += Integer.parseInt(payList.get(i).get("PMT_CARD").toString());
					// 카드결제
					if (Integer.parseInt(payList.get(i).get("PMT_CASH").toString()) == 0) {
						sb.append("<tr>");
						sb.append("<th class='leftT' colspan='2'>카드 결제금액</th>");
						sb.append("<td class='rightT' colspan='2'>"
								+ Integer.parseInt(payList.get(i).get("PMT_CARD").toString()) + "</td>");
						sb.append("</tr>");
						sb.append("<tr>");
						sb.append("<td colspan='4'></td>");
						sb.append("</tr>");
					} else {
						// 현금결제
						sb.append("<tr>");
						sb.append("<th class='leftT' colspan='2'>현금 결제금액</th>");
						sb.append("<td class='rightT' colspan='2'>"
								+ Integer.parseInt(payList.get(i).get("PMT_CASH").toString()) + "</td>");
						sb.append("</tr>");
						sb.append("<tr>");
						sb.append("<th class='leftT' colspan='2'>받은 금액</th>");
						sb.append("<td class='rightT' colspan='2'>"
								+ Integer.parseInt(payList.get(i).get("GET_CASH").toString()) + "</td>");
						sb.append("</tr>");
						//거스름돈이 있다면 거스름돈 출력
						if(((Integer.parseInt(payList.get(i).get("GET_CASH").toString()))
								- (Integer.parseInt(payList.get(i).get("PMT_CASH").toString())))>0) {							
							sb.append("<tr>");
							sb.append("<th class='leftT' colspan='2'>거스름</th>");
							sb.append("<td class='rightT' colspan='2'>"
									+ ((Integer.parseInt(payList.get(i).get("GET_CASH").toString()))
											- (Integer.parseInt(payList.get(i).get("PMT_CASH").toString()))) + "</td>");
							sb.append("</tr>");
						}
						sb.append("<tr>");
						sb.append("<td colspan='4'></td>");
						sb.append("</tr>");
					}
					sb.append("<tr>");
					sb.append("<td colspan='4'></td>");
					sb.append("</tr>");
				}
				sb.append("<tr>");
				sb.append("<th class='leftT' colspan='2'>총 결제금액</th>");
				sb.append("<td class='rightT' colspan='2'>"+"<input type='hidden' id='total' value='"+total+"'/>"
						+ total + "</td>");
				sb.append("</tr>");
				break;
			// 외상
			case 0:
				for (int i = 0; i < payList.size(); i++) {
					total += Integer.parseInt(payList.get(i).get("PMT_CASH").toString());
					total += Integer.parseInt(payList.get(i).get("PMT_CARD").toString());
					// 카드결제
					if (Integer.parseInt(payList.get(i).get("PMT_CASH").toString()) == 0) {
						sb.append("<tr>");
						sb.append("<th class='leftT' colspan='2'>카드 결제금액</th>");
						sb.append("<td class='rightT' colspan='2'>"
								+ Integer.parseInt(payList.get(i).get("PMT_CARD").toString()) + "</td>");
						sb.append("</tr>");
						sb.append("<tr>");
						sb.append("<td colspan='4'></td>");
						sb.append("</tr>");
					} else {
						// 현금결제
						sb.append("<tr>");
						sb.append("<th class='leftT' colspan='2'>현금 결제금액</th>");
						sb.append("<td class='rightT' colspan='2'>"
								+ Integer.parseInt(payList.get(i).get("PMT_CASH").toString()) + "</td>");
						sb.append("</tr>");
						sb.append("<tr>");
						sb.append("<th class='leftT' colspan='2'>받은 금액</th>");
						sb.append("<td class='rightT' colspan='2'>"
								+ Integer.parseInt(payList.get(i).get("GET_CASH").toString()) + "</td>");
						sb.append("</tr>");
						//거스름돈이 있다면 거스름돈 출력
						if(((Integer.parseInt(payList.get(i).get("GET_CASH").toString()))
								- (Integer.parseInt(payList.get(i).get("PMT_CASH").toString())))>0) {							
							sb.append("<tr>");
							sb.append("<th class='leftT' colspan='2'>거스름</th>");
							sb.append("<td class='rightT' colspan='2'>"
									+ ((Integer.parseInt(payList.get(i).get("GET_CASH").toString()))
											- (Integer.parseInt(payList.get(i).get("PMT_CASH").toString()))) + "</td>");
							sb.append("</tr>");
						}
						sb.append("<tr>");
						sb.append("<td colspan='4'></td>");
						sb.append("</tr>");
					}
					sb.append("<tr>");
					sb.append("<td colspan='4'></td>");
					sb.append("</tr>");
				}
				sb.append("<tr>");
				sb.append("<th class='leftT' colspan='2'>총 결제금액</th>");
				sb.append("<td class='rightT' colspan='2'>"+"<input type='hidden' id='total' value='"+total+"'/>"
						+ total + "</td>");
				sb.append("</tr>");
				sb.append("<tr>");
				sb.append("<th class='leftT' colspan='2'>남은 결제금액</th>");
				sb.append("<td class='rightT' colspan='2' id='uctcredit'></td>");
				sb.append("</tr>");
				break;
			// 주문중
			case 1:
				for (int i = 0; i < payList.size(); i++) {
					total += Integer.parseInt(payList.get(i).get("PMT_CASH").toString());
					total += Integer.parseInt(payList.get(i).get("PMT_CARD").toString());
					// 카드결제
					if (Integer.parseInt(payList.get(i).get("PMT_CASH").toString()) == 0) {
						sb.append("<tr>");
						sb.append("<th class='leftT' colspan='2'>카드 결제금액</th>");
						sb.append("<td class='rightT' colspan='2'>"
								+ Integer.parseInt(payList.get(i).get("PMT_CARD").toString()) + "</td>");
						sb.append("</tr>");
						sb.append("<hr/>");
					} else {
						// 현금결제
						sb.append("<tr>");
						sb.append("<th class='leftT' colspan='2'>현금 결제금액</th>");
						sb.append("<td class='rightT' colspan='2'>"
								+ Integer.parseInt(payList.get(i).get("PMT_CASH").toString()) + "</td>");
						sb.append("</tr>");
						sb.append("<tr>");
						sb.append("<th class='leftT' colspan='2'>받은 금액</th>");
						sb.append("<td class='rightT' colspan='2'>"
								+ Integer.parseInt(payList.get(i).get("GET_CASH").toString()) + "</td>");
						sb.append("</tr>");
						//거스름돈이 있다면 거스름돈 출력
						if(((Integer.parseInt(payList.get(i).get("GET_CASH").toString()))
								- (Integer.parseInt(payList.get(i).get("PMT_CASH").toString())))>0) {							
							sb.append("<tr>");
							sb.append("<th class='leftT' colspan='2'>거스름</th>");
							sb.append("<td class='rightT' colspan='2'>"
									+ ((Integer.parseInt(payList.get(i).get("GET_CASH").toString()))
											- (Integer.parseInt(payList.get(i).get("PMT_CASH").toString()))) + "</td>");
							sb.append("</tr>");
						}
						sb.append("<hr/>");
					}
					sb.append("<tr>");
					sb.append("<td colspan='4'></td>");
					sb.append("</tr>");
				}
				sb.append("<tr>");
				sb.append("<th class='leftT' colspan='2'>총 결제금액</th>");
				sb.append("<td class='rightT' colspan='2'>"+"<input type='hidden' id='total' value='"+total+"'/>"
						+ total + "</td>");
				sb.append("</tr>");
				sb.append("<tr>");
				sb.append("<th class='leftT' colspan='2'>남은 결제금액</th>");
				sb.append("<td class='rightT' colspan='2' id='uctcredit'></td>");
				sb.append("</tr>");
				break;

			}
			sb.append("</table>");
		}
		return sb.toString();
	}

	// 상품리스트
	private String makehtmlproductList(List<HashMap<String, Object>> pList, int oac_status) {
		StringBuilder sb = new StringBuilder();
		sb.append("<hr/>");
		sb.append("<table id='proTable'>");
		sb.append("<tr>");
		sb.append("<td colspan='2'>제품명</td>");
		sb.append("<td>수량</td>");
		sb.append("<td>총금액</td>");
		sb.append("</tr>");
		int totalprice = 0;
		for (int i = 0; i < pList.size(); i++) {
			totalprice += Integer.parseInt(pList.get(i).get("TOTALPRICE").toString());
			sb.append("<tr>");
			sb.append("<td>" + (i + 1) + "</td>");
			sb.append("<td>" + pList.get(i).get("PD_NAME") + "</td>");
			sb.append("<td>" + pList.get(i).get("OH_CNT") + "</td>");
			sb.append("<td>" + pList.get(i).get("TOTALPRICE") + "</td>");
			sb.append("</tr>");
		}
		sb.append("<tr>");
		sb.append("<td colspan='3'>총 합계</td>");
		sb.append("<td id='all_total'>" + totalprice + "</td>");
		sb.append("</tr>");
		sb.append("</table>");

		return sb.toString();
	}

	// 사업장정보
	private String makehtmlcList(HashMap<String, Object> comList) {
		StringBuilder sb = new StringBuilder();
		sb.append(comList.get("C_NAME") + "<br/>");
		String addrInfo ="";
		String[]  addr =  comList.get("C_ADDRESS").toString().split("#");
		for(String detailaddr : addr) {
			addrInfo+=detailaddr;
		}
		sb.append(addrInfo+"</br>");
		sb.append("사업자번호 | " + comList.get("C_CODE") + "<br/>");
		sb.append("tel." + comList.get("C_PHONE") + "<br/>");
		return sb.toString();
	}

	// 영수증 검색조회
	public HashMap<String, String> searchBills(HttpSession session, String date, String code) {
		HashMap<String, String> selectMap = new HashMap<String, String>();
		selectMap.put("c_code", session.getAttribute("c_code").toString());
		if(date.equals("")||date==null) {
			selectMap.put("bd_date", session.getAttribute("bd_date").toString().substring(0,10));
		}else {			
			selectMap.put("bd_date", date);
		}
		if(code==""||code==null) {
			selectMap.put("oac_num", null);
		}else {			
			selectMap.put("oac_num", code);
		}
		List<HashMap<String, Object>> bList = bDao.getBillList(selectMap);
		HashMap<String, String> hMap = new HashMap<String, String>();
		hMap.put("result", makeHtmlbList(bList));
		return hMap;
	}

	public ModelAndView popupForPrint(HttpSession session, String bd_date, String oac_num, int oac_status, int ptype) {
		String c_code = session.getAttribute("c_code").toString();
		HashMap<String, Object> comList = new HashMap<String, Object>();
		List<HashMap<String, Object>> pList = new ArrayList<HashMap<String, Object>>();
		List<HashMap<String, Object>> payList = new ArrayList<HashMap<String, Object>>();
		ModelAndView mav = new ModelAndView();
		// 사업장정보 담기
		comList = bDao.getcompanyList(c_code);
		// 상품정보 담기
		pList = bDao.getproductList(c_code, bd_date, oac_num);
		String companyList = makehtmlcList(comList);
		String productList = makehtmlproductList(pList, oac_status);
		mav.addObject("cList",companyList);
		mav.addObject("proList",productList);
		// 결제정보 담기
		if(ptype==1) {			
			payList = bDao.getpayList(c_code, bd_date, oac_num);
			String paymentList = makehtmlpaymentList(payList, oac_status);
			mav.addObject("payList",paymentList);
		}
		mav.setViewName("money/popupForprint");
		return mav;
	}


	//현금영수증 데이터 전송
	public ModelAndView sendcashbills(HttpSession session, int cashamount, String bd_date, String oac_num,
			int oac_status, String cash_name, int type) {
		HashMap<String, Object> insertMap = new HashMap<String, Object>();
		insertMap.put("c_code", session.getAttribute("c_code").toString());
		insertMap.put("bd_date", bd_date);
		insertMap.put("oac_num", oac_num);
		insertMap.put("oac_status", oac_status);
		insertMap.put("cashamount", cashamount);
		insertMap.put("cashname", cash_name);
		insertMap.put("type", type);
		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> comList = new HashMap<String, Object>();
		List<HashMap<String, Object>> pList = new ArrayList<HashMap<String, Object>>();
		Integer cash = 0;
		comList = bDao.getcompanyList(session.getAttribute("c_code").toString());
		pList = bDao.getproductList(session.getAttribute("c_code").toString(), bd_date, oac_num);
		cash = bDao.getCashList(session.getAttribute("c_code").toString(),bd_date,oac_num);
		String companyList = makehtmlcList(comList);
		String productList = makehtmlproductList(pList, oac_status);
		String payList = makehtmlpayList(cash);
		mav.addObject("cList",companyList);
		mav.addObject("proList",productList);
		mav.addObject("payList",payList);
		mav.addObject("cashBills", makeHtmlBillsForCash(insertMap));
		mav.setViewName("money/popupForprint");
		return mav;
	}

	//현금 결제내역 html 만들기
	private String makehtmlpayList(Integer cash) {
		StringBuilder sb = new StringBuilder();
		sb.append("<hr/>");
		sb.append("<table>");
		sb.append("<tr>");
		sb.append("<td>현금결제 금액</td>");
		sb.append("<td>"+cash+"</td>");
		sb.append("</tr>");
		sb.append("</table>");
		return sb.toString();
	}

	private String makeHtmlBillsForCash(HashMap<String, Object> insertMap) {
		StringBuilder sb = new StringBuilder();
		sb.append("<hr/>");
		sb.append("<table>");
		sb.append("<tr>");
		sb.append("<td colspan='2'>현금영수증종류</td>");
		if(Integer.parseInt(insertMap.get("type").toString())==1) {			
			sb.append("<td colspan='2'>개인소득공제용</td>");
		}else if(Integer.parseInt(insertMap.get("type").toString())==2){			
			sb.append("<td colspan='2'>사업자지출증빙용</td>");
		}
		sb.append("</tr>");
		sb.append("<td colspan='2'>결제금액</td>");
		sb.append("<td colspan='2'>"+insertMap.get("cashamount")+"</td>");
		sb.append("</tr>");
		sb.append("<tr>");
		sb.append("<td colspan='2'>현금영수증번호</td>");
		if(Integer.parseInt(insertMap.get("type").toString())==1) {				
			sb.append("<td colspan='2'>"+insertMap.get("cashname").toString().substring(0,3)+"****"+insertMap.get("cashname").toString().substring(7)+"</td>");
		}else {
			sb.append("<td colspan='2'>"+insertMap.get("cashname").toString().substring(0,3)+"*****"+insertMap.get("cashname").toString().substring(8,12)+"</td>");
		}
		sb.append("</tr>");
		sb.append("</table>");
		return sb.toString();
	}	

}
