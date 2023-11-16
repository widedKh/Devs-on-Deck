package com.w.DevsOnDeck.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.w.DevsOnDeck.models.Skill;

public interface SkillRepository extends CrudRepository<Skill, Long> {
	List<Skill> findAll();

}
