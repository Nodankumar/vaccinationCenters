package com.vaccination.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.vaccination.entities.UserCredentials;
import com.vaccination.repositories.UserRepository;

@Controller
public class UserController {

	@Autowired
	UserRepository userRepository;
	
	@GetMapping("/")
	public String loginform() {
		return "index";	
	}
	
	@PostMapping("/login")
	public String loginCheck(@RequestParam("email") String email, @RequestParam("password") String password) {
		boolean userFound = false;
		if(email.isBlank()||email.isEmpty()||password.isBlank()||password.isEmpty()) {
			return "index";
		}else {
			List<UserCredentials> users = userRepository.findAll();
			for(UserCredentials user: users) {
				if(email.contentEquals(user.getEmail()) && password.contentEquals(user.getPassword())) {
					userFound = true;
					return "redirect:/displayAllCenters";
				}
			}
		}if(!userFound)return "registration";
		return "in testing";
	}
}
