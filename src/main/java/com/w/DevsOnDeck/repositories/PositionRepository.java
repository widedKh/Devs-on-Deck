package com.w.DevsOnDeck.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.w.DevsOnDeck.models.Position;

public interface PositionRepository extends CrudRepository<Position, Long> {
	List<Position> findAll();

}
