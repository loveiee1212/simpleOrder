package com.team2.simpleOrder.dao.member;

import java.util.List;

import com.team2.simpleOrder.dto.Member;

public interface IEmpMemberDao {

	List getTime(Member member);

	boolean insertAd_inTime(Member member);

	boolean insertAd_outTime(Member member);

}
