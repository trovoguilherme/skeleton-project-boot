package br.com.guilherme.controller;

import br.com.guilherme.model.ServicoModel;
import br.com.guilherme.model.UserModel;
import br.com.guilherme.repository.ServicoRepository;
import br.com.guilherme.repository.UserRepository;
import br.com.guilherme.service.ServicoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.validation.Valid;

@Controller
@RequestMapping("/historico")
public class HistoricoController {

    @Autowired
    ServicoRepository servicoRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private ServicoService servicoService;

    @GetMapping()
    public String open(Model model, Authentication authentication) {
        UserModel user = userRepository.findByEmail(authentication.getName());
        model.addAttribute("usuario", user);
        model.addAttribute("servicos", servicoRepository.findMyServices(user));
        return "home-contratante/historico/historico";
    }

    @GetMapping("/servico/detalhe/{id}")
    public String openById(@PathVariable("id") long id, Model model, Authentication authentication) {
        UserModel user = userRepository.findByEmail(authentication.getName());
        model.addAttribute("usuario", user);
        model.addAttribute("servico", servicoRepository.findById(id).get());
        return "home-contratante/servico/detalhe";
    }

    @GetMapping("/servico/editar/{id}")
    public String openUpdate(@PathVariable("id") long id, @ModelAttribute("servicoModel") ServicoModel servicoModel, Model model, Authentication authentication) {
        UserModel user = userRepository.findByEmail(authentication.getName());
        model.addAttribute("usuario", user);
        model.addAttribute("id", id);
        model.addAttribute("servicoModel", servicoRepository.findById(id).get());
        return "home-contratante/servico/editar";
    }

    @PutMapping("/{id}")
    public String update(ServicoModel servicoModel, @PathVariable("id") long id, Model model, Authentication authentication) {

        servicoService.atualizar(id, servicoModel, authentication);

        UserModel user = userRepository.findByEmail(authentication.getName());
        model.addAttribute("usuario", user);
        model.addAttribute("servico", servicoRepository.findById(id).get());
        return "redirect:/historico";
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
