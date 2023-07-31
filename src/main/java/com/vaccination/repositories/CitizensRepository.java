package com.vaccination.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.vaccination.entities.Citizens;
import java.util.List;


@Repository
public interface CitizensRepository extends JpaRepository<Citizens, Long>{
	List<Citizens> findByVaccinationCentersId(Long vaccinationCentersId);
}
