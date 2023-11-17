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

import com.w.DevsOnDeck.models.LoginOrg;
import com.w.DevsOnDeck.models.Organization;
import com.w.DevsOnDeck.services.OrgService;



@Controller
public class OrgController {

	// Add once service is implemented:
    @Autowired
    private OrgService orgService;
    
    
   //display register page 
   @GetMapping("/orgs/register")
   public String orgIndex(Model model) {

       model.addAttribute("newOrg", new Organization());
       return "orgIndex.jsp";
   }
   //register 
   @PostMapping("/orgs/register")
   public String register(@Valid @ModelAttribute("newOrg") Organization newOrg, 
           BindingResult result, Model model, HttpSession session) {
         	orgService.register(newOrg, result);
       
       if(result.hasErrors()) {
           model.addAttribute("newLogin", new LoginOrg());
           return "orgIndex.jsp";
       }
       
       else {
       	session.setAttribute("org_id", newOrg.getId());
       }
   
       return "redirect:/orgs/dashboard";
   }
   
   
   @GetMapping("/orgs/login")
   public String orgLogin(Model model) {

       model.addAttribute("newLogin", new LoginOrg());
       return "orgLogin.jsp";
   }
   
   //log in
   @PostMapping("/orgs/login")
   public String login(@Valid @ModelAttribute("newLogin") LoginOrg newLogin, 
           BindingResult result, Model model, HttpSession session) {
	   Organization org= orgService.login(newLogin, result);
   
       if(result.hasErrors()) {
           model.addAttribute("newOrg", new Organization());
           return "OrgLogin.jsp";
       }

       else {
       	session.setAttribute("org_id", org.getId());
       }
       return "redirect:/orgs/dashboard";
   }
   
   //log out
   @GetMapping("/OrgLogout")
   public String logout(HttpSession session) {
	   session.invalidate();
  	 return "redirect:/";
   }

   
}