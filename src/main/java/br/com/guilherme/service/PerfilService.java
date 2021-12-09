package br.com.guilherme.service;

import br.com.guilherme.model.UserModel;
import br.com.guilherme.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

@Service
public class PerfilService {

    private static String caminhoImagens = "D:\\Documentos\\Codigos\\intellij\\skeleton-project-boot\\src\\main\\resources\\static\\imagens\\";

    @Autowired
    UserRepository userRepository;

    public void update(UserModel userModel, Authentication authentication, MultipartFile arquivo) {
        BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
        String encodedPassword = passwordEncoder.encode(userModel.getPassword());
        userModel.setPassword(encodedPassword);

        UserModel findUser = userRepository.findByEmail(authentication.getName());

        try {
            if (!arquivo.isEmpty()) {
                byte[] bytes = arquivo.getBytes();
                Path caminho = Paths.get(caminhoImagens+arquivo.getOriginalFilename());
                Files.write(caminho, bytes);

                userModel.setNomeImagem(arquivo.getOriginalFilename());
            } else {
                userModel.setNomeImagem(findUser.getNomeImagem());
            }
        } catch (IOException e) {
            e.printStackTrace();
        }


        findUser.setEmail(userModel.getEmail());
        findUser.setPassword(userModel.getPassword());
        findUser.setFirstName(userModel.getFirstName());
        findUser.setLastName(userModel.getLastName());
        findUser.setCpf(userModel.getCpf());
        findUser.setEstado(userModel.getEstado());
        findUser.setTelefone(userModel.getTelefone());
        findUser.setBiografia(userModel.getBiografia());
        findUser.setTipoDaConta(userModel.getTipoDaConta());
        findUser.setNomeImagem(userModel.getNomeImagem());

        userRepository.save(findUser);
    }


}
