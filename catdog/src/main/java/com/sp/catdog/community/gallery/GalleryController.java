package com.sp.catdog.community.gallery;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("gallery.galleryController")
@RequestMapping("/gallery/*")
public class GalleryController {
	@RequestMapping("list")
	public String list() throws Exception {
		return ".community.gallery.list";
	}
	@RequestMapping("article")
	public String article() throws Exception {
		return ".community.gallery.article";
	}
	
	@RequestMapping("created")
	public String createdForm() throws Exception {
		return ".community.gallery.created";
	}
}
