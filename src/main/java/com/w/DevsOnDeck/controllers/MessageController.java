package com.w.DevsOnDeck.controllers;


import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.w.DevsOnDeck.models.Developer;
import com.w.DevsOnDeck.models.Message;
import com.w.DevsOnDeck.models.Organization;
import com.w.DevsOnDeck.services.DevService;
import com.w.DevsOnDeck.services.MessageService;
import com.w.DevsOnDeck.services.OrgService;

@Controller
@RequestMapping("/messages")
public class MessageController {

    @Autowired
    private MessageService messageService;
    
    @Autowired
    private DevService devService;
    
    @Autowired
    OrgService orgService;
    @PostMapping("/send")
    public String sendMessage(
            @Valid @ModelAttribute("message") Message message,
            @RequestParam Long developerId,
            @RequestParam String content,
            HttpSession session,
            BindingResult result) {

        Long userId = (Long) session.getAttribute("organization_id");

        if (userId == null) {
            return "redirect:/orgs/login";
        }

        if (result.hasErrors()) {
            return "showPosition.jsp";
        } else {
            // Find the organization using the ID
            Organization org = orgService.findOrg(userId);

            // Find the developer using the ID
            Developer receiver = devService.findDev(developerId);

            // Set the sender, receiver, and content for the message
            message.setSender(org);
            message.setReceiver(receiver);
            message.setContent(content);

            // Call the service method to send the message
            messageService.sendMessage(org, receiver, content);

            return "redirect:/orgs/dashboard";
        }
    }





 @GetMapping("/receiver/{developerId}")
public String messagesList(
        @ModelAttribute("message") Message message,
        Model model,
        HttpSession session) {
    Long userId = (Long) session.getAttribute("dev_id");

    if (userId == null) {
        return "redirect:/devs/login";
    } else {
        Developer dev = devService.findDev(userId);
        List<Message> messages = messageService.getMessagesByReceiver(dev);

        model.addAttribute("messages", messages);
        model.addAttribute("developer", dev);

        return "messages.jsp";
    }
}

}
