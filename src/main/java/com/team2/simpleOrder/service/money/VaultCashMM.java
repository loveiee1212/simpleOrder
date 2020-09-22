package com.team2.simpleOrder.service.money;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

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
		SimpleDateFormat moment = new SimpleDateFormat("YYYY-MM-DD HH:mm");
		try {
			String checkNum = vDao.checkStartVC(c_code);
			System.out.println(checkNum);

			if (checkNum == "-1") {
				//현재 날짜 가져오기
				Calendar date = Calendar.getInstance();
				//날짜 형 변환
				String bd_date = moment.format(date.getTime());
				
				//business_day 데이터 입력
				vDao.insertBd_date(c_code,bd_date);
				session.setAttribute("bd_date", bd_date);
				
				return "redirect:startVC";
				
			} else {
				String bd_date = vDao.getBd_date(c_code);
			return "redirect:sellpage";
			}
		} catch (Exception e) {
			
			return "redirect:posmain";
		}

	}

}
