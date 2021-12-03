package br.com.guilherme.service;

import br.com.guilherme.model.UserModel;
import br.com.guilherme.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Service;

@Service
public class ContratanteService {

    @Autowired
    UserRepository userRepository;

    public String whichPage(Authentication authentication) {

        UserModel findUser = userRepository.findByEmail(authentication.getName());

        if (findUser.getTipoDaConta().equalsIgnoreCase("contratante")) {
            return "home-contratante/principal";
        } else {
            return "home-cliente/servico";
        }

    }

}
