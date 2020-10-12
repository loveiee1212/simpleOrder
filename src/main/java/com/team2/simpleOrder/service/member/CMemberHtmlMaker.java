package com.team2.simpleOrder.service.member;

import java.util.ArrayList;
import java.util.HashMap;

import com.team2.simpleOrder.dto.Member;

public class CMemberHtmlMaker {
	StringBuilder sb = new StringBuilder();

	public String Clist(ArrayList<Member> clist) {
		for (int i = 0; i < clist.size(); i++) {
			String detailAddr = "";
			for(String addr : clist.get(i).getC_address().split("#")) {
				System.out.println(addr);
				detailAddr+=addr;
			}
			sb.append("<tr>");
			sb.append("<td onclick = 'cLogindivon(\"" + clist.get(i).getC_code() + "\")'>").append(clist.get(i).getC_name()).append("</td>");
			sb.append("<td onclick = 'cLogindivon(\"" + clist.get(i).getC_code() + "\")'>").append(clist.get(i).getC_code()).append("</td>");
			sb.append("<td onclick = 'cLogindivon(\"" + clist.get(i).getC_code() + "\")'>").append(clist.get(i).getC_phone()).append("</td>");
			sb.append("<td onclick = 'cLogindivon(\"" + clist.get(i).getC_code() + "\")'>").append(detailAddr).append("</td>");
			sb.append("<td>").append("<input type = 'button' id='DEbtn' onclick = 'cAcountDelect(\""+clist.get(i).getC_code()+"\")' value ='삭제'").append("</td>");
			sb.append("<td>").append("<input type = 'button' id='UPbtn'onclick = 'cAcountUpdate(\""+clist.get(i).getC_code()+"\")' value ='수정'").append("</td>");
			sb.append("</tr>");
		}

		return sb.toString();

	}

	public String empList(ArrayList<HashMap<String, String>> a) {
		int i = 0;
		sb.append("<tr>");
		sb.append("<th onclick='sortContent(0)'>").append("이름");
		sb.append("<th onclick='sortContent(1)'>").append("코드");
		sb.append("<th onclick='sortContent(2)'>").append("비밀번호");
		sb.append("<th onclick='sortContent(3)'>").append("직급");
		for (HashMap<String, String> empinfo : a) {
			sb.append("<tr id = " + i + " onclick = 'empInfosetting(").append(i).append(")'>");
			sb.append("<td>").append(empinfo.get("EMP_NAME")).append("</td>");
			sb.append("<td>").append(empinfo.get("EMP_CODE")).append("</td>");
			sb.append("<td>").append(empinfo.get("EMP_PW")).append("</td>");
			sb.append("<td>").append(empinfo.get("PST_NAME")).append("</td>");
			sb.append("</tr>");
			i++;
		}
		sb.append("<tr>").append("<td>").append("<input id='addbtn' type = 'button' value = '추가' onclick = 'createempSetting()'>")
				.append("<td/>").append("<tr/>");
		return sb.toString();
	}

	public String positionList(ArrayList<HashMap<String, String>> positionList, String empPosition) {
		for (HashMap<String, String> hm : positionList) {
			if (hm.get("PST_NAME").equals(empPosition)) {
				sb.append("<option value = " + Integer.parseInt(String.valueOf(hm.get("PST_POSITION"))) + " selected = 'selected'>");
				sb.append(hm.get("PST_NAME"));
				sb.append("</option>");
			} else {
				sb.append("<option value = " + Integer.valueOf(String.valueOf(hm.get("PST_POSITION"))) + ">");
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
			int pst_position = Integer.parseInt(String.valueOf(position.get(i).get("PST_POSITION")));
			sb.append("<tr id = '"+pst_position+"'>");
			sb.append("<td>").append("<input class ='pst_name' type = 'text' value ='"+position.get(i).get("PST_NAME")+"'>").append("</td>");
			if(pst_position == 0 ) {
				sb.append("<td>").append("<input type = 'button' value ='삭제 불가' class = 'positionDeleteClass'>").append("</td>");
			}else {
				sb.append("<td>").append("<input type = 'button' value ='삭제' onclick = 'deletePosition(this)' class = 'positionDeleteClass'>").append("</td>");
			}
			sb.append("<td>").append("<input type = 'button' value ='저장' onclick = 'updatePosition(this)' class = 'positionUpdateClass'>").append("</td>");
			sb.append("</tr>");
		}
		sb.append("<tr><td>").append("<input type = 'text' id='newPst_name' name='pst_name' placeholder='직급명 입력'>").append("</td>");
		sb.append("<td colspan = '2'>").append("<input type ='button' value ='추가' onclick='createPosition()' class = 'positionAddClass'>");
		sb.append("</tr>");
		
		return sb.toString();
	}

}
