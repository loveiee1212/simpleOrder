package com.team2.simpleOrder.service.storeManagement;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.team2.simpleOrder.dao.storeManagement.ITableDao2;

@Service
public class TableMM {

	@Autowired
	private ITableDao2 tDao;

	public HashMap<String, String> getSeatList(HttpSession session) {
		TableHtmlMaker thm = new TableHtmlMaker();
		ArrayList<HashMap<String, Object>> seatCategoriList = tDao
				.getSeatCategoriList(session.getAttribute("c_code").toString());
		for (HashMap<String, Object> seatCategori : seatCategoriList) {
			seatCategori.put("sc_codeInfo", tDao.getSeatInfoList(seatCategori));
		}

		return thm.getSeatList(seatCategoriList);
	}

	public String updateSeatXYInfo(HashMap<String, String> xyInfo, HttpSession session, RedirectAttributes reat) {
		xyInfo.put("c_code", session.getAttribute("c_code").toString());
		if (tDao.updateSeatXYInfo(xyInfo)) {
			reat.addFlashAttribute("basicPath", "includeAjax('seatSettinFrm')");
		} else {
			reat.addFlashAttribute("msg", "변경에 실패하였습니다.");
		}
		return "redirect:/posSetting";
	}

	@Transactional
	public String updateSeatList(HashMap<String, String> seatlist, HttpSession session, RedirectAttributes reat) {
		tDao.deleteSeatList(session.getAttribute("c_code").toString()); // 모든 테이블 데이터를 삭제
			Iterator<String> seatListInfo = seatlist.keySet().iterator();
			HashMap<String, String> hm = new HashMap<String, String>();
			while (seatListInfo.hasNext()) {
				String[] seatarr = seatListInfo.next().split("#");
				hm.put("c_code", session.getAttribute("c_code").toString());
				hm.put("sc_code", seatarr[0]);
				hm.put("st_num", seatarr[1]);
				if(!tDao.insertSeatList(hm)){
					//TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
				};
		}
			reat.addFlashAttribute("basicPath","includeAjax('seatSettinFrm')");
			return "redirect:/posSetting";
	}

	public String deleteSeatCT(HashMap<String, String> seatCTInfo, HttpSession session, RedirectAttributes reat) {
		seatCTInfo.put("c_code", session.getAttribute("c_code").toString());
		tDao.deleteSeatCT(seatCTInfo);
		reat.addFlashAttribute("basicPath","includeAjax('seatSettinFrm')");
		return "redirect:/posSetting";
	}

	public String updateSeatCT(HashMap<String, String> seatCTInfo, HttpSession session, RedirectAttributes reat) {
		seatCTInfo.put("c_code", session.getAttribute("c_code").toString());
		tDao.updateSeatCT(seatCTInfo);
		reat.addFlashAttribute("basicPath","includeAjax('seatSettinFrm')");
		return "redirect:/posSetting";
	}

	public String createSeatCT(HashMap<String, String> seatCTInfo, HttpSession session, RedirectAttributes reat) {
		String sc_code;
		seatCTInfo.put("c_code", session.getAttribute("c_code").toString());
		int num = tDao.getNewSc_code(seatCTInfo);
		if(num < 10) {
			sc_code = "0"+num;
		}else {
			sc_code = num+"";
		}
		seatCTInfo.put("sc_code", sc_code);
		System.out.println(seatCTInfo);
		tDao.createSeatCT(seatCTInfo);
		reat.addFlashAttribute("basicPath","includeAjax('seatSettinFrm')");
		return "redirect:/posSetting";
	}

}
