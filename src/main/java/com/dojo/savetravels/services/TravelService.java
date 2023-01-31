package com.dojo.savetravels.services;

import com.dojo.savetravels.models.Travel;
import com.dojo.savetravels.repositories.TravelRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class TravelService {

    @Autowired
    TravelRepository travelRepository;

    public TravelService(TravelRepository travelRepository) {
        this.travelRepository = travelRepository;
    }

    public List<Travel> allTravels() {
        return travelRepository.findAll();
    }

    public Travel createTravel(Travel t) {
        return travelRepository.save(t);
    }

    public Travel findTravel(Long id) {
        Optional<Travel> optionalTravel = travelRepository.findById(id);
        if(optionalTravel.isPresent()) {
            return optionalTravel.get();
        } else {
            return null;
        }
    }

    public Travel updateTravel(Travel travel) {
        return travelRepository.save(travel);
    }

    public void deleteTravel(Long id) {
        travelRepository.deleteById(id);
    }

}
