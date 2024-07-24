package pl.coderslab.charity;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import pl.coderslab.charity.Institution.Institution;
import pl.coderslab.charity.Institution.InstitutionRepository;

import java.util.List;


@Controller
public class HomeController {

    private final InstitutionRepository institutionRepository;

    public HomeController(InstitutionRepository institutionRepository){
        this.institutionRepository = institutionRepository;
    }
    @GetMapping("/home")
    public String homeAction(Model model){
        List<Institution> institutions =  institutionRepository.findAll();
        model.addAttribute("institutions", institutions);
        return "index";
    }
}
