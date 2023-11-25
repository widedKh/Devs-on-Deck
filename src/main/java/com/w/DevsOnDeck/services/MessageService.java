package com.w.DevsOnDeck.services;


import java.util.Date;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.w.DevsOnDeck.models.Developer;
import com.w.DevsOnDeck.models.Message;
import com.w.DevsOnDeck.models.Organization;
import com.w.DevsOnDeck.repositories.MessageRepository;

@Service
public class MessageService {

    @Autowired
    private MessageRepository messageRepository;

  
    
 // send a message
    public void sendMessage(Organization sender, Developer receiver, String content) {
        Message message = new Message();
        message.setSender(sender);
        message.setReceiver(receiver);
        message.setContent(content);

        message.setSentAt(new Date());

        messageRepository.save(message);
    }


    public List<Message> getMessagesByReceiver(Developer receiver) {
        return messageRepository.findByReceiver(receiver);
    }
    
    public List<Message> getMessagesByReceiverOrderBySender(Developer receiver) {
        return messageRepository.findByReceiver(receiver);
    }
    
    public long getNumberOfMessagesForReceiver(Developer receiver) {
        return messageRepository.countByReceiver(receiver);
    }
    
    public List<String> getMessageContentsByReceiverId(Long receiverId) {
        // Implement the logic to fetch message contents by receiver ID
        // For example, you can use the repository to find messages by receiver ID
        List<Message> messages = messageRepository.findByReceiverId(receiverId);

        // Extract content from messages
        return messages.stream()
                .map(Message::getContent)
                .collect(Collectors.toList());
    }
    

}