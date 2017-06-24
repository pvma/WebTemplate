package com.sourcebrewer.hoegarden.dsams.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class AdminController {

	@RequestMapping(value = "/admin/reports", method = RequestMethod.GET)
	public String reports(ModelMap model) {
		model.addAttribute("pageTitle", "Reports");
		model.addAttribute("breadcrumbFlag", "Reports");
		return "admin-reports";
	}

	@RequestMapping(value = "/admin/masterdata", method = RequestMethod.GET)
	public String masterData(ModelMap model) {
		model.addAttribute("pageTitle", "Master Data");
		model.addAttribute("breadcrumbFlag", "Master Data");
		return "admin-masterdata";
	}
	
	@RequestMapping(value = "/admin/help", method = RequestMethod.GET)
	public String help(ModelMap model) {
		model.addAttribute("pageTitle", "Admin Help");
		model.addAttribute("breadcrumbFlag", "Admin Help");
		return "admin-help";
	}

}