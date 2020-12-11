package com.sp.catdog.store.dog;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("storemain.storedogController")
public class StoredogController {

	@RequestMapping("/store/dogbbs")
	public String storedog() throws Exception{
		return ".store.storemain.dogbbs";
	}
	@RequestMapping("/store/catbbs")
	public String storecat() throws Exception{
		return ".store.storemain.catbbs";
	}
}
