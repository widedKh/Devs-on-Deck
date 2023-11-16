package com.w.DevsOnDeck.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.w.DevsOnDeck.models.Skill;
import com.w.DevsOnDeck.repositories.SkillRepository;

@Service
public class SkillService {
	@Autowired
	SkillRepository skillRepository;

	// READ ALL
	public List<Skill> allPosition() {
		return skillRepository.findAll();
	}

	// add Skill
	public Skill createSkill(Skill s) {
		return skillRepository.save(s);
	}

	// READ ONE
	public Skill findSkill(Long id) {
		Optional<Skill> skill = skillRepository.findById(id);
		if (skill.isPresent()) {
			return skill.get();
		} else {
			return null;
		}
	}

	// edit a Skill
	public Skill updateSkill(Skill s) {
		return skillRepository.save(s);
	}

	// delete a Skill
	public void deleteSkill(Long id) {
		skillRepository.deleteById(id);
	}

}
