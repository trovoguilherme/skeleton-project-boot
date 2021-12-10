package br.com.guilherme.controller;

import br.com.guilherme.model.ServicoModel;
import br.com.guilherme.repository.ServicoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/checkout")
public class CheckoutController {

    @Autowired
    ServicoRepository servicoRepository;

    @GetMapping("/{id}")
    public String open(@PathVariable("id") long id, Model model) {
        ServicoModel findServico = servicoRepository.findById(id).get();
        findServico.setStatus("finalizado");
        servicoRepository.save(findServico);
        model.addAttribute("servico", servicoRepository.findById(id).get());
        return "checkout/checkout";
    }

    @GetMapping("/sucesso/{id}")
    public String pagamentoCoSucesso(@PathVariable("id") long id, Model model) {
        ServicoModel findServico = servicoRepository.findById(id).get();
        model.addAttribute("id", findServico.getIdaux());
        model.addAttribute("prestador", findServico.getEmailPrestador());
        return "checkout/pagamento-sucesso";
    }


}
