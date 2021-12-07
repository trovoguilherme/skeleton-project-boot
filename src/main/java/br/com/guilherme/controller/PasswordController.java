package br.com.guilherme.controller;

import br.com.guilherme.model.UserModel;
import br.com.guilherme.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/forgotpassword")
public class PasswordController {

    @Autowired
    UserRepository userRepository;

    @GetMapping()
    public String openPassword(@ModelAttribute("userModel") UserModel userModel) {

        return "perfil/forgot-password";
    }

    @PostMapping()
    public String updatePassword(@ModelAttribute("userModel") UserModel userModel) {

        UserModel findUser = userRepository.findByEmail(userModel.getEmail());

        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        String encodedPassword = passwordEncoder.encode(userModel.getPassword());
        findUser.setPassword(encodedPassword);

        userRepository.save(findUser);

        return "login/index";
    }


}
