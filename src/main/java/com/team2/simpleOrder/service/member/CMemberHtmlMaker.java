package com.team2.simpleOrder.service.member;

import java.util.ArrayList;

import com.team2.simpleOrder.dto.Member;

public class CMemberHtmlMaker {

	public String Clist(ArrayList<Member> clist) {
		StringBuilder hm = new StringBuilder();
		for(int i = 0 ; i < clist.size(); i++) {
			hm.append("<tr onclick = 'cLogindivon("+clist.get(i).getC_code()+")'>");
			hm.append("<td>").append(clist.get(i).getC_name()).append("</td>");
			hm.append("<td>").append(clist.get(i).getC_code()).append("</td>");
			hm.append("<td>").append(clist.get(i).getC_phone()).append("</td>");
			hm.append("<td>").append(clist.get(i).getC_address()).append("</td>");
			hm.append("</tr>");
		}
			
		return hm.toString();
		
	}

	

}
