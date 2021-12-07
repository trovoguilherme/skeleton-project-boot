package br.com.guilherme.controller;

import br.com.guilherme.model.ComentarioModel;
import br.com.guilherme.model.filtragem.ProcurarModel;
import br.com.guilherme.model.ServicoModel;
import br.com.guilherme.model.UserModel;
import br.com.guilherme.repository.ComentarioRepository;
import br.com.guilherme.repository.RankRepository;
import br.com.guilherme.repository.ServicoRepository;
import br.com.guilherme.repository.UserRepository;
import br.com.guilherme.service.ComentarioService;
import br.com.guilherme.service.ContratanteService;
import br.com.guilherme.service.RankService;
import br.com.guilherme.service.ServicoService;
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
public class ContratanteController {

    private static final String SERVICO_FOLDER = "home-contratante/";

    @Autowired
    ServicoRepository servicoRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private ComentarioRepository comentarioRepository;

    @Autowired
    private RankRepository rankRepository;

    @Autowired
    private ContratanteService contratanteService;

    @Autowired
    private ServicoService servicoService;

    @Autowired
    private ComentarioService comentarioService;

    @Autowired
    private RankService rankService;

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
        String page = contratanteService.whichPage(authentication);

        UserModel findUser = userRepository.findByEmail(authentication.getName());

        model.addAttribute("usuarios", userRepository.findUsersWithoutMeAndOnlyPrestador(authentication.getName()));
        model.addAttribute("servicos", servicoRepository.findServicosById(findUser.getId()));
        return page;
    }

    @GetMapping("/detalhe/{id}")
    public String findById(@PathVariable("id") long id, Model model, @ModelAttribute("procurarModel") ProcurarModel procurarModel, @ModelAttribute("comentarioModel") ComentarioModel comentarioModel) {
        UserModel user = userRepository.findById(id).get();

        model.addAttribute("usuario", userRepository.findById(id).get());

        List<ComentarioModel> listaDeComentarios = comentarioRepository.findComentariosById(id);
        //List<ComentarioModel> minhaLista = comentarioRepository.findComentariosById(id);

        List<ComentarioModel> listaDeComentario = comentarioRepository.findComentariosById(id);
        UserModel auxUser = new UserModel();
        for (ComentarioModel c: listaDeComentario) {
            auxUser = c.getUsuario();
        }

        model.addAttribute("imagemDoComentario", auxUser.getNomeImagem());

        model.addAttribute("usuario", userRepository.findById(id).get());

        model.addAttribute("comentarios", listaDeComentarios);
        model.addAttribute("servicos", servicoRepository.findServicosById(id));
        model.addAttribute("whatsapp", user.getTelefone());

        model.addAttribute("rank", rankService.calcularMediaDeVoto(id));

        return SERVICO_FOLDER + "prestador-detalhe";
    }

    @PostMapping("/comentario/{id}")
    public String salvarUmComentario(@PathVariable("id") long id, ComentarioModel comentarioModel, Model model, Authentication authentication, @ModelAttribute("procurarModel") ProcurarModel procurarModel) {
        UserModel user = userRepository.findById(id).get();
        comentarioService.salvar(id, comentarioModel, authentication);

        List<ComentarioModel> listaDeComentario = comentarioRepository.findComentariosById(id);
        UserModel auxUser = new UserModel();
        for (ComentarioModel c: listaDeComentario) {
            auxUser = c.getUsuario();
        }

        model.addAttribute("imagemDoComentario", auxUser.getNomeImagem());

        model.addAttribute("usuario", userRepository.findById(id).get());
        model.addAttribute("comentarios", comentarioRepository.findComentariosById(id));
        model.addAttribute("servicos", servicoRepository.findServicosById(id));
        model.addAttribute("whatsapp", user.getTelefone());

        return SERVICO_FOLDER + "prestador-detalhe";
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

    @GetMapping("/cadastrar/{id}")
    public String openCadastrarServico(@PathVariable("id") long id, @ModelAttribute("servicoModel") ServicoModel servicoModel, Model model) {
        model.addAttribute("id", id);
        return SERVICO_FOLDER + "servico/servico-novo";
    }

    @PostMapping("/cadastrar/{id}")
    public String salvarUmServico(@PathVariable("id") long id, final ServicoModel servicoModel, Model model, Authentication authentication) {
        servicoService.salvar(id, servicoModel, authentication);
        return "redirect:/servico";
    }

    @GetMapping("/detalhe/{id}/cadastrado")
    public String abrirServico(@PathVariable("id") long id, Model model) {
        model.addAttribute("servico", servicoRepository.findById(id).get());
        return SERVICO_FOLDER + "servico/detalhe";
    }

}
