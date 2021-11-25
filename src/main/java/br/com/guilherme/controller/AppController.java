package br.com.guilherme.controller;

import br.com.guilherme.model.UserModel;
import br.com.guilherme.repository.UserRepository;
import br.com.guilherme.service.CustomUserDetailsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.security.Principal;
import java.util.List;

@Controller
@RequestMapping("/")
public class AppController {

	private static final String LOGIN_FOLDER = "login/";

	@Autowired
	private UserRepository userRepository;
	
	@GetMapping()
	public String viewHomePage() {
		return LOGIN_FOLDER + "index";
	}
	
	@GetMapping("/register")
	public String showRegistrationForm(@ModelAttribute("userModel") UserModel userModel, Model model) {
		model.addAttribute("user", new UserModel());
		
		return LOGIN_FOLDER + "signup-form";
	}
	
	@PostMapping("/process-register")
	public String processRegister(UserModel userModel) {
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		String encodedPassword = passwordEncoder.encode(userModel.getPassword());
		userModel.setPassword(encodedPassword);
		
		userRepository.save(userModel);
		
		return LOGIN_FOLDER + "register-success";
	}
	
	@GetMapping("/users/{valor}")
	public String listUsers(@PathVariable("valor") String valor, Model model, Principal principal, Authentication authentication, CustomUserDetailsService customUserDetailsService) {
		System.out.println("!!!!!!!!!!! aquiiii: "+ valor);
		System.out.println("Principal: "+principal.getName());
		System.out.println("Authentication: "+authentication.getName());

		List<UserModel> listUserModels = userRepository.findAll();
		model.addAttribute("listUsers", listUserModels);
		
		return LOGIN_FOLDER + "users";
	}
}
