package br.com.guilherme.controller;

import br.com.guilherme.model.ProcurarModel;
import br.com.guilherme.model.ServicoModel;
import br.com.guilherme.model.UserModel;
import br.com.guilherme.repository.ServicoRepository;
import br.com.guilherme.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;
import java.util.List;

@Controller
@RequestMapping("/servico")
public class ServicoController {

    private static final String SERVICO_FOLDER = "home/";

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

        return SERVICO_FOLDER + page;
    }

    @GetMapping()
    public String findAll(@ModelAttribute("procurarModel") ProcurarModel procurarModel, Model model) {

        model.addAttribute("servicos", servicoRepository.findAll());
        return SERVICO_FOLDER + "servico";
    }

    @GetMapping("/detalhe/{id}")
    public String findById(@PathVariable("id") long id, Model model) {

        model.addAttribute("servico", servicoRepository.findById(id).get());

        return SERVICO_FOLDER + "servico-detalhe";
    }

    @PostMapping("/procurar")
    public String procurar(@Valid ProcurarModel procurarModel, BindingResult bindingResult, Model model, RedirectAttributes redirectAttributes) {

        List<ServicoModel> listaDeServicos = servicoRepository.findServicoByCategoria(procurarModel.getNome());

        if (listaDeServicos.isEmpty()) {
            redirectAttributes.addFlashAttribute("messages", "Nenhum serviço encontrado para essa categoria!");
            return "redirect:/servico";
        }

        model.addAttribute("servicos", listaDeServicos);

        return SERVICO_FOLDER + "procurar";
    }

    @PostMapping()
    public String save(@Valid ServicoModel servicoModel, BindingResult bindingResult, RedirectAttributes redirectAttributes, Model model) {

        if(bindingResult.hasErrors()) {
            return SERVICO_FOLDER + "servico-novo";
        }

        servicoRepository.save(servicoModel);
        redirectAttributes.addFlashAttribute("messages", "Serviço cadastrado com sucesso!");

        return "redirect:/servico";
    }

    @DeleteMapping("/deletar/{id}")
    public String delete(@PathVariable("id") long id, RedirectAttributes redirectAttributes) {

        servicoRepository.deleteById(id);
        redirectAttributes.addFlashAttribute("messages", "Serviço deletado com sucesso!");

        return "redirect:/servico";
    }

    @PutMapping("/{id}")
    public String update(@PathVariable("id") long id, @Valid ServicoModel servicoModel, BindingResult bindingResult, RedirectAttributes redirectAttributes, Model model) {

        if(bindingResult.hasErrors()) {
            model.addAttribute("categorias", servicoRepository.findAll());
            return SERVICO_FOLDER + "servico-editar";
        }

        servicoModel.setId(id);
        servicoRepository.save(servicoModel);
        redirectAttributes.addFlashAttribute("messages", "Serviço alterado com sucesso!");

        return "redirect:/servico";
    }

    @GetMapping("/meus-servicos")
    public String myListOfServices() {

        return SERVICO_FOLDER + "meus-servicos";
    }





}
