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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;

import com.w.DevsOnDeck.models.Organization;
import com.w.DevsOnDeck.models.Position;
import com.w.DevsOnDeck.services.OrgService;
import com.w.DevsOnDeck.services.PositionService;



@Controller
public class PositionController {
	
	@Autowired
	PositionService positionService;
	
	
	@Autowired
	OrgService orgService;
	
	// ------ READ ALL
	@GetMapping("/orgs/dashboard")
	public String positionsList(@ModelAttribute("position") Position position, Model model, HttpSession session) {
	    Long userId = (Long) session.getAttribute("organization_id");
	    if (userId == null) {
	        return "redirect:/";
	    } else {
	        Organization orgs = orgService.findOrg(userId);
	        List<Position> positions = positionService.allPositions();
	        model.addAttribute("org",orgs );
	        model.addAttribute("positions",positions);
	        return "dashboard.jsp";
	    }
	}

	
   //display form
    @GetMapping("/orgs/job/new")
	public String addPosition(@ModelAttribute("position") Position position, Model model) {
		return "addPosition.jsp";
	}
	
    
    //add a new position

    @PostMapping("/orgs/job/new")
    public String createTeam(@Valid @ModelAttribute("position") Position position, BindingResult result, HttpSession session) {
        Long userId = (Long) session.getAttribute("organization_id");

        if (userId == null) {
            return "redirect:/"; 
        }

        if (result.hasErrors()) {
            return "addPosition.jsp";
        } else {
           Organization org = orgService.findOrg(userId);
            position.setOrganization(org);
            positionService.createPosition(position);
            return "redirect:/orgs/dashboard";
        }
    }

    
    //display one team
    @GetMapping("/orgs/job/{id}")
    public String showPosition(@PathVariable("id") Long id, Model model,HttpSession session) {
    	 Long userId = (Long) session.getAttribute("organization_id");
    	 if(userId == null) {
			 return "redirect:/";
		 }
    	else {
         	Organization org = orgService.findOrg(userId);
    		Position position = positionService.findPosition(id);
        	model.addAttribute("position", position);
        	model.addAttribute("org",org);
        	
    	 return "showPosition.jsp";
	}
    } 
    
  //edit a position
    @GetMapping("/orgs/{id}/edit")
    public String editPosition(Model model, @PathVariable("id") Long id, HttpSession session) {
    	 Long userId = (Long) session.getAttribute("organization_id");
    	if(userId == null) {
    		return "redirect:/orgs/login";
    	}
    	Position position = positionService.findPosition(id);
    	model.addAttribute("position", position);
    	model.addAttribute("org", orgService.findOrg(userId));
    	
    	return "editPosition.jsp";
    }
    
    @PutMapping("/orgs/{id}/edit")
    public String updatePosition(Model model, @Valid @ModelAttribute("position") Position position, BindingResult result, HttpSession session) {
    	 Long userId = (Long) session.getAttribute("user_id");
    	if(userId == null) {
    		return "redirect:/orgs/login";
    	}
    	
    	if(result.hasErrors()) {
    		return "editPosition.jsp";
    	}
    	Organization org = orgService.findOrg(userId);
    	position.setOrganization(org);
    	positionService.updatePosition(position);
    	
    	return "redirect:/orgs/dashboard";
    }




    //delete a team 
    @GetMapping("/orgs/delete/{id}")
    public String removePosition(@PathVariable("id") Long id, HttpSession session) {
        Long userId = (Long) session.getAttribute("organization_id");
        if (userId == null) {
            return "redirect:/";
        }
        else {
            positionService.deletePosition(id);
        return "redirect:/orgs/dashboard";
    }
    }
    

    }

