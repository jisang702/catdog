package com.sp.catdog.store;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("store.storemainController")
public class StoremainController {
	@RequestMapping(value="/store/")
	public String list() throws Exception {
	
		return ".store.storemain.store";
	}
}
