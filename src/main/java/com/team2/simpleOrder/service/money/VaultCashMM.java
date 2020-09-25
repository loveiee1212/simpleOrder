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

	//영업일 확인
	public String checkBd_date(HttpSession session) throws Exception {
		String c_code = session.getAttribute("c_code").toString();
		
		try {
			//마감 여부 확인
			String checkNum = vDao.checkStartVC(c_code);
			System.out.println(checkNum);

			if (checkNum.equals("-1")) { 				//마감이 완료되어있을 때
				return new Gson().toJson("startVC");
			} else { 									// 영업중일때
				String bd_date = vDao.getBd_date(c_code);
				session.setAttribute("bd_date", bd_date);
				System.out.println("찾은영업일 : "+bd_date);
			return new Gson().toJson("havaBd_date");
			}
		} catch (Exception e) {
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			System.err.println(e);
			return new Gson().toJson("posmain");
		}

	}
	
	//마감 여부 확인
	public ModelAndView checkEndVC(HttpSession session) {
		String c_code = session.getAttribute("c_code").toString();
		
		String checkNum = vDao.checkStartVC(c_code);
		if (checkNum.equals("-1")) {										//마감이 완료된 상태
			mav = new ModelAndView("money/vaultcash","vc_status","theEnd");
			return mav;
		} else {															//영업중인 상태
		mav = new ModelAndView("money/vaultcash","vc_status","end");
			return mav;
		}
	
	}
	
	// 시작시재 불러오기
	public String getStartVC(HttpSession session) {
		
		return vDao.getStartVC(session.getAttribute("c_code").toString());
	}
	
	//마감시재 불러오기
	public String getEndVC(HttpSession session) {
		
		return vDao.getEndVC(session.getAttribute("c_code").toString());
	}

	//시작시재 입력
	@Transactional
	public String insertStartVC(HttpSession session, List<Map<String, String>> jArr) throws Exception {
		try {
			//현재 날짜 가져오기
			Calendar date = Calendar.getInstance();
			//날짜 형 변환
			SimpleDateFormat moment = new SimpleDateFormat("yyyy-MM-dd HH:mm");
			String bd_date = moment.format(date.getTime());
			
			HashMap<String, String> jMap = new HashMap<String, String>();
			jMap.put("c_code", session.getAttribute("c_code").toString());
			jMap.put("bd_date", bd_date);
			
			//business_day 데이터 입력
			vDao.insertBd_date(jMap);
			session.setAttribute("bd_date", bd_date);
			System.out.println("새로운영업일 : "+bd_date);
			
			//시작시재 입력
			if(vDao.insertStartVC(jMap)){

				for (int i=0; i<jArr.size(); i++) {
					jMap.put("cu_code", jArr.get(i).get("cu_code"));
					jMap.put("vcd_cnt", jArr.get(i).get("vcd_cnt"));
					
					//시작시재 갯수 입력
					vDao.insertStartVC_Cnt(jMap);
				}
				return new Gson().toJson("success");
				
			}else {
				System.out.println("시작 시재 갯수 못넣음");
				return new Gson().toJson("error");
			}
		} catch (Exception e) {
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			System.out.println("시재입력 실패");
			return new Gson().toJson("error");
		}
	}

	//마감시재 입력
	@Transactional
	public String insertEndVC(HttpSession session, List<Map<String, String>> jArr) {
		try {
			HashMap<String, String> jMap = new HashMap<String, String>();
			jMap.put("c_code", session.getAttribute("c_code").toString());
			jMap.put("bd_date", session.getAttribute("bd_date").toString());
			
			//마감시재 입력
			if(vDao.insertEndVC(jMap)) {
				
				for(int i=0; i<jArr.size(); i++) {
					jMap.put("cu_code", jArr.get(i).get("cu_code"));
					jMap.put("vcd_cnt", jArr.get(i).get("vcd_cnt"));
					
					//마감시재 갯수 입력
					vDao.insertEndVC_Cnt(jMap);
				}
				return new Gson().toJson("success");
				
			} else {
				System.out.println("마감 시재 갯수 못넣음");
				return new Gson().toJson("error");
			}
		} catch (Exception e) {
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			System.out.println("마감 실패");
			return new Gson().toJson("error");
		}
	}
}
