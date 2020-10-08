package com.team2.simpleOrder.service.kiosk;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.team2.simpleOrder.dao.kiosk.IKioskDao1;
import com.team2.simpleOrder.dto.Review;

@Service
public class KioskMM2 {
	ModelAndView mav;
	@Autowired
	private IKioskDao1 kDao1;

	@Transactional
	public ModelAndView insertReview(ArrayList<MultipartFile> rv_file, Review rv, HttpSession session) {
		try {

			mav = new ModelAndView();
			rv.setC_code(session.getAttribute("c_code").toString())
					.setBd_date(session.getAttribute("bd_date").toString())
					.setOac_num(session.getAttribute("oac_num").toString());
			if (kDao1.insertReview(rv)) { // 등록이 됐다면
				if (rv_file.size() != 0) {
					KioskFileManager kfm = new KioskFileManager();
					kfm.fileUp(rv, rv_file, session);
					for (int i = 0; i < rv_file.size(); i++) {
						rv.setRvImg_sysName(kfm.makeSysName(rv, i, rv_file.get(i).getOriginalFilename()));
						kDao1.insertRvImg(rv);
					}
					session.removeAttribute("bd_date");
					session.removeAttribute("oac_num");
					session.removeAttribute("creditOk");
					mav.addObject("resultMsg", "리뷰등록에 성공하였습니다");
				} else {
					mav.addObject("resultMsg", "리뷰등록에 실패하였습니다");
				}
			}
		} catch (Exception e) {
			System.out.println(e);
			mav.addObject("resultMsg", "리뷰등록은 한개만 가능합니다");
			mav.setViewName("kiosk/kioskReview");
			return mav;
		}
		mav.setViewName("kiosk/kioskReview");
		return mav;
	}

	public ModelAndView msgSave(HttpSession session, String text) {
		mav = new ModelAndView();
		String sc_name = kDao1.getSc_name(session.getAttribute("c_code").toString(),
				session.getAttribute("sc_code").toString());
		mav.addObject("sc_name", sc_name);
		mav.addObject("st_num", session.getAttribute("st_num").toString());
		mav.addObject("text", text);
		mav.setViewName("kiosk/request");

		return mav;
	}
}
