package com.vaccination.controllers;

import java.util.List;
import java.util.Optional;

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
public class VaccinationCentersController {

	@Autowired
	VaccinationCentersRepo vcRepository;
	
	@Autowired
	CitizensRepository citizensReposotory;

	@GetMapping("displayAllCenters")
	public String displayVC(Model model) {

		List<VaccinationCenters> vcs = vcRepository.findAll();
		model.addAttribute("vcs", vcs);
		return "vaccinationcenter";
	}

	@GetMapping("AddVCform")
	public String addVCform() {
		return "addVaccinationCenterForm";
	}

	@PostMapping("AddVC")
	public String addVC(@RequestParam("centerCity") String centerCity, @RequestParam("centerName") String centerName) {
		VaccinationCenters vc = new VaccinationCenters();
		vc.setName(centerName);
		vc.setCity(centerCity);
		vcRepository.save(vc);
		return "redirect:/displayAllCenters";
	}

	@GetMapping("editcenter")
	public String editVCform(@RequestParam("id") Long id, Model model) {

		Optional<VaccinationCenters> vaccinationCenter = vcRepository.findById(id);
		VaccinationCenters vaccinationcenter = vaccinationCenter.get();
		model.addAttribute("vc", vaccinationcenter);
		return "editvaccinationcenter"; // go to edit-product.jsp
	}

	@PostMapping("/editcenter")
	public String updateVaccinationCenter(@ModelAttribute("vc") VaccinationCenters updatedCenter, @RequestParam("id") Long id) {
	    Optional<VaccinationCenters> optionalCenter = vcRepository.findById(id);
	    if (optionalCenter.isPresent()) {
	        VaccinationCenters existingCenter = optionalCenter.get();
	        existingCenter.setName(updatedCenter.getName());
	        existingCenter.setCity(updatedCenter.getCity());
	        vcRepository.save(existingCenter);
	    }
	    return "redirect:/displayAllCenters";
	}
	
	@PostMapping("/deleteCenter")
	public String deleteVaccinationCenter(@RequestParam("id") Long id) {
	    vcRepository.deleteById(id);
	    return "redirect:/displayAllCenters";
	}
	@GetMapping("/viewVaccinationCenterInfo")
	public String viewVCInfo(@RequestParam("id") Long id, Model model) {
		Optional<VaccinationCenters> vaccinationCenter = vcRepository.findById(id);
		VaccinationCenters vaccinationcenter = vaccinationCenter.get();
		List<Citizens> citizensList = citizensReposotory.findByVaccinationCentersId(id);
		model.addAttribute("vaccinationcenter", vaccinationcenter);
		model.addAttribute("citizensList", citizensList);
		
		return "viewVaccinationCenter";
		
	}
}
