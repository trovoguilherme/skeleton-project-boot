package br.com.guilherme.controller;

import br.com.guilherme.model.UserModel;
import br.com.guilherme.repository.UserRepository;
import br.com.guilherme.service.CustomUserDetailsService;
import org.apache.tomcat.jni.File;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.security.Principal;
import java.util.List;

@Controller
@RequestMapping("/")
public class AppController {

	private static final String LOGIN_FOLDER = "login/";
	private static String caminhoImagens = "D:\\Documentos\\Codigos\\intellij\\skeleton-project-boot\\src\\main\\resources\\static\\imagens\\";

	@Autowired
	private UserRepository userRepository;
	
	@GetMapping()
	public String viewHomePage() {
		return LOGIN_FOLDER + "index";
	}
	
	@GetMapping("/registrar")
	public String showRegistrationForm(@ModelAttribute("userModel") UserModel userModel, Model model) {
		model.addAttribute("user", new UserModel());
		
		return LOGIN_FOLDER + "signup-form";
	}
	
	@PostMapping("/registrar")
	public String processRegister(UserModel userModel, @RequestParam("file") MultipartFile arquivo) {
		BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
		String encodedPassword = passwordEncoder.encode(userModel.getPassword());
		userModel.setPassword(encodedPassword);

		try {
			if (!arquivo.isEmpty()) {
				byte[] bytes = arquivo.getBytes();
				Path caminho = Paths.get(caminhoImagens+arquivo.getOriginalFilename());
				Files.write(caminho, bytes);

				userModel.setNomeImagem(arquivo.getOriginalFilename());
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		
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
