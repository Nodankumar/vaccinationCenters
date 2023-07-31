package com.vaccination.controllers;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.vaccination.entities.Citizens;
import com.vaccination.entities.VaccinationCenters;
import com.vaccination.repositories.CitizensRepository;
import com.vaccination.repositories.VaccinationCentersRepo;

@Controller
public class CitizensController {

	@Autowired
	CitizensRepository citizensRepository;
	@Autowired
	VaccinationCentersRepo vcRepo;

	@GetMapping("/displayCitizens")
	public String displayCitizens(Model model) {

		List<Citizens> citizensList = citizensRepository.findAll();
		model.addAttribute("citizens", citizensList);
		return "citizens";
	}

	@GetMapping("/addCitizen")
	public String addCitizenForm(Model model) {
		List<String> centerNames = vcRepo.findDistinctCenterNames();
		List<String> cityNames = vcRepo.findDistinctCityNames();
		model.addAttribute("centerNames", centerNames);
		model.addAttribute("cityNames", cityNames);
		model.addAttribute("citizen", new Citizens());
		return "addCitizenForm";
	}

	@PostMapping("/addCitizen")
	public String addCitizenSubmit(@ModelAttribute("citizen") Citizens citizen,
			@RequestParam("vaccinationCenters.name") String centerName) {
		// Retrieve the VaccinationCenters object based on the centerName
		VaccinationCenters vaccinationCenter = vcRepo.findByName(centerName);

		// Set the VaccinationCenters object for the citizen
		citizen.setVaccinationCenters(vaccinationCenter);
		// setting vaccination status
		if (citizen.getNoOfDoses() == 2) {
			citizen.setVaccinationStatus("Fully Vaccinated");
		} else {
			citizen.setVaccinationStatus("Not Vaccinated");
		}
		// Handle the form submission and save the citizen
		citizensRepository.save(citizen);

		return "redirect:/displayCitizens";
	}

	@GetMapping("/editCitizenform")
	public String editCitizen(@RequestParam("id") Long id, Model model) {
		Optional<Citizens> citizenRepo = citizensRepository.findById(id);
		Citizens citizen = citizenRepo.get();
		model.addAttribute("citizen", citizen);

		List<String> cityNames = vcRepo.findDistinctCityNames();
		model.addAttribute("citynames", cityNames);
		List<String> centerNames = vcRepo.findDistinctCenterNames();
		model.addAttribute("centerNames", centerNames);

		return "editCitizen";
	}

	@PostMapping("/updateCitizen")
	public String updateCitizen(@ModelAttribute("citizen") Citizens updatedCitizen, @RequestParam("id") Long citizenId,
			@RequestParam("vaccinationCentersId") Long vaccinationCentersId) {
		// Retrieve the existing citizen using the citizenId
		Optional<Citizens> existingCitizenOptional = citizensRepository.findById(citizenId);
		Citizens existingCitizen = existingCitizenOptional.orElseThrow();

		// Retrieve the VaccinationCenters entity using the vaccinationCentersId
		Optional<VaccinationCenters> vaccinationCenterOptional = vcRepo.findById(vaccinationCentersId);
		VaccinationCenters vaccinationCenter = vaccinationCenterOptional.orElseThrow();

		// Update the existing citizen with the new values
		existingCitizen.setcName(updatedCitizen.getcName());
		existingCitizen.setNoOfDoses(updatedCitizen.getNoOfDoses());
		existingCitizen.getVaccinationCenters().setName(updatedCitizen.getVaccinationCenters().getName());
		existingCitizen.getVaccinationCenters().setCity(updatedCitizen.getVaccinationCenters().getCity());
		// setting vaccination status
		if (existingCitizen.getNoOfDoses() == 2) {
			existingCitizen.setVaccinationStatus("Fully Vaccinated");
		} else {
			existingCitizen.setVaccinationStatus("Not Vaccinated");
		}
		// Set the updated VaccinationCenters entity
		existingCitizen.setVaccinationCenters(vaccinationCenter);

		// Save the updated citizen
		citizensRepository.save(existingCitizen);

		return "redirect:/displayCitizens";
	}

	@GetMapping("/viewCitizenInfo")
	public String viewCitizenInfo(@RequestParam("id") Long id, Model model) {
		Optional<Citizens> citizenOpt = citizensRepository.findById(id);
		Citizens citizen = citizenOpt.get();
		model.addAttribute("citizen", citizen);
		return "viewCitizen";

	}

	@GetMapping("/deleteCitizen")
	public String deleteCitizen(@RequestParam("id") Long id) {
		citizensRepository.deleteById(id);
		return "redirect:/displayCitizens";
	}

}
