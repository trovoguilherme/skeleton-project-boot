package br.com.guilherme.controller;

import br.com.guilherme.model.ComentarioModel;
import br.com.guilherme.model.ProcurarModel;
import br.com.guilherme.model.ServicoModel;
import br.com.guilherme.model.UserModel;
import br.com.guilherme.repository.ComentarioRepository;
import br.com.guilherme.repository.ServicoRepository;
import br.com.guilherme.repository.UserRepository;
import org.apache.catalina.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;
import java.util.LinkedList;
import java.util.List;

@Controller
@RequestMapping("/servico")
public class ContratanteController {

    private static final String SERVICO_FOLDER = "home-contratante/";

    @Autowired
    ServicoRepository servicoRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private ComentarioRepository comentarioRepository;

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
    public String findAll(@ModelAttribute("procurarModel") ProcurarModel procurarModel, Model model, Authentication authentication) {

        model.addAttribute("usuarios", userRepository.findUsersWithoutMe(authentication.getName()));
        return SERVICO_FOLDER + "principal";
    }

    @GetMapping("/detalhe/{id}")
    public String findById(@PathVariable("id") long id, Model model) {
        UserModel user = userRepository.findById(id).get();

        model.addAttribute("usuario", userRepository.findById(id).get());

        List<ComentarioModel> listaDeComentarios = comentarioRepository.findComentariosById(id);
        //List<ComentarioModel> minhaLista = comentarioRepository.findComentariosById(id);

        model.addAttribute("comentarios", listaDeComentarios);
        model.addAttribute("servicos", servicoRepository.findServicosById(id));
        model.addAttribute("whatsapp", user.getTelefone());

        return SERVICO_FOLDER + "servico-detalhe";
    }

    @GetMapping("/comentario/{id}")
    public String abrirUmComentario(@PathVariable("id") long id, @ModelAttribute("comentarioModel") ComentarioModel comentarioModel, Model model) {
        model.addAttribute("id", id); //Usado para pegar o id do perfil
        return "home-contratante/comentario/comentario";
    }

    @PostMapping("/comentario/{id}")
    public String salvarUmComentario(@PathVariable("id") long id, ComentarioModel comentarioModel, Model model, Authentication authentication) {

        UserModel user = userRepository.findById(id).get();
        comentarioModel.setNome(userRepository.findByEmail(authentication.getName()).getEmail());
        comentarioModel.setUsuario(user);
        comentarioModel.setIdaux(user.getId());

        comentarioRepository.save(comentarioModel);

        return "redirect:/servico";
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

    @GetMapping("/cadastrar/{id}")
    public String openCadastrarServico(@PathVariable("id") long id, @ModelAttribute("servicoModel") ServicoModel servicoModel, Model model) {
        model.addAttribute("id", id);
        return SERVICO_FOLDER + "criar-servico/servico-novo";
    }

    @PostMapping("/cadastrar/{id}")
    public String salvarUmServico(@PathVariable("id") long id, ServicoModel servicoModel, Model model, Authentication authentication) {

        UserModel user = userRepository.findById(id).get();

        servicoModel.setNome(userRepository.findByEmail(authentication.getName()).getEmail());
        servicoModel.setUsuarioServico(user);
        servicoModel.setIdaux(user.getId());

        servicoRepository.save(servicoModel);

        return "redirect:/servico";
    }





}
