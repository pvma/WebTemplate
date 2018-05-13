package org.web.templates.spring.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class WebTemplateController extends BaseController {
	
	

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(ModelMap model) {
		model.addAttribute(PAGE_TITLE, "Search Doctor");
		model.addAttribute(BREADCRUMB_FLAG_FIRST, null);
		model.addAttribute(BREADCRUMB_FLAG, "Search Doctor");
		return "doctor-search";
	}

	// parameters /login?error and /login?logout are default used by spring
	// security
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView login(@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String logout) {

		ModelAndView model = new ModelAndView();
		model.addObject(PAGE_TITLE, "Login");
		model.addObject(BREADCRUMB_FLAG, "Login");
		if (error != null) {
			model.addObject("error", "Invalid username and password!");
		}

		if (logout != null) {
			model.addObject("msg", "You've been logged out successfully.");
		}
		model.setViewName("dsams-login");

		return model;

	}

	@RequestMapping(value = "/loginHeader", method = RequestMethod.GET)
	public ModelAndView loginHeader(@RequestParam(value = "error", required = false) String error,
			@RequestParam(value = "logout", required = false) String logout) {

		ModelAndView model = new ModelAndView();
		model.addObject(PAGE_TITLE, "Login");
		model.addObject(BREADCRUMB_FLAG, "Login");
		if (error != null) {
			model.addObject("error", "Invalid username and password!");
		}

		if (logout != null) {
			model.addObject("msg", "You've been logged out successfully.");
		}
		model.setViewName("dsams-login");

		return model;

	}

	@RequestMapping(value = "/about", method = RequestMethod.GET)
	public String viewAbout(ModelMap model) {
		model.addAttribute(PAGE_TITLE, "About");
		model.addAttribute(BREADCRUMB_FLAG, "About");
		return "dsams-about";
	}

	@RequestMapping(value = "/services", method = RequestMethod.GET)
	public String viewServices(ModelMap model) {
		model.addAttribute(PAGE_TITLE, "Services");
		model.addAttribute(BREADCRUMB_FLAG, "Services");
		return "dsams-services";
	}

	@RequestMapping(value = "/patient-care", method = RequestMethod.GET)
	public String viewPatientCare(ModelMap model) {
		model.addAttribute(PAGE_TITLE, "Patient Care");
		model.addAttribute(BREADCRUMB_FLAG, "Patient Care");
		return "dsams-patient-care";
	}

	@RequestMapping(value = "/testimonials", method = RequestMethod.GET)
	public String viewTestimonials(ModelMap model) {
		model.addAttribute(PAGE_TITLE, "Testimonials");
		model.addAttribute(BREADCRUMB_FLAG, "Testimonials");
		return "dsams-testimonials";
	}

	@RequestMapping(value = "/contact", method = RequestMethod.GET)
	public String viewContact(ModelMap model) {
		model.addAttribute(PAGE_TITLE, "Contact");
		model.addAttribute(BREADCRUMB_FLAG, "Contact");
		return "dsams-contact";
	}

}