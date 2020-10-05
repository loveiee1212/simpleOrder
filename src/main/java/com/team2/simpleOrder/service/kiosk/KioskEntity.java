package com.team2.simpleOrder.service.kiosk;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class KioskEntity {

	// order_and_credit HashMap
	public HashMap<String, String> getOac(String c_code, String bd_date, String oac_num, String sc_code,
			String st_num) {
		HashMap<String, String> oac = new HashMap<String, String>();
		oac.put("c_code", c_code);
		oac.put("bd_date", bd_date);
		oac.put("oac_num", oac_num);
		oac.put("sc_code", sc_code);
		oac.put("st_num", st_num);
		return oac;
	}

	// order_history HashMap
	public List<HashMap<String, String>> getOhList(String c_code, String bd_date, String oac_num,
			List<Map<String, String>> bArr) {
		List<HashMap<String, String>> orderList = new ArrayList<HashMap<String, String>>();
		for (int i = 0; i < bArr.size(); i++) {
			HashMap<String, String> orderInfo = new HashMap<>();
			orderInfo.put("c_code", c_code);
			orderInfo.put("bd_date", bd_date);
			orderInfo.put("oac_num", oac_num);
			orderInfo.put("pdc_code", bArr.get(i).get("pdc_code"));
			orderInfo.put("pd_code", bArr.get(i).get("pd_code"));
			orderInfo.put("pd_date", bArr.get(i).get("pd_date"));
			orderInfo.put("oh_cnt", bArr.get(i).get("oh_cnt"));
			orderList.add(orderInfo);
		}
		return orderList;
	}
}
