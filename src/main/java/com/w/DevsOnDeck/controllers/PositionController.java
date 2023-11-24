package com.w.DevsOnDeck.controllers;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.Objects;
import java.util.stream.Collectors;
import java.util.stream.Stream;

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

import com.w.DevsOnDeck.models.Developer;
import com.w.DevsOnDeck.models.DeveloperMatch;
import com.w.DevsOnDeck.models.Organization;
import com.w.DevsOnDeck.models.Position;
import com.w.DevsOnDeck.services.DevService;
import com.w.DevsOnDeck.services.OrgService;
import com.w.DevsOnDeck.services.PositionService;

@Controller
public class PositionController {

    @Autowired
    PositionService positionService;

    @Autowired
    OrgService orgService;
    
    @Autowired
    DevService devService;

 // ------ READ ALL
    @GetMapping("/orgs/dashboard")
    public String positionsList(@ModelAttribute("position") Position position, Model model, HttpSession session) {
        Long userId = (Long) session.getAttribute("organization_id");
        if (userId == null) {
            return "redirect:/";
        } else {
            Organization orgs = orgService.findOrg(userId);
            List<Position> positions = positionService.allPositions();
            List<Developer> developers = devService.allDevelopers(); 

            List<List<String>> allLanguages = new ArrayList<>();
            List<List<String>> allFrameworks = new ArrayList<>();
            for (Developer developer : developers) {
                allLanguages.add(developer.getLanguages());
                allFrameworks.add(developer.getFrameworks());
            }

            model.addAttribute("allLanguages", allLanguages);
            model.addAttribute("allFrameworks", allFrameworks);
            model.addAttribute("developers", developers);
            model.addAttribute("org", orgs);
            model.addAttribute("positions", positions);
            return "dashboard.jsp";
        }
    }

    // display form
    @GetMapping("/orgs/job/new")
    public String addPosition(@ModelAttribute("position") Position position, Model model) {
	return "addPosition.jsp";
    }

    // add a new position

    @PostMapping("/orgs/job/new")
    public String createPosition(@Valid @ModelAttribute("position") Position position, BindingResult result,
	    HttpSession session) {
	Long userId = (Long) session.getAttribute("organization_id");

	if (userId == null) {
	    return "redirect:/orgs/login";
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

 // Display one position with matched developers
    @GetMapping("/orgs/job/{id}")
    public String showPosition(@PathVariable("id") Long id, Model model, HttpSession session) {
        Long userId = (Long) session.getAttribute("organization_id");
        if (userId == null) {
            return "redirect:/";
        } else {
            Organization org = orgService.findOrg(userId);
            Position position = positionService.findPosition(id);
            List<Developer> developers = devService.allDevelopers();

            // Retrieve the list of skills needed for the position
            List<String> positionSkills = position.getSkills();
                    

            // Calculate matching ratio for each developer
            List<DeveloperMatch> developerMatches = developers.stream()
                    .map(developer -> {
                        List<String> developerSkills = Stream.concat(
                                developer.getLanguages().stream(),
                                developer.getFrameworks().stream()
                        ).collect(Collectors.toList());

                        int matchingSkillsCount = (int) positionSkills.stream()
                                .filter(developerSkills::contains)
                                .count();

                        double matchingRatio = (double) matchingSkillsCount / positionSkills.size();
                        
                     // Only include developers with a matching ratio >= 50%
                        if (matchingRatio >= 0.5) {
                            return new DeveloperMatch(developer, matchingRatio);
                        } else {
                            return null;
                        }
                        
                        
                    })
                    
                    .filter(Objects::nonNull) // Filter out null values
                    .collect(Collectors.toList());

            // Sort developers based on matching ratio in descending order
            developerMatches.sort(Comparator.comparingDouble(DeveloperMatch::getMatchingRatio).reversed());

            model.addAttribute("position", position);
            model.addAttribute("org", org);
            model.addAttribute("developerMatches", developerMatches);

            return "showPosition.jsp";
        }
    }

    // get the edit form
    @GetMapping("/orgs/{id}/edit")
    public String editPosition(Model model, @PathVariable("id") Long id, HttpSession session) {
	Long userId = (Long) session.getAttribute("organization_id");
	if (userId == null) {
	    return "redirect:/orgs/login";
	}
	Position position = positionService.findPosition(id);
	model.addAttribute("position", position);
	model.addAttribute("org", orgService.findOrg(userId));

	return "editPosition.jsp";
    }
    
    //edit position
    @PutMapping("/orgs/{id}/edit")
    public String updatePosition(Model model, @Valid @ModelAttribute("position") Position position,
	    BindingResult result, HttpSession session) {
	Long userId = (Long) session.getAttribute("organization_id");
	if (userId == null) {
	    return "redirect:/orgs/login";
	}

	if (result.hasErrors()) {
	    return "editPosition.jsp";
	}
	Organization org = orgService.findOrg(userId);
	position.setOrganization(org);
	positionService.updatePosition(position);

	return "redirect:/orgs/dashboard";
    }

    // delete a position
    @GetMapping("/orgs/delete/{id}")
    public String removePosition(@PathVariable("id") Long id, HttpSession session) {
	Long userId = (Long) session.getAttribute("organization_id");
	if (userId == null) {
	    return "redirect:/orgs/login";
	} else {
	    positionService.deletePosition(id);
	    return "redirect:/orgs/dashboard";
	}
    }

}