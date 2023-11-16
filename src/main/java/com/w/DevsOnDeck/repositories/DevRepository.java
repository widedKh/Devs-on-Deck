package com.w.DevsOnDeck.repositories;

import java.util.List;
import java.util.Optional;

import com.w.DevsOnDeck.models.Developer;
import org.springframework.data.repository.CrudRepository;

public interface DevRepository extends CrudRepository<Developer, Long> {
	Optional<Developer> findByEmail(String email);

	List<Developer> findAll();

}
