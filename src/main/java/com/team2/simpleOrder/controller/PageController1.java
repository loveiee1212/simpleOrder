package com.team2.simpleOrder.controller;




import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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
	@RequestMapping("/requsetListSettingFrm")
	public String requsetListSettingFrm() {
		return "kioskSetting/requsetListSettingFrm";
	}
	
	@RequestMapping("/test")
	public String test(RedirectAttributes reat) {
		reat.addFlashAttribute("basicPath", "postisionSettingFrmon()");
		return "posSetting/posSetting";
	}

}
