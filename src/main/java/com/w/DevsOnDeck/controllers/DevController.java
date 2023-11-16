package com.w.DevsOnDeck.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.w.DevsOnDeck.models.Developer;
import com.w.DevsOnDeck.models.LoginDev;
import com.w.DevsOnDeck.services.DevService;

@Controller
public class DevController {

	// Add once service is implemented:
    @Autowired
    private DevService devService;
    
    
   //display register page 
   @GetMapping("/devs/register")
   public String DevIndex(Model model) {

       model.addAttribute("newUser", new Developer());
       return "devIndex.jsp";
   }
   //register a user
   @PostMapping("/devs/register")
   public String register(@Valid @ModelAttribute("newDev") Developer newDev, 
           BindingResult result, Model model, HttpSession session) {
         	devService.register(newDev, result);
       
       if(result.hasErrors()) {
           model.addAttribute("newLogin", new LoginDev());
           return "devIndex.jsp";
       }
       
       else {
       	session.setAttribute("dev_id", newDev.getId());
       }
   
       return "redirect:/skills/languages";
   }
   
   //display the login form
   @GetMapping("/devs/login")
   public String devLogin (Model model) {

       model.addAttribute("newLogin", new LoginDev());
       return "devLogin.jsp";
   }
   
   //log in
   @PostMapping("/devs/login")
   public String login(@Valid @ModelAttribute("newLogin") LoginDev newLogin, 
           BindingResult result, Model model, HttpSession session) {
	   Developer dev= devService.login(newLogin, result);
   
       if(result.hasErrors()) {
           model.addAttribute("newDev", new Developer());
           return "devLogin.jsp";
       }

       else {
       	session.setAttribute("dev_id", dev.getId());
       }
       return "redirect:/skills/languages";
   }
   
   //log out
   @GetMapping("/devLogout")
   public String logout(HttpSession session) {
	   session.invalidate();
  	 return "redirect:/";
   }

   
}