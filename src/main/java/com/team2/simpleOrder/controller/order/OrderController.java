package com.team2.simpleOrder.controller.order;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.team2.simpleOrder.dto.Order;
import com.team2.simpleOrder.service.order.OrderMM;
import com.team2.simpleOrder.service.order.DetailOrderMM;
import com.team2.simpleOrder.service.order.OrderMM3;

import lombok.extern.log4j.Log4j;

@Log4j
@Controller
public class OrderController {
	//Only Order Controller Number2
	
	@Autowired
	DetailOrderMM om;
	
	@RequestMapping(value = "/sellandorder")
	public ModelAndView sellAndorder(HttpSession session,String sc_code ,String st_num,String oac_num) {
		ModelAndView mav = new ModelAndView();
		 mav = om.getsaoList(session,sc_code,st_num,oac_num);
		return mav;
	}
	
	@RequestMapping(value = "/resell")
	public ModelAndView reSell(HttpSession session,String bd_date,String oac_num,int oac_status) {
		ModelAndView mav = new ModelAndView();
		System.out.println(oac_num);
		mav = om.reSell(session,bd_date,oac_num,oac_status);
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
