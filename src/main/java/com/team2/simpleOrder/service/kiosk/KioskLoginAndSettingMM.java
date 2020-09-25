package com.team2.simpleOrder.service.kiosk;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.team2.simpleOrder.dao.kiosk.KioskLoginAndSettingDao;
import com.team2.simpleOrder.dao.money.IVaultCashDao;
import com.team2.simpleOrder.dao.order.IOrderDao1;

@Service
public class KioskLoginAndSettingMM {

	@Autowired
	private KioskLoginAndSettingDao kDao;
	@Autowired
	private IVaultCashDao vDao;
	@Autowired
	private IOrderDao1 oDao;

	public String kioskLogin(String c_code, String sc_code, String st_num, HttpSession session, RedirectAttributes reat) {
		session.setAttribute("c_code", c_code);
		session.setAttribute("sc_code", sc_code);
		session.setAttribute("st_num", st_num);
		if (Integer.parseInt(vDao.checkStartVC(c_code)) != -1) {
			session.setAttribute("bd_date", vDao.getBd_date(c_code));
		}else {
			reat.addFlashAttribute("msg","영업 시작 전입니다.");
		}

		return "redirect:/kioskLogin";
	}

	public HashMap<String, String> getQrCodeList(String c_code) {
		KioskLoginHtmlMaker klhm = new KioskLoginHtmlMaker();
		HashMap<String, String> hm = new HashMap<String, String>();
		hm.put("tableQrcodeList", klhm.getQrCodeListhtml(c_code, oDao.getTList(c_code)));
		System.out.println(hm);
		return hm;
	}

	public String accessSecurityCode(HashMap<String, String> securityCode, HttpSession session, RedirectAttributes reat) {
		securityCode.put("c_code", session.getAttribute("c_code").toString());
		if(securityCode.get("securityCode").equals(kDao.getSecurityCode(securityCode))) {
			return "redirect:/kioskmenu";
		};
		reat.addFlashAttribute("error","인증번호를 다시 확인해주세요!");
		return "redirect:/kioskLogin";
	}

	public HashMap<String, String> getRequsetList(String c_code) {
		KioskLoginHtmlMaker klhm = new KioskLoginHtmlMaker();
		return klhm.requestList(kDao.getRequsetList(c_code));
	}

	public String updateRequestList(HashMap<String, String> reqList, HttpSession session, RedirectAttributes reat) {
			System.out.println(reqList.keySet());
		return null;
	}

}
