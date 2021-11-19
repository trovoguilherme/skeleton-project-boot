package br.com.guilherme.controller;

import br.com.guilherme.model.ProcurarModel;
import br.com.guilherme.model.ServicoModel;
import br.com.guilherme.repository.ServicoRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;

@Controller
@RequestMapping("/servico")
public class ServicoController {

    @Autowired
    ServicoRepository servicoRepository;

    @GetMapping("/form")
    public String open(@RequestParam String page,
                       @RequestParam(required = false) Long id,
                       @ModelAttribute("servicoModel") ServicoModel servicoModel,
                       Model model) {

        if("servico-editar".equals(page)) {
            model.addAttribute("servicoModel", servicoRepository.findById(id).get());
        }

        return "home/" + page;
    }

    @GetMapping()
    public String findAll(@ModelAttribute("procurarModel") ProcurarModel procurarModel, Model model) {

        model.addAttribute("servicos", servicoRepository.findAll());
        return "home/servico";
    }

    @GetMapping("/detalhe/{id}")
    public String findById(@PathVariable("id") long id, Model model) {

        model.addAttribute("servico", servicoRepository.findById(id).get());

        return "home/servico-detalhe";
    }

    @PostMapping("/procurar")
    public String procurar(@Valid ProcurarModel procurarModel, BindingResult bindingResult, Model model) {

        model.addAttribute("servicos", servicoRepository.findServicoByCategoria(procurarModel.getNome()));

        return "home/procurar";
    }

    @PostMapping()
    public String save(@Valid ServicoModel servicoModel, BindingResult bindingResult, RedirectAttributes redirectAttributes, Model model) {

        if(bindingResult.hasErrors()) {
            return "home/" + "produto-novo";
        }

        servicoRepository.save(servicoModel);
        redirectAttributes.addFlashAttribute("messages", "Serviço cadastrado com sucesso!");

        return "redirect:/servico";
    }



}
