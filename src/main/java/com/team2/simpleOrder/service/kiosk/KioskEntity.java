package com.team2.simpleOrder.service.kiosk;

import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.interceptor.TransactionAspectSupport;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.team2.simpleOrder.dao.kiosk.IKioskDao1;
import com.team2.simpleOrder.dto.Review;
import com.team2.simpleOrder.dto.ReviewImg;

public class KioskEntity {
	@Autowired
	private IKioskDao1 kDao1;

	// order_and_credit HashMap
	public HashMap<String, String> getOac(String c_code, String bd_date, String oac_num, String sc_code,
			String st_num) {
		HashMap<String, String> oac = new HashMap<String, String>();
		oac.put("c_code", c_code);
		oac.put("bd_date", bd_date);
		oac.put("oac_num", oac_num);
		oac.put("sc_code", sc_code);
		oac.put("st_num", st_num);
		return oac;
	}

	// order_history HashMap
	public List<HashMap<String, String>> getOhList(String c_code, String bd_date, String oac_num,
			List<Map<String, String>> bArr) {
		List<HashMap<String, String>> orderList = new ArrayList<HashMap<String, String>>();
		for (int i = 0; i < bArr.size(); i++) {
			HashMap<String, String> orderInfo = new HashMap<>();
			System.out.println(bArr.get(i).get("pdc_code"));
			System.out.println(bArr.get(i).get("pdc_date"));
			System.out.println(bArr.get(i).get("pd_code"));
			System.out.println(bArr.get(i).get("pd_date"));
			System.out.println(bArr.get(i).get("oh_cnt"));
			orderInfo.put("c_code", c_code);
			orderInfo.put("bd_date", bd_date);
			orderInfo.put("oac_num", oac_num);
			orderInfo.put("pdc_code", bArr.get(i).get("pdc_code"));
			orderInfo.put("pdc_date", bArr.get(i).get("pdc_date"));
			orderInfo.put("pd_code", bArr.get(i).get("pd_code"));
			orderInfo.put("pd_date", bArr.get(i).get("pd_date"));
			orderInfo.put("oh_cnt", bArr.get(i).get("oh_cnt"));
			orderList.add(orderInfo);
		}
		return orderList;
	}

	public void fileUp(Review rv, ArrayList<MultipartFile> rv_file, HttpSession session) {
		try {
			String root = session.getServletContext().getRealPath("/");
			String path = "resources/reviewImg/";
			for(int i = 0; i < rv_file.size(); i++) {
				String fileName = makeSysName(rv,i,rv_file.get(i).getOriginalFilename());
				rv_file.get(i).transferTo(new File(root + path + fileName));
			}
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}

	}

	public String makeSysName(Review rv, int i, String fileName) {
		String fileExtender = "."+ fileName.substring(fileName.lastIndexOf(".") + 1);
		String result = rv.getBd_date().replaceAll("-", "");
		result = result.substring(2, 8);
		result = result + rv.getOac_num() + "IMG" + (i+1) ;
		return result+fileExtender;
	}
}
