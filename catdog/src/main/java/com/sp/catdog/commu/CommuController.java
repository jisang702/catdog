package com.sp.catdog.commu;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("commu.commuController")
public class CommuController {
	
	@Autowired
	private CommuService service;
	
	@RequestMapping(value="/commu")
	public String main(Model model) throws Exception {
		
		Map<String, Object> map = new HashMap<>();
		map.put("mode", "list");
		List<Commu> listCommu = service.listCommu(map);
		List<Commu> listVideo = service.listVideo(map);
		
		map.put("mode", "first");
		List<Commu> firstCommu = service.listCommu(map);
		List<Commu> firstVideo = service.listVideo(map);
		
		map.put("mode", "second");
		List<Commu> secondCommu = service.listCommu(map);
		List<Commu> secondVideo = service.listVideo(map);
		
		model.addAttribute("listCommu", listCommu);
		model.addAttribute("firstCommu", firstCommu);
		model.addAttribute("secondCommu", secondCommu);
		
		model.addAttribute("listVideo", listVideo);
		model.addAttribute("firstVideo", firstVideo);
		model.addAttribute("secondVideo", secondVideo);
		
		return ".main.main";
	}
}
