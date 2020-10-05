package com.team2.simpleOrder.controller.storeManagement;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.team2.simpleOrder.service.storeManagement.ProductMM;

@Controller
public class ProductController {

	@Autowired
	ProductMM pm;
	@PostMapping("/deleteProduct")
	public String deleteProduct(@RequestParam HashMap<String, String> proInfo , HttpSession session, RedirectAttributes reat) {
		return pm.deleteProduct(proInfo,session,reat);
	}
	@PostMapping("/createProCategori")
	public String createProCategori(@RequestParam HashMap<String, String> categoriInfo, HttpSession session, RedirectAttributes reat) {
		return pm.createProCategori(categoriInfo, session,reat);
	}
	@PostMapping("/proCategoriDelete")
	public String proCategoriDelete(@RequestParam HashMap<String, String> categoriInfo, HttpSession session, RedirectAttributes reat) {
		return pm.proCategoriDelete(categoriInfo,session,reat);
	}
	@PostMapping("/proCategoriUpdate")
	public String proCategoriUpdate(@RequestParam HashMap<String, String> categoriInfo, HttpSession session, RedirectAttributes reat) {
		return pm.proCategoriUpdate(categoriInfo,session,reat);
	}
	@PostMapping("/createProduct")
	public String createProduct(@RequestParam HashMap<String, String> proInfo, HttpSession session, MultipartFile pdfile, RedirectAttributes reat) {
		return pm.createProduct(proInfo, session,pdfile, reat);
	}
	@PostMapping("/updateProduct")
	public String updateProduct(@RequestParam HashMap<String, String> proInfo, HttpSession session, MultipartFile pdfile, RedirectAttributes reat) {
		return pm.updateProduct(proInfo,session,pdfile,reat);
	}
	@PostMapping("/updatesellkey")
	public String updatesellkey(String[] pdc_code, String[] pd_code, String[] pd_date, String[] skc_code, String[] sk_num,HttpSession session , RedirectAttributes reat) {
		return pm.updatesellkey(pdc_code,pd_code,pd_date,skc_code,sk_num,session,reat);
	}
	@PostMapping("/updateSellKeySize")
	public String updateSellKeySize(@RequestParam HashMap<String, String> sellKeySize, HttpSession session, RedirectAttributes reat) {
		return pm.updateSellKeySize(sellKeySize,session,reat);
	}
	@PostMapping("/createSkcCategori")
	public String createSkcCategori(@RequestParam HashMap<String, String> skcInfo, HttpSession session, RedirectAttributes reat) {
		return pm.createSkcCategori(skcInfo,session,reat);
	}
	@PostMapping("/deleteSkcCategori")
	public String deleteSkcCategori(@RequestParam HashMap<String, String> skcInfo, HttpSession session, RedirectAttributes reat) {
		return pm.deleteSkcCategori(skcInfo,session,reat);
	}

}
