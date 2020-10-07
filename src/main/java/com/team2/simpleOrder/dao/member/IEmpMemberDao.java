package com.team2.simpleOrder.dao.member;

import java.util.HashMap;
import java.util.List;


public interface IEmpMemberDao {
	Object getPst_name(HashMap<String, String> mb);

	List<HashMap<String, String>> getTime(HashMap<String, String> mb);

	boolean insertAd_inTime(HashMap<String, String> mb);

	boolean insertAd_outTime(HashMap<String, String> mb);

	List<HashMap<String, String>> getEmpList(HashMap<String, String> mb);

	HashMap<String, String> getEmpInfo(HashMap<String, String> mb);

	HashMap<String, String> getAdTime(HashMap<String, String> mb);

	boolean updateWorkTime(HashMap<String, String> mb);

	List<HashMap<String, String>> showWorkTime(HashMap<String, String> mb);

	List<HashMap<String, String>> showAllWorkTime(HashMap<String, String> mb);


}
