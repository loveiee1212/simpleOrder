package com.team2.simpleOrder.service.member;

import java.util.ArrayList;
import java.util.HashMap;

import com.team2.simpleOrder.dto.Member;

public class CMemberHtmlMaker {
	StringBuilder sb = new StringBuilder();
	public String Clist(ArrayList<Member> clist) {

		for(int i = 0 ; i < clist.size(); i++) {
			sb.append("<tr onclick = 'cLogindivon("+clist.get(i).getC_code()+")'>");
			sb.append("<td>").append(clist.get(i).getC_name()).append("</td>");
			sb.append("<td>").append(clist.get(i).getC_code()).append("</td>");
			sb.append("<td>").append(clist.get(i).getC_phone()).append("</td>");
			sb.append("<td>").append(clist.get(i).getC_address()).append("</td>");
			sb.append("</tr>");
		}
			
		return sb.toString();
		
	}

	public String empList(ArrayList<HashMap<String, String>> a) {
		int i = 0 ; 
		for (HashMap<String, String> empinfo : a) {
			sb.append("<tr id = "+i+" onclick = 'empInfosetting(").append(i).append(")'>");
			sb.append("<td>").append(empinfo.get("EMP_NAME")).append("</td>");
			sb.append("<td>").append(empinfo.get("EMP_CODE")).append("</td>");
			sb.append("<td>").append(empinfo.get("EMP_PW")).append("</td>");
			sb.append("<td>").append(empinfo.get("PST_NAME")).append("</td>");
			sb.append("</tr>");
			i++;
		}
		sb.append("<tr>").append("<td>").append("<input type = 'button' value = '추가' onclick = 'addEmp1()'>").append("<td/>").append("<tr/>");
		return sb.toString();
	}

	public String positionList(ArrayList<HashMap<String, String>> positionList, String empPosition) {
		for (HashMap<String, String> hm : positionList) {
			if(hm.get("PST_NAME").equals(empPosition)) {
				sb.append("<option value = "+hm.get("PST_POSITION")+" selected = 'selected'>");
				sb.append(hm.get("PST_NAME"));
				sb.append("</option>");
			}else {
				sb.append("<option value = "+hm.get("PST_POSITION")+">");
				sb.append(hm.get("PST_NAME"));
				sb.append("</option>");
			}
		}
		return sb.toString();
	}

	

}
