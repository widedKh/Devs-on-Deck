package com.w.DevsOnDeck.services;

import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.w.DevsOnDeck.models.LoginOrg;
import com.w.DevsOnDeck.models.Organization;
import com.w.DevsOnDeck.repositories.OrgRepository;

@Service
public class OrgService {

	@Autowired
	OrgRepository orgRepository;

	public Organization register(Organization newOrg, BindingResult result) {
		// Additional validations!
		Optional<Organization> potentialUser = orgRepository.findByEmail(newOrg.getEmail());
		if (potentialUser.isPresent()) {
			result.rejectValue("email", "registerError", "Email is taken!");
		}
		if (!newOrg.getPassword().equals(newOrg.getConfirm())) {
			result.rejectValue("password", "registerError", "Password does not match!");
		}
		if (result.hasErrors()) {
			return null;
		} else {
			String hashdPW = BCrypt.hashpw(newOrg.getPassword(), BCrypt.gensalt());
			newOrg.setPassword(hashdPW);
			return orgRepository.save(newOrg);
		}

	}

	//login
	public Organization login(LoginOrg newLoginObject, BindingResult result) {
		// Additional validations!
		Optional<Organization> potentialUser = orgRepository.findByEmail(newLoginObject.getEmail());
		if (!potentialUser.isPresent()) {
			result.rejectValue("email", "loginErrors", "Email is not found");
		} else {
			Organization org = potentialUser.get();
			// Check password
			if (!BCrypt.checkpw(newLoginObject.getPassword(), org.getPassword())) {
				result.rejectValue("password", "loginErrors", "Invalid Password");
			}
			if (result.hasErrors()) {
				return null;
			} else {
				return org;
			}
		}
		return null;
	}

	// READ ONE 
	public Organization findOrg(Long id) {
		Optional<Organization> org = orgRepository.findById(id);
		if (org.isPresent()) {
			return org.get();
		} else {
			return null;
		}
	}

}
