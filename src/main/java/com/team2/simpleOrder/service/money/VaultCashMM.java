package com.team2.simpleOrder.service.money;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.team2.simpleOrder.dao.money.IVaultCashDao;

@Service
public class VaultCashMM {

	@Autowired
	private IVaultCashDao vDao;

	ModelAndView mav;

	@Transactional
	// 영업일 확인
	public String checkBd_date(HttpSession session) throws Exception {
		String c_code = session.getAttribute("c_code").toString();

		try {
			// 마감 여부 확인
			String vc_code = (String) vDao.checkVc_code(c_code);

			if (vc_code == null || vc_code.equals("-1")) { // 마감이 완료되어있을 때
				return new Gson().toJson("startVC");
			} else { // 영업중일때
				String bd_date = vDao.getBd_date(c_code);
				session.setAttribute("bd_date", bd_date);
				System.out.println("찾은영업일 : " + bd_date);
				return new Gson().toJson("havaBd_date");
			}
		} catch (Exception e) {
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			System.err.println(e);
			return new Gson().toJson("posmain");
		}

	}

	// 마감 여부 확인
	public ModelAndView checkEndVC(HttpSession session) {
		String c_code = session.getAttribute("c_code").toString();

		String vc_code = (String) vDao.checkVc_code(c_code);

		if (vc_code == null || vc_code.equals("-1")) { // 마감이 완료된 상태
			mav = new ModelAndView("money/vaultcash", "vc_status", "theEnd");
			return mav;
		} else { // 영업중인 상태
			mav = new ModelAndView("money/vaultcash", "vc_status", "end");
			return mav;
		}

	}

	// 시재 입력
	@Transactional
	public String insertVC(HttpSession session, List<Map<String, String>> jArr) throws Exception {
		try {
			HashMap<String, Object> jMap = new HashMap<String, Object>();
			jMap.put("c_code", session.getAttribute("c_code").toString());

			// 시작 시재
			if (jArr.get(0).get("vc_code").equals("1")) {
				jMap.put("vc_code", jArr.get(0).get("vc_code"));

				// 현재 날짜 가져오기
				Calendar date = Calendar.getInstance();
				// 날짜 형 변환
				SimpleDateFormat moment = new SimpleDateFormat("yyyy-MM-dd HH:mm");
				String bd_date = moment.format(date.getTime());
				jMap.put("bd_date", bd_date);

				// business_day 데이터 입력
				vDao.insertBd_date(jMap);
				session.setAttribute("bd_date", bd_date);
				System.out.println("새로운영업일 : " + bd_date);

				// 마감 시재
			} else if (jArr.get(0).get("vc_code").equals("-1")) {
				jMap.put("bd_date", session.getAttribute("bd_date").toString());
				if(vDao.getCountOac_status(jMap) == 0) {
					System.out.println(vDao.getCountOac_status(jMap));
				jMap.put("vc_code", jArr.get(0).get("vc_code"));
				} else {
					System.out.println(vDao.getCountOac_status(jMap));
					System.out.println("주문중인 테이블이 있음");
					return new Gson().toJson("notYet");
				}
			}

			// 시재 입력
			if (vDao.insertVC(jMap)) {

				for (int i = 1; i < jArr.size(); i++) {
					jMap.put("cu_code", jArr.get(i).get("cu_code"));
					jMap.put("vcd_cnt", jArr.get(i).get("vcd_cnt"));

					// 시재 갯수 입력
					vDao.insertVC_Cnt(jMap);
				}
				return new Gson().toJson("success");

			} else {
				System.out.println("시재 갯수 못넣음");
				return new Gson().toJson("error");
			}
		} catch (Exception e) {
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			System.out.println("시재입력 실패");
			System.out.println(e);
			return new Gson().toJson("error");
		}
	}

	@Transactional
	public String insertChangeVC(HttpSession session, List<Map<String, String>> jArr) {
		try {
			String c_code = session.getAttribute("c_code").toString();
			int vc_code = Integer.parseInt(String.valueOf(vDao.checkVc_code(c_code)));
			if (vc_code != -1) {
				vc_code += 1;
				HashMap<String, Object> jMap = new HashMap<String, Object>();
				jMap.put("c_code", c_code);
				jMap.put("bd_date", session.getAttribute("bd_date").toString());
				jMap.put("vc_code", vc_code);

				if (vDao.insertVC(jMap)) {
					for (int i = 1; i < jArr.size(); i++) {
						jMap.put("cu_code", jArr.get(i).get("cu_code"));
						jMap.put("vcd_cnt", jArr.get(i).get("vcd_cnt"));

						// 시재 갯수 입력
						vDao.insertVC_Cnt(jMap);
					}
					jMap.put("vcc_memo", jArr.get(0).get("vcc_memo"));
					//환전 메모넣기
					vDao.insertVCChangeMemo(jMap);

					return new Gson().toJson("success");

				} else {
					System.out.println("시재 갯수 못넣음");
					return new Gson().toJson("error");
				}
				//vc_code 가 -1일 경우
			} else {
				System.out.println("이미 마감중");
				return new Gson().toJson("end");
			}
		} catch (Exception e) {
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			System.out.println("시재입력 실패");
			System.out.println(e);
			return new Gson().toJson("error");
		}
	}
	
	// 시작시재 불러오기
	public String getStartVC(HttpSession session) {
		
		return vDao.getStartVC(session.getAttribute("c_code").toString());
	}
	
	// 마감시재 불러오기
	public String getEndVC(HttpSession session) {
		
		return vDao.getEndVC(session.getAttribute("c_code").toString());
	}

	public String getMonthVC(HttpSession session, HashMap<String, String> vcm) {
		 vcm.put("c_code", session.getAttribute("c_code").toString());
		 List<HashMap<String, String>> vlist = vDao.getMonthVC(vcm);
		return new Gson().toJson(vlist);
	}

	public String getDayVCLog(HttpSession session, HashMap<String, String> vcm) {
		 vcm.put("c_code", session.getAttribute("c_code").toString());
		 List<HashMap<String, String>> vlist = vDao.getDayVCLog(vcm);
		return new Gson().toJson(vlist);
	}
}
