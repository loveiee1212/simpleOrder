package com.team2.simpleOrder.service.kiosk;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team2.simpleOrder.dao.kiosk.IKioskDao1;
import com.team2.simpleOrder.dto.Review;
import com.team2.simpleOrder.dto.ReviewImg;

@Service
public class KioskMM1 {
	@Autowired
	private IKioskDao1 kDao1;
	
	//리뷰리스트 가져오는 메소드
	public String getReviewList(String c_code) {
		List<Review> rList = kDao1.getReviewList(c_code);
		List<ReviewImg> rImgList = kDao1.getReviewImgList(c_code);

		String rvList = makeReviewListHtml(rList, rImgList);
		for (int i = 0; i < rList.size(); i++) {
			System.out.println(i + "번째 getBd_date=" + rList.get(i).getBd_date());
			System.out.println(i + "번째 getOac_num=" + rList.get(i).getOac_num());
			System.out.println(i + "번째 getRv_date=" + rList.get(i).getRv_date());
			System.out.println(i + "번째 getRv_score=" + rList.get(i).getRv_score());
			System.out.println(i + "번째 getRv_text=" + rList.get(i).getRv_text());
		}
		for (int i = 0; i < rImgList.size(); i++) {
			System.out.println(i + "번째 getBd_date=" + rImgList.get(i).getBd_date());
			System.out.println(i + "번째 getOac_num=" + rImgList.get(i).getOac_num());
			System.out.println(i + "번째 getRvImg_sysName=" + rImgList.get(i).getRvImg_sysName());
		}
		System.out.println(rvList);
		return rvList;
	}
	//리뷰 리스트 Html 만드는 메소드
	private String makeReviewListHtml(List<Review> rList, List<ReviewImg> rImgList) {
		StringBuilder rListHtml = new StringBuilder();
		rListHtml.append("<ul>");
		for (int i = 0; i < rList.size(); i++) {
			rListHtml.append("<li>");
			rListHtml.append("<div class='rv_detail'>");
			rListHtml.append("<div class='rv_code'><span class='rv_code_name'>");
			rListHtml.append(rList.get(i).getBd_date() + "날의 " + rList.get(i).getOac_num() + "번째 손님");
			rListHtml.append("</span><span class='rv_code_time'>");
			rListHtml.append(rList.get(i).getRv_date());
			rListHtml.append("</span></div>");
			rListHtml.append("<div class='rv_score'>");
			int ot;
			for (int s = 0; s < 10; s++) {
				if (s % 2 == 0) {
					ot = 1;
				} else {
					ot = 2;
				}
				if (rList.get(i).getRv_score() >= s) {
					rListHtml.append("<span class='starR" + ot + " on'>" + s + "</span>");
				} else {
					rListHtml.append("<span class='starR" + ot + "'>" + s + "</span>");
				}

			}
			rListHtml.append("</div>");
			String rv = rList.get(i).getBd_date() + rList.get(i).getOac_num();
			for (int j = 0; j < rImgList.size(); j++) {
				String rvImg = rImgList.get(j).getBd_date() + rImgList.get(j).getOac_num();
				if (rv.equals(rvImg)) {
					rListHtml.append("<div class='rv_img'>");
					rListHtml.append("<img class='img' src='" + rImgList.get(j).getRvImg_sysName() + "' alt='"
							+ rImgList.get(j).getRvImg_sysName() + "'></div>");
				}
			}
			rListHtml.append("<div class='rv_text'>");
			rListHtml.append(rList.get(i).getRv_text());
			rListHtml.append("</div></div></li>");
		}
		rListHtml.append("</ul>");

		return rListHtml.toString();
	}
	//요청사항 설정 해놓은 것 가져오는 메소드
	public String getRequestList(String c_code) {
		//리스트 가져와짐
		List<String> reqList = kDao1.getRequestList(c_code);
		for(int i=0; i<reqList.size(); i++) {
			System.out.println(reqList.get(i));
		}
		String reqHtml=reqListHtml(reqList);
		//Html만들어서 jsp에 붙이면 됨
		return reqHtml;
	}
	//요펑사항 리스트 Html 만드는 메소드
	private String reqListHtml(List<String> reqList) {
		StringBuilder reqHtml = new StringBuilder();
		reqHtml.append("<ul>");
		for (int i = 0; i < reqList.size(); i++) {
			reqHtml.append("<li>"+reqList.get(i)+"</li>");
		}
		reqHtml.append("</ul>");
		return reqHtml.toString();
	}

}
