package kh.project.stayfit.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminController {
	
	
	@Autowired
//	private AdminService service;
	
	
	@GetMapping
	public String writeGet() {
		return "/admin/index";
	}

}
