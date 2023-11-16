package com.w.DevsOnDeck.repositories;

import java.util.List;
import java.util.Optional;

import com.w.DevsOnDeck.models.Organization;

import org.springframework.data.repository.CrudRepository;

public interface OrgRepository extends CrudRepository<Organization, Long> {
	Optional<Organization> findByEmail(String email);

	List<Organization> findAll();

}
