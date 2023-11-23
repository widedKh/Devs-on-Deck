package com.w.DevsOnDeck.services;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.w.DevsOnDeck.models.Developer;
import com.w.DevsOnDeck.models.LoginDev;
import com.w.DevsOnDeck.repositories.DevRepository;


@Service
public class DevService {

	@Autowired
	DevRepository devRepository;

	// Register
	public Developer register(Developer newDev, BindingResult result) {
		// Additional validations!
		Optional<Developer> potentialUser = devRepository.findByEmail(newDev.getEmail());
		if (potentialUser.isPresent()) {
			result.rejectValue("email", "registerError", "Email is taken!");
		}
		if (!newDev.getPassword().equals(newDev.getConfirm())) {
			result.rejectValue("password", "registerError", "Password does not match!");
		}
		if (result.hasErrors()) {
			return null;
		} else {
			String hashdPW = BCrypt.hashpw(newDev.getPassword(), BCrypt.gensalt());
			newDev.setPassword(hashdPW);
			return devRepository.save(newDev);
		}

	}

	// login
	public Developer login(LoginDev newLoginObject, BindingResult result) {
		// Additional validations!
		Optional<Developer> potentialUser = devRepository.findByEmail(newLoginObject.getEmail());
		if (!potentialUser.isPresent()) {
			result.rejectValue("email", "loginErrors", "Email is not found");
		} else {
			Developer dev = potentialUser.get();
			// Check password
			if (!BCrypt.checkpw(newLoginObject.getPassword(), dev.getPassword())) {
				result.rejectValue("password", "loginErrors", "Invalid Password");
			}
			if (result.hasErrors()) {
				return null;
			} else {
				return dev;
			}
		}
		return null;
	}

	// READ ALL
	public List<Developer> allDevelopers() {
		return devRepository.findAll();
	}

	// READ ONE
	public Developer findDev(Long id) {
		Optional<Developer> dev = devRepository.findById(id);
		if (dev.isPresent()) {
			return dev.get();
		} else {
			return null;
		}
	}
	
	public Developer updateDev(Developer dev) {

		return devRepository.save(dev);
	}
	
	// get developers by skills
	public List<Developer> getDevelopersBySkills(List<String> requiredSkills) {
	    List<Developer> allDevelopers = devRepository.findAll();

	    // Filter developers based on matching languages or frameworks
	    return allDevelopers.stream()
	        .filter(dev -> dev.getLanguages().stream().anyMatch(requiredSkills::contains)
	                        || dev.getFrameworks().stream().anyMatch(requiredSkills::contains))
	        .collect(Collectors.toList());
	}

}