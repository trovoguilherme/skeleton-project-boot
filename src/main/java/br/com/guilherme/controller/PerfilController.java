package br.com.guilherme.controller;

import br.com.guilherme.model.ComentarioModel;
import br.com.guilherme.model.UserModel;
import br.com.guilherme.model.filtragem.ProcurarModel;
import br.com.guilherme.repository.ComentarioRepository;
import br.com.guilherme.repository.UserRepository;
import br.com.guilherme.service.PerfilService;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;

@Controller
@RequestMapping("/perfil")
public class PerfilController {

    private static final String PERFIL_FOLDER = "perfil/";

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private ComentarioRepository comentarioRepository;

    @Autowired
    PerfilService perfilService;

    @GetMapping()
    public String openPerfil(@ModelAttribute("procurarModel") ProcurarModel procurarModel, @ModelAttribute("comentarioModel") ComentarioModel comentarioModel, Model model, Authentication authentication) {
        UserModel findUser = userRepository.findByEmail(authentication.getName());
        model.addAttribute("usuario", userRepository.findByEmail(authentication.getName()));
        model.addAttribute("comentarios", comentarioRepository.findComentariosById(findUser.getId()));

        return PERFIL_FOLDER + "perfil";
    }

    @GetMapping("/editar")
    public String openEditarPerfil(@ModelAttribute("userModel") UserModel userModel, Authentication authentication, Model model) {

        model.addAttribute("usuario", userRepository.findByEmail(authentication.getName()));
        model.addAttribute("userModel", userRepository.findByEmail(authentication.getName()));


        return PERFIL_FOLDER + "editar-perfil";
    }

    @PutMapping("/editar")
    public String updatePerfil(@Valid UserModel userModel, @RequestParam("file") MultipartFile arquivo, BindingResult bindingResult, RedirectAttributes redirectAttributes, Model model, Authentication authentication) {

        if(bindingResult.hasErrors()) {
            //model.addAttribute("categorias", servicoRepository.findAll());
            return "editar-perfil";
        }

        perfilService.update(userModel, authentication, arquivo);

        redirectAttributes.addFlashAttribute("messages", "Perfil alterado com sucesso!");

        return "redirect:/perfil";
    }




}
