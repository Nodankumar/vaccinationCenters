package com.vaccination.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.vaccination.entities.VaccinationCenters;

@Repository
public interface VaccinationCentersRepo extends JpaRepository<VaccinationCenters, Long> {

	@Query("SELECT DISTINCT vc.name FROM VaccinationCenters vc")
	List<String> findDistinctCenterNames();

	@Query("SELECT DISTINCT vc.city FROM VaccinationCenters vc")
	List<String> findDistinctCityNames();

	VaccinationCenters findByName(String name);

}
