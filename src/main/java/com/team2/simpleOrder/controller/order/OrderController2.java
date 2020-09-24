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
		log.info(sc_code+st_num+oac_num);
		Order odr = new Order();
		ModelAndView mav = new ModelAndView();
		//String c_code = session.getAttribute("c_code").toString();
		//String bd_date=session.getAttribute("bd_date").toString();
		 odr.setSc_code(sc_code); 
		 System.out.println(st_num);
		 System.out.println(sc_code+"/"+oac_num);
		 odr.setSt_num(Integer.parseInt(st_num));
		 odr.setOac_num(oac_num); 
		 odr.setC_code("123123123123");
		 odr.setBd_date("2020-08-29 14:19:00");
		 mav = om.getsaoList(odr);
		 
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
