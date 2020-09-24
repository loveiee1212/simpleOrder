package com.team2.simpleOrder.service.money;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.ModelAndView;

import com.team2.simpleOrder.dao.money.IVaultCashDao;
import com.team2.simpleOrder.dao.money.ISalesDao;
import com.team2.simpleOrder.dto.Money;

@Service
public class VaultCashMM {

	@Autowired
	private IVaultCashDao vDao;

	ModelAndView mav;

	@Transactional
	public String checkStartVC(HttpSession session) throws Exception {
		String c_code = session.getAttribute("c_code").toString();
		
		try {
			String checkNum = vDao.checkStartVC(c_code);
			System.out.println(checkNum);

			if (checkNum == "-1") {
				//현재 날짜 가져오기
				Calendar date = Calendar.getInstance();
				//날짜 형 변환
				SimpleDateFormat moment = new SimpleDateFormat("YYYY-MM-DD HH:mm");
				String bd_date = moment.format(date.getTime());
				
				//business_day 데이터 입력
				vDao.insertBd_date(c_code,bd_date);
				session.setAttribute("bd_date", bd_date);
				
				return "redirect:startVC";
				
			} else {
				String bd_date = vDao.getBd_date(c_code);
				session.setAttribute("bd_date", bd_date);
			return "redirect:sellpage";
			}
		} catch (Exception e) {
			
			return "redirect:posmain";
		}

	}
	
	public ModelAndView checkEndVC(HttpSession session) {
		String c_code = session.getAttribute("c_code").toString();
		String checkNum = vDao.checkStartVC(c_code);
		
		if(checkNum == "-1") {
			mav = new ModelAndView("redirect:money/vaultcash","vc_status","theEnd");
			return mav;
		}else {
			mav = new ModelAndView("redirect:money/vaultcash","vc_status","end");
			return mav;
		}
	}

	public String getStartVC(HttpSession session) {
		
		return vDao.getStartVC(session.getAttribute("c_code").toString());
	}

	@Transactional
	public String insertStartVC(HttpSession session, List<Map<String, String>> jArr) throws Exception {
		try {
			HashMap<String, String> jMap = new HashMap<String, String>();
			jMap.put("c_code", session.getAttribute("c_code").toString());
			jMap.put("bd_date", session.getAttribute("bd_date").toString());
			
			if(vDao.insertStartVC(jMap)==true){

				for (int i=0; i<jArr.size(); i++) {
					jMap.put("cu_code", jArr.get(i).get("cu_code"));
					jMap.put("vcd_cnt", jArr.get(i).get("vcd_cnt"));

					vDao.insertStartVC_Cnt(jMap);
				}
				return "success";
			}else {
				return "error";
			}
		} catch (Exception e) {
			return "error";
		}
	}

}
