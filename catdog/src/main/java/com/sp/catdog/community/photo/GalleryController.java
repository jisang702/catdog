package com.sp.catdog.community.photo;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("photo.photoController")
@RequestMapping("/photo/*")
public class GalleryController {
	@RequestMapping("list")
	public String list() throws Exception {
		return ".community.photo.list";
	}
	@RequestMapping("article")
	public String article() throws Exception {
		return ".community.photo.article";
	}
	
	@RequestMapping("created")
	public String createdForm() throws Exception {
		return ".community.photo.created";
	}
}
