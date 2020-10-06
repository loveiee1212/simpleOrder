package com.team2.simpleOrder.controller;




import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


@Controller
public class PageController1 {

	@RequestMapping(value = "/main", method = RequestMethod.GET)
	public String home() {
		return "main";
	}
	@RequestMapping("/joinEmailFrm")
	public String joinEmailFrm() {
		return "member/joinEmailFrm";
	}
	@RequestMapping("/cList")
	public String cList(){
		return "member/cList";
	}
	@RequestMapping("/mainskill")
	public String mainskill(){
		return "mainskill";
	}
	@RequestMapping("/productinfo")
	public String productinfo() {
		return "productinfo";
	}
	@RequestMapping("/poslogin")
	public String poslogin() {
		return "poslogin";
	}
	@RequestMapping("/createccodefrm")
	public String createCcodeFrm() {
		return "member/createCcodeFrm";
	}
	@RequestMapping("/posmain")
	public String posmain() {
		return "posmain";
	}
	@RequestMapping("/posSetting")
	public String posSetting(HttpServletRequest request,RedirectAttributes reat) {
		return "posSetting/posSetting";
	}
	@RequestMapping("/empSettingFrm")
	public String empSettingFrm() {
		return "posSetting/empSettingFrm";
	}
	@RequestMapping("/postionGrantSettingFrmOn")
	public String postionGrantSettingFrmon() {
		return "posSetting/postionGrantSettingFrmon";
	}
	@RequestMapping("/postisionSettingFrmOn")
	public String postisionSettingFrmon() {
		return "posSetting/postisionSettingFrmon";
	}
	@RequestMapping("/cSecurityCodeSettingFrmOn")
	public String cSecurityCodeSettingFrmOn() {
		return "posSetting/cSecurityCodeSettingFrm";
	}
	@RequestMapping("/kioskLogin")
	public String kioskLogin() {
		return "kiosk/kioskLogin";
	}
	@RequestMapping("/kioskSettingFrm")
	public String kioskSettingFrm() {
		return "kioskSetting/kioskSettingFrm";
	}
	@RequestMapping("/kioskQrCodeListFrm")
	public String kioskQrCodeListFrm() {
		return "kioskSetting/kioskQrCodeListFrm";
	}
	@RequestMapping("/requestListSettingFrm")
	public String requsetListSettingFrm() {
		return "kioskSetting/requestListSettingFrm";
	}
	@RequestMapping("/seatSettinFrm")
	public String seatSettinFrm() {
		return "posSetting/seatSettinFrm";
	}
	@RequestMapping("/reveiwUsagestatusFrm")
	public String reveiwUsagestatusFrm() {
		return "kioskSetting/reveiwUsagestatusFrm";
	}
	
	@RequestMapping(value = "/productcontrol")
	public String productcontrol() {
		return "/storeManagement/productcontrol";
	}
	
	@RequestMapping("/producreagistraition")
	public String producreagistraition() {
		return "storeManagement/producreagistraition";
	}
	@RequestMapping("/stockController")
	public String stockController() {
		return "storeManagement/stockController";
	}
	
	@RequestMapping("/test")
	public String test() {
		return "test";
	}
	@PostMapping("/test2")
	public String test(MultipartFile file, HttpSession session) throws IllegalStateException, IOException {
		System.out.println(session.getServletContext().getRealPath("/resources/productImg/"+session.getAttribute("c_code")+"/"));
		File dir = new File(session.getServletContext().getRealPath("/resources/productImg/"+session.getAttribute("c_code")+"/"));
		if(!dir.isDirectory()) {
			System.out.println("존재안함");
			dir.mkdir();
		}
		file.transferTo(new File(session.getServletContext().getRealPath("/resources/productImg/"+session.getAttribute("c_code")+"/"+file.getOriginalFilename())));
		return "redirect:test";
	}

}
