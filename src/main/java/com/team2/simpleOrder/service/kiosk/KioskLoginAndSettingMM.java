package com.team2.simpleOrder.service.kiosk;

import java.util.HashMap;
import java.util.Iterator;
import java.util.Set;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
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

	@Transactional
	public String updateRequestList(HashMap<String, String> reqList, HttpSession session, RedirectAttributes reat) {
		try{
			HashMap<String, String>	hm = new HashMap<String, String>();
			Set<String> rq_numset = reqList.keySet();
			Iterator<String> rq_numlist = rq_numset.iterator();
			kDao.deleteAllRequsetList(session.getAttribute("c_code").toString());
			while(rq_numlist.hasNext()) {
				String rq_num= rq_numlist.next();
				hm.put("c_code", session.getAttribute("c_code").toString());
				hm.put("rq_num", rq_num);
				hm.put("rq_kind", reqList.get(rq_num));
				kDao.insertRequset(hm);
			}
			reat.addFlashAttribute("basicPath","includeAjax('requestListSettingFrm')");
			return "redirect:/kioskSettingFrm";
		}catch (Exception e) {
			System.err.println(e);
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
			return "redirect:/kioskSettingFrm";
		}
	}

	public boolean getreveiwUsagestatus(String c_code) {
		if(kDao.getreveiwUsagestatus(c_code)==1) {
			return true;
		}else{
			return false;
		}
	}

	public String updatereveiwUsagestatus(String c_code, String c_reviewuse, RedirectAttributes reat) {
		HashMap<String , String> hm = new HashMap<String, String>();
		hm.put("c_code", c_code);
		hm.put("c_reviewuse", c_reviewuse);
		reat.addFlashAttribute("basicPath", "includeAjax('reveiwUsagestatusFrm')");
		kDao.updatereveiwUsagestatus(hm);
		return "redirect:/kioskSettingFrm";
	}

}
