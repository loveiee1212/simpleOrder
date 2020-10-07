package com.team2.simpleOrder.service.kiosk;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.transaction.interceptor.TransactionAspectSupport;
import org.springframework.web.multipart.MultipartFile;

import com.team2.simpleOrder.dto.Review;

public class KioskFileManager {
	public void fileUp(Review rv, ArrayList<MultipartFile> rv_file, HttpSession session) {
		try {
			String root = session.getServletContext().getRealPath("/resources/reviewImg/"+session.getAttribute("c_code").toString()+"/");
			System.out.println(root);
			File dir = new File(root);
			if(!dir.isDirectory()) {
				dir.mkdir();
			}
			for (int i = 0; i < rv_file.size(); i++) {
				String fileName = makeSysName(rv, i, rv_file.get(i).getOriginalFilename());
				rv_file.get(i).transferTo(new File(root + fileName));
			}
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
			TransactionAspectSupport.currentTransactionStatus().setRollbackOnly();
		}

	}

	public String makeSysName(Review rv, int i, String fileName) {
		String fileExtender = "." + fileName.substring(fileName.lastIndexOf(".") + 1);
		String result = rv.getBd_date().replaceAll("-", "");
		result = result.substring(2, 8);
		result = result + rv.getOac_num() + "IMG" + (i + 1);
		return result + fileExtender;
	}
}
