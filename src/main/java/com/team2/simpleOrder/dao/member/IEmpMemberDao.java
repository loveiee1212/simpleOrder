package com.team2.simpleOrder.dao.member;

import java.util.List;

import com.team2.simpleOrder.dto.Member;

public interface IEmpMemberDao {

	List<Member> getTime(int year, int month);

}
