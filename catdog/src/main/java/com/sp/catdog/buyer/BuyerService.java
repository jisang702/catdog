package com.sp.catdog.buyer;

import java.util.List;
import java.util.Map;

public interface BuyerService {
	public List<Buyer>listBuyer(Map<String,Object>map);
	public int dataCount(Map<String, Object>map);
	public Buyer readBuyer(int prdNum);
	public void prdHitCount(int prdNum) throws Exception;
	
}
