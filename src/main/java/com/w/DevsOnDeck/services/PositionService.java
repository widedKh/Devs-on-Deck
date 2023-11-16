package com.w.DevsOnDeck.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.w.DevsOnDeck.models.Position;
import com.w.DevsOnDeck.repositories.PositionRepository;

@Service
public class PositionService {
	@Autowired
	PositionRepository positionRepository;

	// READ ALL
	public List<Position> allPositions() {
		return positionRepository.findAll();
	}

	// create a new Position
	public Position createPosition(Position p) {
		return positionRepository.save(p);
	}

	// READ ONE
	public Position findPosition(Long id) {
		Optional<Position> position = positionRepository.findById(id);
		if (position.isPresent()) {
			return position.get();
		} else {
			return null;
		}
	}

	// edit a Position
	public Position updatePosition(Position p) {
		return positionRepository.save(p);
	}

	// delete a position
	public void deletePosition(Long id) {
		positionRepository.deleteById(id);
	}

}
