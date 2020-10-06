package com.team2.simpleOrder.service.storeManagement;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.team2.simpleOrder.dao.order.IDetailOrderDao;
import com.team2.simpleOrder.dao.storeManagement.IProductDao;
import com.team2.simpleOrder.dto.StoreManagement;

@Service
public class ProductMM {
	@Autowired
	private IProductDao pDao;
	@Autowired
	private IDetailOrderDao ODao;

	public HashMap<String, String> getsproductlist(String c_code) { // 모든 상품 종류 노출
		ProductHtmlMaker phm = new ProductHtmlMaker();
		List<StoreManagement> pList = pDao.getsproductlist(c_code);
		HashMap<String, String> hMap = phm.makehtmlpList(pList);
		return hMap;
	}

	public HashMap<String, String> getProCategoriList(@Param(value = "c_code") String c_code) { // 상품 모든 카테고리
		ProductHtmlMaker phm = new ProductHtmlMaker();
		HashMap<String, String> hm = new HashMap<String, String>();
		hm.put("categoriList", phm.getProCategoriList(pDao.getProCategoriList(c_code)));
		return hm;
	}

	public String getProductofNumber(String c_code, HashMap<String, String> productCategori) { // 상품 새로운 코드 번호
		productCategori.put("c_code", c_code);
		System.out.println(productCategori);
		return pDao.getProductofNumber(productCategori);
	}

	public String deleteProduct(HashMap<String, String> proInfo, HttpSession session, RedirectAttributes reat) { // 상품 삭제
		proInfo.put("c_code", session.getAttribute("c_code").toString());
		pDao.deleteStock(proInfo);
		pDao.updateProductStatus(proInfo);
		return "redirect:/productcontrol";
	}

	public String createProCategori(HashMap<String, String> categoriInfo, HttpSession session, RedirectAttributes reat) { // 상품 카테고리 추가
		categoriInfo.put("pdc_code", pDao.numberOfproCategori(session.getAttribute("c_code").toString()));
		categoriInfo.put("c_code", session.getAttribute("c_code").toString());
		if (pDao.createProCategori(categoriInfo)) {

		}
		;
		return "redirect:/productcontrol";
	}

	@Transactional
	public String proCategoriDelete(HashMap<String, String> categoriInfo, HttpSession session, RedirectAttributes reat) { // 상품 카테고리 제거
		categoriInfo.put("c_code", session.getAttribute("c_code").toString());
		pDao.moveProinCategori(categoriInfo); // 삭제전 삭제 카테고리의 상품 모두 기본 01로 이동
		pDao.proCategoriDelete(categoriInfo); // 카테고리 삭제
		return "redirect:/productcontrol";
	}

	public String proCategoriUpdate(HashMap<String, String> categoriInfo, HttpSession session, RedirectAttributes reat) { // 상품 카테고리 이름 변경
		categoriInfo.put("c_code", session.getAttribute("c_code").toString());
		pDao.proCategoriUpdate(categoriInfo);
		return "redirect:/productcontrol";
	}

	@Transactional
	public String createProduct(HashMap<String, String> proInfo, HttpSession session, MultipartFile pdfile,	RedirectAttributes reat) { // 상품 등록
		try {
			SimpleDateFormat dateFormat = new SimpleDateFormat ( "yyyy-MM-dd HH:mm:ss");
			proInfo.put("c_code", session.getAttribute("c_code").toString());
			proInfo.put("pd_date", dateFormat.format(Calendar.getInstance().getTime()));
		
			if (pdfile.getSize() == 0) { // 이미지가 없다면.
				if(proInfo.get("pd_imgname")==null) {
					proInfo.put("pd_imgname", "ERRORIMG");
				}
				pDao.createProduct(proInfo);
			} else { // 이미지가 있다면
				FileUpAndDelete fileMM = new FileUpAndDelete();
				proInfo = fileMM.uploadFileImg(pdfile,proInfo,session);
				pDao.createProduct(proInfo);
			}
			if(Boolean.parseBoolean(proInfo.get("stockUse"))) {//업로드가 끝나고 재고가 있다면
				pDao.createProStock(proInfo);
			}
			
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
			return "redirect:/productcontrol";
	}
	@Transactional
	public String updateProduct(HashMap<String, String> proInfo, HttpSession session, MultipartFile pdfile,	RedirectAttributes reat) { // 상품상태 0으로 변경 후 새로 등록
		proInfo.put("c_code", session.getAttribute("c_code").toString());
		proInfo.put("pd_imgname", pDao.getProImgname(proInfo));
		proInfo.put("update", "true");
		pDao.updateProductStatus(proInfo); // 상품 
		pDao.deleteStock(proInfo); // 기존 재고 삭제
		createProduct(proInfo, session, pdfile, reat); // 상품 새로 생성
		return  "redirect:/productcontrol";
	}
	

	public HashMap<String, String> getProList(HttpSession session) {
		ProductHtmlMaker phm = new ProductHtmlMaker(); // htmlmaker 생성
		ArrayList<HashMap<String, Object>> apl = pDao.getProList(session.getAttribute("c_code").toString());
		ArrayList<HashMap<String, Object>> skl = pDao.getSellKeyProList(session.getAttribute("c_code").toString());
		for (int i = 0; i < apl.size(); i++) {
			for (int j = 0; j < skl.size(); j++) {
				if (apl.get(i).get("PDC_CODE").equals(skl.get(j).get("PDC_CODE"))
						&& apl.get(i).get("PD_DATE").equals(skl.get(j).get("PD_DATE"))
						&& apl.get(i).get("PD_CODE").equals(skl.get(j).get("PD_CODE"))) {
					apl.get(i).put("sellkey", "sellkey");
				}
			}
		}
		HashMap<String, String> hm = new HashMap<String, String>();
		hm.put("proList", phm.makeProListHtml(apl));
		return hm;
	}
	public HashMap<String, String> getSellKeyCatList(HttpSession session) {
		ProductHtmlMaker phm = new ProductHtmlMaker();
		ArrayList<HashMap<String, Object>> skCatList = pDao
				.getSellKeyCatList(session.getAttribute("c_code").toString());
		for (int i = 0; i < skCatList.size(); i++) {
			String c_code = skCatList.get(i).get("C_CODE").toString();
			String skc_code = skCatList.get(i).get("SKC_CODE").toString();
			HashMap<String, String> hm = new HashMap<String, String>();
			hm.put("c_code", c_code);
			hm.put("skc_code", skc_code);
			skCatList.get(i).put("SKC_CODEList", pDao.getsellKeyInfo(hm));
		}
		return phm.sellkeyhtmlMake(skCatList);
	}

	@Transactional
	public String updatesellkey(String[] pdc_code, String[] pd_code, String[] pd_date, String[] skc_code, String[] sk_num, HttpSession session, RedirectAttributes reat) {
		String c_code = session.getAttribute("c_code").toString();
		pDao.deletesellKey(c_code);
		for(int i = 0 ; i < pdc_code.length ; i++) {
			HashMap<String, String> hm = new HashMap<String, String>();
			hm.put("c_code", c_code);
			hm.put("pdc_code", pdc_code[i]);
			hm.put("pd_code", pd_code[i]);
			hm.put("pd_date", pd_date[i]);
			hm.put("skc_code", skc_code[i]);
			hm.put("sk_num", sk_num[i]);
			pDao.createsellKey(hm);
		}
		return "redirect:/producreagistraition";
	}

	public String updateSellKeySize(HashMap<String, String> sellKeySize, HttpSession session, RedirectAttributes reat) {
		sellKeySize.put("c_code", session.getAttribute("c_code").toString());
		System.out.println(sellKeySize);
		pDao.updateSellKeySize(sellKeySize);
		return "redirect:/producreagistraition";
	}

	public HashMap<String, String> getSellKeyCategoriList(HttpSession session) {
		ProductHtmlMaker phm = new ProductHtmlMaker();
		HashMap<String, String> hm = phm.getSellKeyCategoriList(pDao.getSellKeyCategoriList(session.getAttribute("c_code").toString()));
		hm.put("newSkc_code", pDao.getNewSckCode(session.getAttribute("c_code").toString()));
		return hm;
	}

	public String createSkcCategori(HashMap<String, String> skcInfo, HttpSession session, RedirectAttributes reat) {
		skcInfo.put("c_code", session.getAttribute("c_code").toString());
		if(skcInfo.get("skc_code").equals("null")) {
			skcInfo.put("skc_code", "0");
		}
		System.out.println(skcInfo);
		pDao.createSkcCategori(skcInfo);
		return "redirect:/producreagistraition";
	}

	public String deleteSkcCategori(HashMap<String, String> skcInfo, HttpSession session, RedirectAttributes reat) {
		skcInfo.put("c_code", (String) session.getAttribute("c_code"));
		pDao.deleteSkcCategori(skcInfo);
		return "redirect:/producreagistraition";
	}

	public HashMap<String, String> getStockList(HttpSession session) {
		ProductHtmlMaker phm = new ProductHtmlMaker();
		return phm.getStockList(pDao.getStockList(session.getAttribute("c_code").toString()));
	}

	public HashMap<String, String> getStockRecord(HashMap<String, String> stockInfo, HttpSession session) {
		ProductHtmlMaker phm = new ProductHtmlMaker();
		stockInfo.put("c_code", session.getAttribute("c_code").toString());
		return phm.getStockRecord(pDao.getStockRecord(stockInfo));
	}
	@Transactional
	public HashMap<String, String> updateStock(HashMap<String, String> stockInfo, HttpSession session) {
		stockInfo.put("c_code", session.getAttribute("c_code").toString());
		stockInfo.put("bd_date", session.getAttribute("bd_date").toString());
		stockInfo.put("oac_num", ODao.getNewOacCode(session.getAttribute("c_code").toString(), session.getAttribute("bd_date").toString()));
		System.out.println(stockInfo);
		pDao.updateStock(stockInfo);
		return null;
	}
}
