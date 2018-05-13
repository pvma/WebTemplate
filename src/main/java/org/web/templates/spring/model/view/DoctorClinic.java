package org.web.templates.spring.model.view;

import java.util.List;

public class DoctorClinic {
	private int id;
	private String address;
	private String hospital;
	private List<DoctorSchedule> schedules;
	private String contact;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getHospital() {
		return hospital;
	}

	public void setHospital(String hospital) {
		this.hospital = hospital;
	}

	public List<DoctorSchedule> getSchedules() {
		return schedules;
	}

	public void setSchedules(List<DoctorSchedule> schedules) {
		this.schedules = schedules;
	}

	public String getContact() {
		return contact;
	}

	public void setContact(String contact) {
		this.contact = contact;
	}
}
