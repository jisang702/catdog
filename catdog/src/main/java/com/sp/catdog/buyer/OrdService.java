package com.sp.catdog.buyer;

import java.util.List;
import java.util.Map;

public interface OrdService {
	public List<Ord> listOrd(Map<String, Object>map);
	public void insertOrd(Ord dto) throws Exception;
	}
