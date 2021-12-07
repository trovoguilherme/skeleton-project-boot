package br.com.guilherme.controller;

import br.com.guilherme.model.RankModel;
import br.com.guilherme.model.UserModel;
import br.com.guilherme.model.filtragem.ProcurarModel;
import br.com.guilherme.repository.RankRepository;
import br.com.guilherme.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/rank")
public class RankController {

    @Autowired
    private UserRepository userRepository;
    @Autowired
    private RankRepository rankRepository;

    @GetMapping("/{id}")
    public String openRank(@PathVariable("id") long id, @ModelAttribute("rankModel") RankModel rankModel, Model model) {
        model.addAttribute("id", id);
         return "home-contratante/rank/rank";
    }

    @PostMapping("/{id}")
    public String salvarRanking(@PathVariable("id") long id, final RankModel rankModel, Model model, Authentication authentication) {

        UserModel findUser = userRepository.findById(id).get();

        rankModel.setUsuarioRanking(userRepository.findByEmail(authentication.getName()));
        rankModel.setIdaux(findUser.getId());

        rankRepository.save(rankModel);
        model.addAttribute("usuarios", userRepository.findUsersWithoutMeAndOnlyPrestador(authentication.getName()));
         return "home-contratante/home";
    }
}
