package com.vaccination.entities;

import java.util.List;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;

@Entity
public class VaccinationCenters {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	private String name;
	private String city;
	
	@OneToMany(mappedBy = "vaccinationCenters", cascade = CascadeType.ALL, orphanRemoval = true)
	private List<Citizens> citizens;

	public List<Citizens> getCitizens() {
		return citizens;
	}

	public void setCitizens(List<Citizens> citizens) {
		this.citizens = citizens;
	}

	public Long getId() {
		return id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

}
