package com.team2.simpleOrder.controller.order;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.team2.simpleOrder.dto.Order;
import com.team2.simpleOrder.service.order.OrderMM1;
import com.team2.simpleOrder.service.order.OrderMM2;
import com.team2.simpleOrder.service.order.OrderMM3;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class OrderController2 {
	//Only Order Controller Number2
	
	@Autowired
	OrderMM2 om;
	
	@RequestMapping(value = "/sellandorder")
	public ModelAndView sellAndorder(HttpSession session,String sc_code ,String st_num,String oac_num) {
		ModelAndView mav = new ModelAndView();
		 mav = om.getsaoList(session,sc_code,st_num,oac_num);
		return mav;
	}
	
	@RequestMapping(value = "/sellpage",method = RequestMethod.GET)
	public String sellpage() {
		return "./seat/sellpage";
	}
	@RequestMapping(value = "/errorSellpage",method = RequestMethod.GET)
	public String errorSellpage(RedirectAttributes reat) {
		reat.addFlashAttribute("error","error");
		return "redirect:/sellpage";
	}
	
	
	
	
	@Autowired
	OrderMM3 om3;
	
	ModelAndView mav;

}
