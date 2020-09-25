package com.team2.simpleOrder.service.storeManagement;

import java.util.ArrayList;
import java.util.HashMap;

public class TableHtmlMaker {
HashMap<String, String> hm = new HashMap<String, String>();
StringBuilder sb = new StringBuilder();
	public void getSeatList(ArrayList<HashMap<String, Object>> seatCategoriList) {
		for (HashMap<String, Object> categori : seatCategoriList) {
			System.out.println(categori); 
		}
	}

}
