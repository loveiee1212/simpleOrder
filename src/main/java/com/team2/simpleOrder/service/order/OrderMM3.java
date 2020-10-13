package com.team2.simpleOrder.service.order;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.team2.simpleOrder.dao.order.IOrderDao3;

@Service
public class OrderMM3 {
	
	@Autowired
	private IOrderDao3 oDao;
	
	ModelAndView mav;

	public String gropPayMent(HashMap<String, String> oac_num, HttpSession session, RedirectAttributes reat) {
		Iterator<String> it = oac_num.keySet().iterator();
		HashMap<String, Object> hm = new HashMap<>();
		hm.put("c_code", session.getAttribute("c_code").toString());
		List<String> oac_list = new ArrayList<>();
		while(it.hasNext()) {
			oac_list.add(it.next());
		}
		hm.put("oac_list", oac_list);
		reat.addFlashAttribute("gropPayMent", gropPayMentHtmlMaker(oDao.gropPayMent(hm)));
		return "redirect:sellandorder?sc_code=00&st_num=0&oac_num=undefined";
	}

	private String gropPayMentHtmlMaker(ArrayList<HashMap<String, String>> gropPayMent) {
		StringBuilder sb = new StringBuilder();
		int cnt = 0 ;
		sb.append("<table>");
		for (HashMap<String, String> gropPro : gropPayMent) {
			
			String pdc_code = gropPro.get("PDC_CODE");
			String pd_code = gropPro.get("PD_CODE");
			String pd_date = String.valueOf(gropPro.get("PD_DATE"));
			String pd_name = gropPro.get("PD_NAME");
			int pd_price = Integer.parseInt(String.valueOf(gropPro.get("PD_PRICE")));
			int pd_cnt = Integer.parseInt(String.valueOf(gropPro.get("CNT")));
			int stk_stock = Integer.parseInt(String.valueOf(gropPro.get("STK_STOCK")));
			
			sb.append("<center>");
			sb.append("<input type='hidden' id='sc_code' value ='00'>");
			sb.append("<input type='hidden' id='st_num' value ='01'>");
			sb.append("<input type='hidden' id='oac_num' value ='null'>");
			sb.append("</center>");
			
			sb.append("<tr>");
			sb.append("<td>");
			sb.append("<input type ='hidden' name ='pdcode' id='pdcode"+cnt+"' data-code ='"+pdc_code+"' value='"+pd_code+"'>");
			sb.append("<input type ='hidden' name ='pddate' id='pddate"+cnt+"' data-code ='"+null+"' value='"+pd_date+"'>");
			sb.append(pd_name);
			sb.append("</td>");
			
			sb.append("<td>");
			sb.append("<p class='price' id='totalprice"+cnt+"'>").append(pd_price*pd_cnt).append("</p>");
			sb.append("<input type ='hidden' id = 'hiddenprice"+cnt+"' value='"+pd_price+"'>");
			sb.append("</td>");
			
			sb.append("<td>");
			sb.append("<input type='hidden' id='hiddenctn"+cnt+"' value ='"+0+"'>");
			sb.append("<input type='number' name = 'pdcnt' min = '0' max = '"+(pd_cnt+stk_stock)+"' id='pdcnt"+cnt+"' onchange='totalprice()' value='"+pd_cnt+"'>");
			sb.append("</td>");
			
			sb.append("<td>");
			sb.append("<input type ='button' id='cancelbutton"+cnt+"' class='cancelbutton_for_oac' onclick='cancelorder("+cnt+")' value ='취소'>");
			sb.append("</td>");
			sb.append("</tr>");
			
					
			cnt++;
		}
		sb.append("</table>");
		return sb.toString();
	}
	
}
