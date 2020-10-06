package com.team2.simpleOrder.service.storeManagement;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.web.multipart.MultipartFile;

public class FileUpAndDelete {

	public HashMap<String, String> uploadFileImg(MultipartFile pdfile, HashMap<String, String> proInfo, HttpSession session) throws IllegalStateException, IOException {
		String oriFilename = pdfile.getOriginalFilename();
		String extName = oriFilename.substring(oriFilename.lastIndexOf("."), oriFilename.length());
		proInfo.put("pd_imgname", proInfo.get("pdc_code") + proInfo.get("pd_code") + extName);
		File dir = new File(session.getServletContext().getRealPath("/resources/productImg/"));
		if(!dir.isDirectory()) {
			dir.mkdir();
		}
		pdfile.transferTo(new File(session.getServletContext().getRealPath("/resources/productImg/")+proInfo.get("pd_imgname")));
		return proInfo;
	}


}
