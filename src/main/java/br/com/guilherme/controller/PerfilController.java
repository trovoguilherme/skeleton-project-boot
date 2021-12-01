package br.com.guilherme.controller;

import br.com.guilherme.model.UserModel;
import br.com.guilherme.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;

@Controller
@RequestMapping("/perfil")
public class PerfilController {

    private static final String PERFIL_FOLDER = "perfil/";

    @Autowired
    UserRepository userRepository;

    @GetMapping()
    public String openPerfil(Model model, Authentication authentication) {

        model.addAttribute("usuario", userRepository.findByEmail(authentication.getName()));

        return PERFIL_FOLDER + "perfil";
    }

    @GetMapping("/editar")
    public String openEditarPerfil(@ModelAttribute("userModel") UserModel userModel, Authentication authentication, Model model) {

        model.addAttribute("userModel", userRepository.findByEmail(authentication.getName()));

        return PERFIL_FOLDER + "editar-perfil";
    }

    @PutMapping("/editar")
    public String updatePerfil(@Valid UserModel userModel, BindingResult bindingResult, RedirectAttributes redirectAttributes, Model model, Authentication authentication) {

        if(bindingResult.hasErrors()) {
            //model.addAttribute("categorias", servicoRepository.findAll());
            return "editar-perfil";
        }

        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        String encodedPassword = passwordEncoder.encode(userModel.getPassword());
        userModel.setPassword(encodedPassword);

        UserModel findUser = userRepository.findByEmail(authentication.getName());

        findUser.setEmail(userModel.getEmail());
        findUser.setPassword(userModel.getPassword());
        findUser.setFirstName(userModel.getFirstName());
        findUser.setLastName(userModel.getLastName());
        findUser.setCpf(userModel.getCpf());
        findUser.setEstado(userModel.getEstado());
        findUser.setTelefone(userModel.getTelefone());
        findUser.setBiografia(userModel.getBiografia());
        findUser.setTipoDaConta(userModel.getTipoDaConta());

        userRepository.save(findUser);

        redirectAttributes.addFlashAttribute("messages", "Perfil alterado com sucesso!");

        return "redirect:/perfil";
    }


}
