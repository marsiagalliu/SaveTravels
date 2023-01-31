package com.dojo.savetravels.controllers;

import com.dojo.savetravels.models.Travel;
import com.dojo.savetravels.services.TravelService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import javax.validation.Valid;
import java.util.List;

@Controller
public class TravelController {

    @Autowired
    TravelService travelService;

    public TravelController(TravelService travelService) {
        this.travelService = travelService;
    }

    @RequestMapping("/expenses")
    public String index(Model model) {
        List<Travel> travel = travelService.allTravels();
        model.addAttribute("travel", travel);
        return "index.jsp";
    }

    @RequestMapping("/expenses/{id}")
    public String show(Model model, @PathVariable("id") Long id){
        Travel travel = travelService.findTravel(id);
        model.addAttribute("travel", travel);
        return "show.jsp";
    }

    @RequestMapping("/expenses/new")
    public String newTravel(@ModelAttribute("travel") Travel travel) {
        return "new.jsp";
    }

    @PostMapping("/expenses")
    public String create(@Valid @ModelAttribute("travel") Travel travel, BindingResult result) {
        if (result.hasErrors()) {
            return "new.jsp";
        } else {
            travelService.createTravel(travel);
            return "redirect:/expenses";
        }
    }

    @RequestMapping("expenses/edit/{id}")
    public String edit(@PathVariable("id") Long id, Model model) {
        Travel travel = travelService.findTravel(id);
        model.addAttribute("travel", travel);
        return "edit.jsp";
    }

    @RequestMapping(value="/expenses/{id}", method= RequestMethod.PUT)
    public String update(@Valid @ModelAttribute("travel") Travel travel, BindingResult result) {
        if (result.hasErrors()) {
            return "edit.jsp";
        } else {
            travelService.updateTravel(travel);
            return "redirect:/expenses";
        }
    }
    @RequestMapping(value="/expenses/{id}", method=RequestMethod.DELETE)
    public String destroy(@PathVariable("id") Long id) {
        travelService.deleteTravel(id);
        return "redirect:/expenses";
    }
}
