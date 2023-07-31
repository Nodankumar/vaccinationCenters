package com.vaccination.entities;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;

@Entity
public class Citizens{

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	@Column(name = "c_name")
	private String cName;
	@Column(name = "no_of_doses")
	private int noOfDoses=0;
	@Column(name = "vaccination_status")
	private String vaccinationStatus;
	
	@ManyToOne
	@JoinColumn(name = "vaccination_centers_id")
	private VaccinationCenters vaccinationCenters;

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	
	public String getcName() {
		return cName;
	}

	public void setcName(String cName) {
		this.cName = cName;
	}

	public int getNoOfDoses() {
		return noOfDoses;
	}

	public void setNoOfDoses(int noOfDoses) {
		this.noOfDoses = noOfDoses;
	}

	public String getVaccinationStatus() {
		return vaccinationStatus;
	}

	public void setVaccinationStatus(String vaccinationStatus) {
		this.vaccinationStatus = vaccinationStatus;
	}

	public VaccinationCenters getVaccinationCenters() {
		return vaccinationCenters;
	}

	public void setVaccinationCenters(VaccinationCenters vaccinationCenters) {
		this.vaccinationCenters = vaccinationCenters;
	}
	
	
}
