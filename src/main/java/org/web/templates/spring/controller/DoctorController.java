package org.web.templates.spring.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.web.templates.spring.model.view.DoctorClinic;
import org.web.templates.spring.model.view.DoctorEntity;
import org.web.templates.spring.model.view.DoctorSchedule;
import org.web.templates.spring.model.view.DoctorSpecialization;
import org.web.templates.spring.model.view.SearchDoctorsCriteria;

@Controller
public class DoctorController extends BaseController {

	private static final String DOCTOR = "Doctor";

	@RequestMapping(value = "/doctor/search", method = RequestMethod.GET)
	public String searchPage(ModelMap model) {
		model.addAttribute(PAGE_TITLE, "Search Doctor");
		model.addAttribute(BREADCRUMB_FLAG_FIRST, DOCTOR);
		model.addAttribute(BREADCRUMB_FLAG, "Search Doctor");
		return "doctor-search";
	}

	@RequestMapping(value = "/doctor/secured/register", method = RequestMethod.GET)
	public String register(ModelMap model) {
		model.addAttribute(PAGE_TITLE, "Register Doctor");
		model.addAttribute(BREADCRUMB_FLAG_FIRST, DOCTOR);
		model.addAttribute(BREADCRUMB_FLAG, "Register Doctor");
		return "doctor-register";
	}

	@RequestMapping(value = "/doctor/faq", method = RequestMethod.GET)
	public String faq(ModelMap model) {
		model.addAttribute(PAGE_TITLE, "Doctor FAQs");
		model.addAttribute(BREADCRUMB_FLAG_FIRST, DOCTOR);
		model.addAttribute(BREADCRUMB_FLAG, "Doctor FAQs");
		return "doctor-faq";
	}

	@RequestMapping(value = "/doctor/help", method = RequestMethod.GET)
	public String help(ModelMap model) {
		model.addAttribute(PAGE_TITLE, "Doctor Help");
		model.addAttribute(BREADCRUMB_FLAG_FIRST, DOCTOR);
		model.addAttribute(BREADCRUMB_FLAG, "Doctor Help");
		return "doctor-help";
	}

	@ResponseBody
	@RequestMapping(value = "/doctor/dosearch", method = RequestMethod.POST)
	public ResponseEntity<List<DoctorEntity>> doSearch(@RequestBody SearchDoctorsCriteria search) {

		List<DoctorEntity> doctors = getDoctorData();

		return new ResponseEntity<List<DoctorEntity>>(doctors, HttpStatus.OK);

	}

	@RequestMapping(value = "/doctor/view/{id}", method = RequestMethod.GET)
	public ModelAndView viewDoctor(@PathVariable("id") String id) {
		List<DoctorEntity> list = getDoctorData();

		DoctorEntity doctorEntity = list.get(Integer.valueOf(id));

		ModelAndView model = new ModelAndView();
		model.setViewName("doctor-view");
		model.addObject("doctor", doctorEntity);
		model.addObject(PAGE_TITLE, "View Doctor");
		model.addObject(BREADCRUMB_FLAG_FIRST, DOCTOR);
		model.addObject(BREADCRUMB_FLAG, "View Doctor");

		return model;
	}

	@RequestMapping(value = "/doctor/register", method = RequestMethod.GET)
	public String add(ModelMap model) {
		model.addAttribute(PAGE_TITLE, "Register Page");
		model.addAttribute(BREADCRUMB_FLAG_FIRST, DOCTOR);
		model.addAttribute(BREADCRUMB_FLAG, "Register");
		return "doctor-register";
	}

	private List<DoctorEntity> getDoctorData() {
		DoctorSchedule ds1 = new DoctorSchedule();
		ds1.setDay("Monday");
		ds1.setTimeStart("8:00 AM");
		ds1.setTimeEnd("5:00 PM");
		DoctorSchedule ds2 = new DoctorSchedule();
		ds2.setDay("Teusday");
		ds2.setTimeStart("8:00 AM");
		ds2.setTimeEnd("5:00 PM");
		DoctorSchedule ds3 = new DoctorSchedule();
		ds3.setDay("Wednesday");
		ds3.setTimeStart("8:00 AM");
		ds3.setTimeEnd("5:00 PM");
		DoctorSchedule ds4 = new DoctorSchedule();
		ds4.setDay("Thursday");
		ds4.setTimeStart("8:00 AM");
		ds4.setTimeEnd("5:00 PM");

		List<DoctorSchedule> dsList = new ArrayList<DoctorSchedule>();
		dsList.add(ds1);
		dsList.add(ds2);
		dsList.add(ds3);
		dsList.add(ds4);

		List<DoctorEntity> doctors = new ArrayList<>();
		DoctorEntity d1 = new DoctorEntity();
		d1.setId(0);
		d1.setFirstName("Juan");
		d1.setLastName("Dela Cruz");
		d1.setSelfDescription("Over 10 years of experience in blah.... Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur condimentum est et ante aliquet, rhoncus bibendum sem dictum. Duis maximus id nibh eget efficitur. Curabitur laoreet, ex sed dapibus ultricies, ex tellus vestibulum odio, quis euismod arcu ex fermentum metus. Donec aliquet pharetra tincidunt. Morbi et lorem enim. Quisque dui velit, sagittis sed sodales ut, tincidunt nec mi. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Fusce eget ex sagittis, ullamcorper ligula quis, aliquam velit. Praesent tempor pellentesque ante a euismod. Suspendisse lacinia ex quis rhoncus tempus. Sed venenatis consectetur ipsum vel eleifend. Morbi risus metus, sollicitudin id ipsum non, porta lacinia nibh.");
		d1.setTotalYears(11);
		DoctorClinic d1c1 = new DoctorClinic();
		d1c1.setAddress("1217 Sulu Street Santa Cruz, Manila");
		d1c1.setHospital("St. Luke's Medical Center");
		d1c1.setAddress("Rizal Drive corner 32nd Street, Bonifactio Global City, Taguig, Metro Manila");
		d1c1.setSchedules(dsList);
		d1c1.setContact("(02) 735.14.14");
		List<DoctorClinic> d1Clinics = new ArrayList<DoctorClinic>();
		d1Clinics.add(d1c1);
		d1.setClinics(d1Clinics);
		DoctorSpecialization d1s1 = new DoctorSpecialization();
		d1s1.setSpecialization("Deramthology");
		List<DoctorSpecialization> d1Sps = new ArrayList<DoctorSpecialization>();
		d1Sps.add(d1s1);
		d1.setSpecializatons(d1Sps);

		doctors.add(d1);

		DoctorEntity d2 = new DoctorEntity();
		d2.setId(1);
		d2.setFirstName("Juana");
		d2.setLastName("Dela Cruz");
		d2.setSelfDescription("Over 10 years of experience in blah.... Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur condimentum est et ante aliquet, rhoncus bibendum sem dictum. Duis maximus id nibh eget efficitur. Curabitur laoreet, ex sed dapibus ultricies, ex tellus vestibulum odio, quis euismod arcu ex fermentum metus. Donec aliquet pharetra tincidunt. Morbi et lorem enim. Quisque dui velit, sagittis sed sodales ut, tincidunt nec mi. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Fusce eget ex sagittis, ullamcorper ligula quis, aliquam velit. Praesent tempor pellentesque ante a euismod. Suspendisse lacinia ex quis rhoncus tempus. Sed venenatis consectetur ipsum vel eleifend. Morbi risus metus, sollicitudin id ipsum non, porta lacinia nibh.");
		d2.setTotalYears(11);
		DoctorClinic d2c1 = new DoctorClinic();
		d2c1.setAddress("Unit 1K Burbank Tower 3, California Garden Square, Baranggay Highway Hills, Mandaluyong City");
		d2c1.setHospital("St. Luke's Medical Center");
		d2c1.setAddress("Rizal Drive corner 32nd Street, Bonifactio Global City, Taguig, Metro Manila");
		d2c1.setSchedules(dsList);
		d2c1.setContact("(02) 735.14.14");
		List<DoctorClinic> d2Clinics = new ArrayList<DoctorClinic>();
		d2Clinics.add(d2c1);
		d1c1.setSchedules(dsList);
		d2.setClinics(d2Clinics);
		DoctorSpecialization d2s1 = new DoctorSpecialization();
		d2s1.setSpecialization("Deramthology");
		List<DoctorSpecialization> d2Sps = new ArrayList<DoctorSpecialization>();
		d2Sps.add(d2s1);
		d2.setSpecializatons(d2Sps);
		doctors.add(d2);

		DoctorEntity d3 = new DoctorEntity();
		d3.setId(2);
		d3.setFirstName("Juano");
		d3.setLastName("Dela Cruz");
		d3.setSelfDescription("Over 10 years of experience in blah.... Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur condimentum est et ante aliquet, rhoncus bibendum sem dictum. Duis maximus id nibh eget efficitur. Curabitur laoreet, ex sed dapibus ultricies, ex tellus vestibulum odio, quis euismod arcu ex fermentum metus. Donec aliquet pharetra tincidunt. Morbi et lorem enim. Quisque dui velit, sagittis sed sodales ut, tincidunt nec mi. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Fusce eget ex sagittis, ullamcorper ligula quis, aliquam velit. Praesent tempor pellentesque ante a euismod. Suspendisse lacinia ex quis rhoncus tempus. Sed venenatis consectetur ipsum vel eleifend. Morbi risus metus, sollicitudin id ipsum non, porta lacinia nibh.");
		d3.setTotalYears(11);
		DoctorClinic d3c1 = new DoctorClinic();
		d3c1.setAddress("1217 Sulu Street Santa Cruz, Manila");
		d3c1.setHospital("St. Luke's Medical Center");
		d3c1.setAddress("Rizal Drive corner 32nd Street, Bonifactio Global City, Taguig, Metro Manila");
		d3c1.setSchedules(dsList);
		d3c1.setContact("(02) 735.14.14");
		List<DoctorClinic> d3Clinics = new ArrayList<DoctorClinic>();
		d3Clinics.add(d3c1);
		d3.setClinics(d3Clinics);
		DoctorSpecialization d3s1 = new DoctorSpecialization();
		d3s1.setSpecialization("Deramthology");
		List<DoctorSpecialization> d3Sps = new ArrayList<DoctorSpecialization>();
		d3Sps.add(d3s1);
		d3.setSpecializatons(d3Sps);
		doctors.add(d3);

		DoctorEntity d4 = new DoctorEntity();
		d4.setId(3);
		d4.setFirstName("John");
		d4.setLastName("Cruise");
		d4.setSelfDescription("Over 10 years of experience in blah.... Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur condimentum est et ante aliquet, rhoncus bibendum sem dictum. Duis maximus id nibh eget efficitur. Curabitur laoreet, ex sed dapibus ultricies, ex tellus vestibulum odio, quis euismod arcu ex fermentum metus. Donec aliquet pharetra tincidunt. Morbi et lorem enim. Quisque dui velit, sagittis sed sodales ut, tincidunt nec mi. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Fusce eget ex sagittis, ullamcorper ligula quis, aliquam velit. Praesent tempor pellentesque ante a euismod. Suspendisse lacinia ex quis rhoncus tempus. Sed venenatis consectetur ipsum vel eleifend. Morbi risus metus, sollicitudin id ipsum non, porta lacinia nibh.");
		d4.setTotalYears(11);
		DoctorClinic d4c1 = new DoctorClinic();
		d4c1.setAddress("Unit 1K Burbank Tower 3, California Garden Square, Baranggay Highway Hills, Mandaluyong City");
		d4c1.setHospital("St. Luke's Medical Center");
		d4c1.setAddress("Rizal Drive corner 32nd Street, Bonifactio Global City, Taguig, Metro Manila");
		d4c1.setSchedules(dsList);
		d4c1.setContact("(02) 735.14.14");
		List<DoctorClinic> d4Clinics = new ArrayList<DoctorClinic>();
		d4Clinics.add(d4c1);
		d4.setClinics(d4Clinics);
		DoctorSpecialization d4s1 = new DoctorSpecialization();
		d4s1.setSpecialization("Deramthology");
		List<DoctorSpecialization> d4Sps = new ArrayList<DoctorSpecialization>();
		d4Sps.add(d4s1);
		d4.setSpecializatons(d4Sps);
		doctors.add(d4);

		return doctors;
	}

}