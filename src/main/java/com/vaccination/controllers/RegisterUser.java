package com.vaccination.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.vaccination.entities.UserCredentials;
import com.vaccination.repositories.UserRepository;

@Controller
public class RegisterUser {

	@Autowired
	UserRepository userRepository;

	@GetMapping("/registerUser")
	public String registerForm() {
		return "registration";
	}
	@PostMapping("/registerUser")
	public String registerUser(@RequestParam("name") String name,@RequestParam("email") String email, 
			@RequestParam("password") String password) {
		
		UserCredentials user = new UserCredentials();
		user.setName(name);
		user.setEmail(email);
		user.setPassword(password);
		
		userRepository.save(user);
		return "index";
		
	}
	
}
