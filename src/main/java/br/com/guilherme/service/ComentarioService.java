package br.com.guilherme.service;

import br.com.guilherme.model.ComentarioModel;
import br.com.guilherme.model.UserModel;
import br.com.guilherme.repository.ComentarioRepository;
import br.com.guilherme.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Service;

@Service
public class ComentarioService {

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private ComentarioRepository comentarioRepository;

    public void salvar(long id, ComentarioModel comentarioModel, Authentication authentication) {
        UserModel user = userRepository.findById(id).get();
        comentarioModel.setNome(userRepository.findByEmail(authentication.getName()).getEmail());
        comentarioModel.setUsuario(userRepository.findByEmail(authentication.getName()));
        comentarioModel.setIdaux(user.getId());

        comentarioRepository.save(comentarioModel);
    }

}
