package br.com.guilherme.service;

import br.com.guilherme.model.UserModel;
import br.com.guilherme.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

@Service
public class PerfilService {

    @Autowired
    UserRepository userRepository;

    public void update(UserModel userModel, Authentication authentication) {
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
    }


}
