package com.team2.simpleOrder.dao.money;

import java.util.HashMap;
import java.util.List;

public interface ISalesDao {

	List<HashMap<String, String>> getDaySales(HashMap<String, String> sam);

}
