package com.team2.simpleOrder.service.money;

import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.log;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.team2.simpleOrder.dao.money.IBillDao;

@Service
public class BillMM {
	@Autowired
	IBillDao bDao;

	public ModelAndView getBillList(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		String c_code = session.getAttribute("c_code").toString();
		List<HashMap<String, Object>> bList = bDao.getBillList(c_code);
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
	public HashMap<String, String> cancelPay(HttpSession session, String bd_date, String oac_num, int oac_status) {
		String c_code = session.getAttribute("c_code").toString();
		HashMap<String, String> hMap = new HashMap<String, String>();
		if(bDao.cancelPay(c_code, bd_date, oac_num)) {
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
				sb.append("<td>" + bList.get(i).get("TOTALCASH") + "</td>");
				sb.append("<td id='getCashvalue'>" + bList.get(i).get("TOTALCARD") + "</td>");
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
					System.out.println("현금결제:"+Integer.parseInt(payList.get(i).get("PMT_CASH").toString()));
					System.out.println("카드결제:"+Integer.parseInt(payList.get(i).get("PMT_CARD").toString()));
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
		sb.append(comList.get("C_ADDRESS") + "<br/>");
		sb.append("사업자번호 | " + comList.get("C_CODE") + "<br/>");
		sb.append("tel." + comList.get("C_PHONE") + "<br/>");
		return sb.toString();
	}

	

}
