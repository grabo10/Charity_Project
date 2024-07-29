package pl.coderslab.charity.user;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class UserController {

    private final UserService userService;
    private final PasswordEncoder passwordEncoder;

    public UserController(UserService userService, PasswordEncoder passwordEncoder){
        this.userService = userService;
        this.passwordEncoder = passwordEncoder;
    }

    @GetMapping("/userForm")
    public String addUser(Model model) {
        model.addAttribute("user", new User());
        return "userForm";
    }

    @PostMapping("/userForm")
    public String saveUser(@ModelAttribute User user){
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        userService.saveUser(user);
        return "redirect:/userLogin";
    }

    @GetMapping("/login")
    public String showLoginForm(Model model) {

        return "login";
    }
}