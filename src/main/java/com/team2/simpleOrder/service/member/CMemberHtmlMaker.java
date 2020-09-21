package com.team2.simpleOrder.service.member;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.function.IntPredicate;

import com.mysql.cj.ParseInfo;
import com.team2.simpleOrder.dto.Member;

public class CMemberHtmlMaker {
	StringBuilder sb = new StringBuilder();

	public String Clist(ArrayList<Member> clist) {
		for (int i = 0; i < clist.size(); i++) {
			sb.append("<tr>");
			sb.append("<td onclick = 'cLogindivon(" + clist.get(i).getC_code() + ")'>").append(clist.get(i).getC_name())
					.append("</td>");
			sb.append("<td onclick = 'cLogindivon(" + clist.get(i).getC_code() + ")'>").append(clist.get(i).getC_code())
					.append("</td>");
			sb.append("<td onclick = 'cLogindivon(" + clist.get(i).getC_code() + ")'>")
					.append(clist.get(i).getC_phone()).append("</td>");
			sb.append("<td onclick = 'cLogindivon(" + clist.get(i).getC_code() + ")'>")
					.append(clist.get(i).getC_address()).append("</td>");
			sb.append("<td>").append(
					"<input type = 'button' onclick = 'cAcountDelect(" + clist.get(i).getC_code() + ")' value ='삭제'")
					.append("</td>");
			sb.append("<td>").append(
					"<input type = 'button' onclick = 'cAcountUpdate(" + clist.get(i).getC_code() + ")' value ='수정'")
					.append("</td>");
//			sb.append("</tr>");
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
		for (HashMap<String, Object> positionindex : positionGrantKind) { // 등급의 갯수만큼
			sb.append("<tr>");
			sb.append("<td>").append(positionindex.get("PST_NAME"));
			for (int i = 0; i < ((boolean[]) positionindex.get("grantBooleanList")).length; i++) {// 서버의 모든 권한 코드
				if (((boolean[]) positionindex.get("grantBooleanList"))[i]) {
					sb.append("<td>").append("<input name= " + positionindex.get("PST_POSITION") + "#" + i
							+ " type = 'checkbox' checked='checked'").append("</td>");
				} else {
					sb.append("<td>").append(
							"<input name= " + positionindex.get("PST_POSITION") + "#" + i + " type = 'checkbox'")
							.append("</td>");
				}
			}
			sb.append("</tr>");
		}

		return sb.toString();
	}

	public String getPositionHtml(ArrayList<HashMap<String, String>> numberOfPosition) {
		for (HashMap<String, String> positionInfo : numberOfPosition) {
			sb.append("<tr id= "+positionInfo.get("PST_POSITION")+">");
			sb.append("<td>").append("<input type = 'text' value = "+positionInfo.get("PST_NAME")+">").append("</td>");
			sb.append("<td>").append(positionInfo.get("PST_NAME")).append("</td>");
			sb.append("<td>").append("<input type = 'button' value = '삭제' onclick ='positionDelete(this)'>").append("</td>");
			sb.append("<td>").append("<input type = 'button' value = '수정 저장' onclick ='positionUpdate(this)'>").append("</td>");
			sb.append("</tr>");
		}
		
		return sb.toString();
		
	}

}
