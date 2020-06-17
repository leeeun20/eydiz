package com.eydiz.studio;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("studio.studioController")
@RequestMapping("/studio/*")
public class StudioController implements StudioConstant {
	
	@RequestMapping(value="/brand/info")
	public String startBrand() {
		return "/studio/make";
	}
	
	@RequestMapping(value="/project/list")
	public String list() {
		
		return ".studioLayout";
	}
}
