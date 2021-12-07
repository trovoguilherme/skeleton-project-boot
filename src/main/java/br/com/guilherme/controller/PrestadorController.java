package br.com.guilherme.controller;

import br.com.guilherme.repository.ServicoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/prestador")
public class PrestadorController {

    private static final String SERVICO_FOLDER = "home-contratante/";

    @Autowired
    ServicoRepository servicoRepository;

    @GetMapping("/servico/{id}")
    public String abrirServico(@PathVariable("id") long id, Model model) {
        model.addAttribute("servico", servicoRepository.findById(id).get());
        return SERVICO_FOLDER + "servico/detalhe";
    }

}
