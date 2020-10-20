package com.team2.simpleOrder.controller;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class ErrorController {

	@RequestMapping("/error")
	public String handleError(HttpServletRequest req, RedirectAttributes redirect) {
		Object status = req.getAttribute(RequestDispatcher.ERROR_STATUS_CODE);
		if (status != null) {
			Integer statusCode = Integer.valueOf(status.toString());
			redirect.addAttribute("errorCode", statusCode);
		}
		return "redirect:/errorpage";
	}

	@RequestMapping(value = "/errorpage")
	public String errorPage(@RequestParam("errorCode") String errorCode, Model model) {
		model.addAttribute("errorCode", errorCode);
		return "error/error";
	}

}
