package br.com.guilherme.controller;

import br.com.guilherme.model.ServicoModel;
import br.com.guilherme.model.UserModel;
import br.com.guilherme.repository.ServicoRepository;
import br.com.guilherme.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/historico")
public class HistoricoController {

    @Autowired
    ServicoRepository servicoRepository;

    @Autowired
    private UserRepository userRepository;

    @GetMapping()
    public String open(Model model, Authentication authentication) {
        UserModel user = userRepository.findByEmail(authentication.getName());
        model.addAttribute("servicos", servicoRepository.findMyServices(user));
        return "home-contratante/historico/historico";
    }

    @GetMapping("/{status}")
    public String openStatus(@PathVariable("status") String status, Model model, Authentication authentication) {
        UserModel user = userRepository.findByEmail(authentication.getName());
        String page = "";
        if (status.equalsIgnoreCase("aberto")) {
            page = "home-contratante/historico/aberto";
        } else if (status.equalsIgnoreCase("pausado")) {
            page = "home-contratante/historico/pausado";
        } else if(status.equalsIgnoreCase("fazendo")) {
            page = "home-contratante/historico/fazendo";
        } else {
            page = "home-contratante/historico/finalizado";
        }

        model.addAttribute("servicosPorStatus", servicoRepository.findServicosMyServicesByStatus(user, status));

        return page;
    }

    @GetMapping("/{status}/{id}")
    public String setStatus(@PathVariable("status") String status, @PathVariable("id") long id) {
        ServicoModel findservico = servicoRepository.findById(id).get();
        findservico.setStatus(status);

        servicoRepository.save(findservico);

        return "redirect:/historico";
    }

}
