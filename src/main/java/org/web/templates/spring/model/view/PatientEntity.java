package org.web.templates.spring.model.view;

import java.util.Date;

public class PatientEntity {
	private int id;
	private String firstName;
	private String lastName;
	private Date dateOfBirth;
	private int heightInCentimeters;
	private Double weightInKilograms;

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

	public Date getDateOfBirth() {
		return dateOfBirth;
	}

	public void setDateOfBirth(Date dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}

	public int getHeightInCentimeters() {
		return heightInCentimeters;
	}

	public void setHeightInCentimeters(int heightInCentimeters) {
		this.heightInCentimeters = heightInCentimeters;
	}

	public Double getWeightInKilograms() {
		return weightInKilograms;
	}

	public void setWeightInKilograms(Double weightInKilograms) {
		this.weightInKilograms = weightInKilograms;
	}

}
