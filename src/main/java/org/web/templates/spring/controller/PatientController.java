package org.web.templates.spring.controller;

import java.security.Principal;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.web.templates.spring.model.util.StringUtil;
import org.web.templates.spring.model.view.PatientEntity;

@Controller
public class PatientController extends BaseController {

	private static final String BREADCRUMB_FLAG_SECOND = "breadcrumbFlag";
	private static final String BREADCRUMB_FLAG_FIRST = "breadcrumbFlagFirst";
	private static final String PAGE_TITLE = "pageTitle";
	private static final String PATIENT = "Patient";

	@RequestMapping(value = "/patient/register", method = RequestMethod.GET)
	public String register(ModelMap model) {
		model.addAttribute(PAGE_TITLE, "Register");
		model.addAttribute(BREADCRUMB_FLAG_FIRST, PATIENT);
		model.addAttribute(BREADCRUMB_FLAG_SECOND, "Register");
		return "patient-register";
	}

	@RequestMapping(value = "/patient/register/help", method = RequestMethod.GET)
	public String registerHelp(ModelMap model) {
		model.addAttribute(PAGE_TITLE, "Register Help");
		model.addAttribute(BREADCRUMB_FLAG_FIRST, PATIENT);
		model.addAttribute(BREADCRUMB_FLAG_SECOND, "Register Help");
		return "patient-register-help";
	}

	@RequestMapping(value = "/patient/faq", method = RequestMethod.GET)
	public String faq(ModelMap model) {
		model.addAttribute(PAGE_TITLE, "FAQs");
		model.addAttribute(BREADCRUMB_FLAG_FIRST, PATIENT);
		model.addAttribute(BREADCRUMB_FLAG_SECOND, "FAQs");
		return "patient-faq";
	}

	@RequestMapping(value = "/patient/doctor/specialization/info", method = RequestMethod.GET)
	public String doctorSpecializationInfo(ModelMap model) {
		model.addAttribute(PAGE_TITLE, "Doctor Specialization Information");
		model.addAttribute(BREADCRUMB_FLAG_FIRST, PATIENT);
		model.addAttribute(BREADCRUMB_FLAG_SECOND, "Doctor Specialization Information");
		return "patient-doctor-specialization-info";
	}

	@RequestMapping(value = "/patient/generalinfo", method = RequestMethod.GET)
	public String generalInfo(ModelMap model) {
		model.addAttribute(PAGE_TITLE, "General Information");
		model.addAttribute(BREADCRUMB_FLAG_FIRST, PATIENT);
		model.addAttribute(BREADCRUMB_FLAG_SECOND, "General Information");
		return "patient-general-info";
	}

	@RequestMapping(value = "/patient/secured/doctor/book", method = RequestMethod.GET)
	public String bookAppointment(ModelMap model) {
		model.addAttribute(PAGE_TITLE, "Book An Appointment");
		model.addAttribute(BREADCRUMB_FLAG_FIRST, PATIENT);
		model.addAttribute(BREADCRUMB_FLAG_SECOND, "Book An Appointment");
		return "patient-doctor-book";
	}

	@RequestMapping(value = "/patient/secured/doctor/recommend", method = RequestMethod.GET)
	public String recommendDoctor(ModelMap model) {
		model.addAttribute(PAGE_TITLE, "Recomment Doctor");
		model.addAttribute(BREADCRUMB_FLAG_FIRST, PATIENT);
		model.addAttribute(BREADCRUMB_FLAG_SECOND, "Recomment Doctor");
		return "patient-doctor-recommend";
	}

	@RequestMapping(value = "/patient/secured/doctor/feedback", method = RequestMethod.GET)
	public String writeFeedback(ModelMap model) {
		model.addAttribute(PAGE_TITLE, "Write a Feedback to Doctor");
		model.addAttribute(BREADCRUMB_FLAG_FIRST, PATIENT);
		model.addAttribute(BREADCRUMB_FLAG_SECOND, "Write a Feedback to Doctor");
		return "patient-doctor-feedback";
	}

	@RequestMapping(value = "/patient/secured/account", method = RequestMethod.GET)
	public String viewAccount(ModelMap model, Principal principal) {
		model.addAttribute(PAGE_TITLE, "Patient Account");
		model.addAttribute(BREADCRUMB_FLAG_FIRST, PATIENT);
		model.addAttribute(BREADCRUMB_FLAG_SECOND, "Patient Account");
		PatientEntity patientEntity = new PatientEntity();

		if (StringUtil.isEmpty(getUsername())) {
			return "patient-login";
		}

		patientEntity.setFirstName("Paul Vincent");
		patientEntity.setLastName("Ancajas");

		model.addAttribute(patientEntity);

		return "patient-account";
	}

	@RequestMapping(value = "/patient/secured/schedules", method = RequestMethod.GET)
	public String schedules(ModelMap model) {
		model.addAttribute(PAGE_TITLE, "Your Schedules");
		model.addAttribute(BREADCRUMB_FLAG_FIRST, PATIENT);
		model.addAttribute(BREADCRUMB_FLAG_SECOND, "Your Schedules");
		return "patient-schedules";
	}

}