package com.team2.simpleOrder.service.member;

import java.util.ArrayList;
import java.util.HashMap;

import com.team2.simpleOrder.dto.Member;

public class CMemberHtmlMaker {
	StringBuilder sb = new StringBuilder();

	public String Clist(ArrayList<Member> clist) {
		for (int i = 0; i < clist.size(); i++) {
			sb.append("<tr>");
			sb.append("<td onclick = 'cLogindivon(" + clist.get(i).getC_code() + ")'>").append(clist.get(i).getC_name()).append("</td>");
			sb.append("<td onclick = 'cLogindivon(" + clist.get(i).getC_code() + ")'>").append(clist.get(i).getC_code()).append("</td>");
			sb.append("<td onclick = 'cLogindivon(" + clist.get(i).getC_code() + ")'>").append(clist.get(i).getC_phone()).append("</td>");
			sb.append("<td onclick = 'cLogindivon(" + clist.get(i).getC_code() + ")'>").append(clist.get(i).getC_address()).append("</td>");
			sb.append("<td>").append("<input type = 'button' id='DEbtn' onclick = 'cAcountDelect("+clist.get(i).getC_code()+")' value ='삭제'").append("</td>");
			sb.append("<td>").append("<input type = 'button' id='UPbtn'onclick = 'cAcountUpdate("+clist.get(i).getC_code()+")' value ='수정'").append("</td>");
			sb.append("</tr>");
		}

		return sb.toString();

	}

	public String empList(ArrayList<HashMap<String, String>> a) {
		int i = 0;
		sb.append("<tr>");
		sb.append("<th>").append("이름");
		sb.append("<th>").append("코드");
		sb.append("<th>").append("비밀번호");
		sb.append("<th>").append("직급");
		for (HashMap<String, String> empinfo : a) {
			sb.append("<tr id = " + i + " onclick = 'empInfosetting(").append(i).append(")'>");
			sb.append("<td>").append(empinfo.get("EMP_NAME")).append("</td>");
			sb.append("<td>").append(empinfo.get("EMP_CODE")).append("</td>");
			sb.append("<td>").append(empinfo.get("EMP_PW")).append("</td>");
			sb.append("<td>").append(empinfo.get("PST_NAME")).append("</td>");
			sb.append("</tr>");
			i++;
		}
		sb.append("<tr>").append("<td>").append("<input type = 'button' value = '추가' onclick = 'createempSetting()'>")
				.append("<td/>").append("<tr/>");
		return sb.toString();
	}

	public String positionList(ArrayList<HashMap<String, String>> positionList, String empPosition) {
		for (HashMap<String, String> hm : positionList) {
			if (hm.get("PST_NAME").equals(empPosition)) {
				sb.append("<option value = " + hm.get("PST_POSITION") + " selected = 'selected'>");
				sb.append(hm.get("PST_NAME"));
				sb.append("</option>");
			} else {
				sb.append("<option value = " + hm.get("PST_POSITION") + ">");
				sb.append(hm.get("PST_NAME"));
				sb.append("</option>");
			}
		}
		return sb.toString();
	}

	public String makeHtmlPostionGrnat(ArrayList<HashMap<String, Object>> positionGrantKind) {
		for (HashMap<String, Object> hM : positionGrantKind) {
			sb.append("<tr>");
			sb.append("<td>").append(hM.get("PST_NAME")).append("</td>");
			for(int i = 0 ; i <((boolean[]) hM.get("grantBooleanList")).length ; i++) {
				if( ((boolean[])hM.get("grantBooleanList"))[i] ) {
					sb.append("<td>").append("<input class = '"+hM.get("PST_POSITION")+"' name = '"+hM.get("PST_POSITION")+"#"+i+"' type ='checkbox' checked = 'checked'> ").append("</td>");
				}else {
					sb.append("<td>").append("<input class = '"+hM.get("PST_POSITION")+"' name = '"+hM.get("PST_POSITION")+"#"+i+"' type ='checkbox'>").append("</td>");
				}
			}
			sb.append("</tr>");
		}
		return sb.toString();
	}

	public String getPositionHtml(ArrayList<HashMap<String, String>> position) {
		for (int i = 0 ; i < position.size(); i++) {
			sb.append("<tr id = '"+position.get(i).get("PST_POSITION")+"'>");
			sb.append("<td>").append("<input class ='pst_name' type = 'text' value ='"+position.get(i).get("PST_NAME")+"'>").append("</td>");
			sb.append("<td>").append("<input type = 'button' value ='삭제' onclick = 'deletePosition(this)'>").append("</td>");
			sb.append("<td>").append("<input type = 'button' value ='저장' onclick = 'updatePosition(this)'>").append("</td>");
			sb.append("</tr>");
		}
		sb.append("<tr><td>").append("<input type = 'text' id='newPst_name' name='pst_name'>").append("</td>");
		sb.append("<td colspan = '2'>").append("<input type ='button' value ='추가' onclick='createPosition()'>");
		sb.append("</tr>");
		
		return sb.toString();
	}

}
