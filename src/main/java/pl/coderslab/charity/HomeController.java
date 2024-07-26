package pl.coderslab.charity;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import pl.coderslab.charity.Donation.DonationService;
import pl.coderslab.charity.institution.Institution;
import pl.coderslab.charity.institution.InstitutionRepository;


import java.util.List;


@Controller
public class HomeController {

    @Autowired
    private final InstitutionRepository institutionRepository;
    @Autowired
    private final DonationService donationService;


    public HomeController(InstitutionRepository institutionRepository, DonationService donationService) {
        this.institutionRepository = institutionRepository;
        this.donationService = donationService;
    }
    @GetMapping("/home")
    public String homeAction(Model model){
        List<Institution> institutions =  institutionRepository.findAll();
        model.addAttribute("institutions", institutions);
        Integer totalQuantity = donationService.getTotalQuantity();
        model.addAttribute("totalQuantity", totalQuantity);
        Long totalDonations = donationService.getTotalDonations();
        model.addAttribute("totalDonations", totalDonations);
        return "index";
    }
}
