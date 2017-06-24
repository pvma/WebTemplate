package com.sourcebrewer.hoegarden.dsams.model.view;

import java.util.List;

public class DoctorEntity {
	private int id;
	private String firstName;
	private String lastName;
	private String selfDescription;
	private int totalYears;
	private List<DoctorSpecialization> specializatons;
	private List<DoctorClinic> clinics;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getSelfDescription() {
		return selfDescription;
	}

	public void setSelfDescription(String selfDescription) {
		this.selfDescription = selfDescription;
	}

	public int getTotalYears() {
		return totalYears;
	}

	public void setTotalYears(int totalYears) {
		this.totalYears = totalYears;
	}

	public List<DoctorSpecialization> getSpecializatons() {
		return specializatons;
	}

	public void setSpecializatons(List<DoctorSpecialization> specializatons) {
		this.specializatons = specializatons;
	}

	public List<DoctorClinic> getClinics() {
		return clinics;
	}

	public void setClinics(List<DoctorClinic> clinics) {
		this.clinics = clinics;
	}
}
