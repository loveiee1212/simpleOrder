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

import com.mysql.cj.jdbc.interceptors.ConnectionLifecycleInterceptor;
import com.team2.simpleOrder.dao.kiosk.KioskLoginAndSettingDao;
import com.team2.simpleOrder.dao.money.IVaultCashDao;
import com.team2.simpleOrder.dao.order.IOrderDao;

@Service
public class KioskLoginAndSettingMM {

	@Autowired
	private KioskLoginAndSettingDao kDao;
	@Autowired
	private IVaultCashDao vDao;
	@Autowired
	private IOrderDao oDao;

	public String kioskLogin(String c_code, String sc_code, String st_num, HttpSession session, RedirectAttributes reat) {
		session.setAttribute("c_code", c_code);
		session.setAttribute("sc_code", sc_code);
		session.setAttribute("st_num", st_num);
		if (Integer.parseInt((String.valueOf(vDao.checkVc_code(c_code)))) != -1) {
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
		return hm;
	}

	public String accessSecurityCode(HashMap<String, String> securityCode, HttpSession session, RedirectAttributes reat) {
		String c_code = session.getAttribute("c_code").toString();
		String bd_date = session.getAttribute("bd_date").toString();
		String sc_code = session.getAttribute("sc_code").toString();
		String st_num = session.getAttribute("st_num").toString();
		securityCode.put("c_code", session.getAttribute("c_code").toString());
		if(securityCode.get("securityCode").equals(kDao.getSecurityCode(securityCode))) {
			//주문번호가 있는지 확인
			String oac_num=kDao.checkOac_num(c_code,bd_date,sc_code,st_num);
			//
			if(oac_num!=null) {
				session.setAttribute("oac_num", oac_num);
			}
			return "redirect:/kioskmenu";
		};
		reat.addFlashAttribute("error","인증번호를 다시 확인해주세요!");
		return "redirect:/kioskLogin";
	}

	public HashMap<String, String> getRequsetList(String c_code) {
		KioskLoginHtmlMaker klhm = new KioskLoginHtmlMaker();
		return klhm.requestList(kDao.getRequsetList(c_code));
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
	
	@Transactional
	public String updateRequestList(HashMap<String, String> reqList, HttpSession session, RedirectAttributes reat) {
//		try{
			System.out.println(reqList);
			HashMap<String, String>	hm = new HashMap<String, String>();
			Set<String> rq_numset = reqList.keySet();
			Iterator<String> rq_numlist = rq_numset.iterator();
			kDao.deleteAllRequsetList(session.getAttribute("c_code").toString());
			while(rq_numlist.hasNext()) {
				String rq_num= rq_numlist.next();
				hm.put("c_code", session.getAttribute("c_code").toString());
				hm.put("rq_num", rq_num);
				hm.put("rq_kind", reqList.get(rq_num));
				System.out.println(hm);
				kDao.insertRequset(hm);
			}
			reat.addFlashAttribute("basicPath","includeAjax('requestListSettingFrm')");
			return "redirect:/kioskSettingFrm";
//		}catch (Exception e) {
//			System.err.println(e);
//			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
//			return "redirect:/kioskSettingFrm";
//		}
	}

	public String addRequest(HashMap<String, String> requestInfo, HttpSession session, RedirectAttributes reat) {
		requestInfo.put("c_code", session.getAttribute("c_code").toString());
		kDao.insertRequset(requestInfo);
		reat.addFlashAttribute("basicPath","includeAjax('requestListSettingFrm')");
		return "redirect:/kioskSettingFrm";
	}

	public String removeRequest(HashMap<String, String> requestInfo, HttpSession session, RedirectAttributes reat) {
		requestInfo.put("c_code", session.getAttribute("c_code").toString());
		requestInfo.put("rq_num", (Integer.parseInt(requestInfo.get("rq_num"))-1)+"");
		System.out.println(requestInfo);
		kDao.removeRequest(requestInfo);
		reat.addFlashAttribute("basicPath","includeAjax('requestListSettingFrm')");
		return "redirect:/kioskSettingFrm";
	}

	public HashMap<String, Object> getRequest(HttpSession session) {
		String c_code = session.getAttribute("c_code").toString();
		HashMap<String , Object> clientRequset = kDao.getClientRequset(c_code);
		
		if(clientRequset==null) {
			clientRequset = new HashMap<String, Object>();
			clientRequset.put("newrequest", "false");
		}else {
			clientRequset.put("REQUEST_TIME", clientRequset.get("REQUEST_TIME").toString());
			clientRequset.put("newrequest", "true");
		}
		return clientRequset;
	}

	public void updateClientRequest(HttpSession session, HashMap<String, String> requestInfo) {
		requestInfo.put("c_code", session.getAttribute("c_code").toString());
		requestInfo.put("emp_code", session.getAttribute("emp_code").toString());
		kDao.updateClientRequest(requestInfo);
	}

}
