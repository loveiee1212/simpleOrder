package com.team2.simpleOrder.controller.storeManagement;


import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;



@Controller
public class PosController1 {
	
	@PostMapping("rest/temaChange")
	@ResponseBody
	public void temaChange(boolean temaBlack,HttpSession session){
		session.setAttribute("temaBlack",temaBlack);
	}
}
