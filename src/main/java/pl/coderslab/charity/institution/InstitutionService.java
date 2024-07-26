package pl.coderslab.charity.institution;

import java.util.List;


public class InstitutionService {

    private  InstitutionRepository institutionRepository;

    public List<Institution> findAll(){
        return institutionRepository.findAll();
    }
}
