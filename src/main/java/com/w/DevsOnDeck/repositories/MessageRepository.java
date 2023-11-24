package com.w.DevsOnDeck.repositories;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.w.DevsOnDeck.models.Developer;
import com.w.DevsOnDeck.models.Message;


public interface MessageRepository extends CrudRepository<Message, Long> {

    List<Message> findByReceiver(Developer receiver);
    List<Message> findAll();

  
}
