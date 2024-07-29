package pl.coderslab.charity.Donation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import pl.coderslab.charity.Category.CategoryRepository;
import pl.coderslab.charity.institution.InstitutionRepository;

import java.awt.*;

@Controller
public class DonationController {

    private final CategoryRepository categoryRepository;

    private final InstitutionRepository institutionRepository;

    private final DonationRepository donationRepository;

    public DonationController(CategoryRepository categoryRepository,InstitutionRepository institutionRepository,DonationRepository donationRepository){
        this.categoryRepository = categoryRepository;
        this.institutionRepository = institutionRepository;
        this.donationRepository = donationRepository;
    }

    @GetMapping("/donationForm")
public String addDonation(Model model){
        model.addAttribute("donation", new Donation());
        model.addAttribute("categories", categoryRepository.findAll());
        model.addAttribute("institutions", institutionRepository.findAll());
        return "donationForm";
    }
    @PostMapping("donationForm")
    public String saveDonation(@ModelAttribute Donation donation) {
        donationRepository.save(donation);
        return "redirect:/donationForm";
    }
}
