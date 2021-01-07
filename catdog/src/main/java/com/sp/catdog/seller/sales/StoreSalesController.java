package com.sp.catdog.seller.sales;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller("store.seller.StoreSalesController")
@RequestMapping("/store/seller/*")
public class StoreSalesController {
	@RequestMapping(value="sales_list")
	public String main() throws Exception {
		return ".seller.store.seller.sales_list";
	}
	
	
	@RequestMapping("line1")
	@ResponseBody
	public Map<String, Object> line1() throws Exception {
		Map<String, Object> model = new HashMap<>();
		
		List<Map<String, Object>> list = new ArrayList<>();
		Map<String, Object> map = new HashMap<>();
		map.put("name", "단위:백만원");
		map.put("data", new double[] {42, 53, 32, 93, 56, 117, 219, 231, 206, 195, 253, 248});
		
		list.add(map);
		
		model.put("series", list);
		
		return model;
	}
	
	@RequestMapping(value = "pie3d",produces = "application/json;charset=utf-8")
	@ResponseBody
	public String pie3d() throws Exception {
	   
	   JSONArray arr = new JSONArray();
   
	   JSONObject job = new JSONObject();
	   job.put("name","판매량");
	   
	   JSONArray ja = new JSONArray();
	   ja.put(new JSONArray("['간식',433]"));
	   ja.put(new JSONArray("['사료',612]"));
	   ja.put(new JSONArray("['외출',32]"));
	   ja.put(new JSONArray("['패션',54]"));
	   ja.put(new JSONArray("['케어',11]"));
	   ja.put(new JSONArray("['리빙',27]"));
	   ja.put(new JSONArray("['기타',3]"));
	   
	   job.put("data", ja);
	   arr.put(job);
	   
	   return arr.toString();
	   
	   }
}
