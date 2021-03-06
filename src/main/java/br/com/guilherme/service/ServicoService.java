package br.com.guilherme.service;

import br.com.guilherme.model.ServicoModel;
import br.com.guilherme.model.UserModel;
import br.com.guilherme.repository.ComentarioRepository;
import br.com.guilherme.repository.ServicoRepository;
import br.com.guilherme.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Date;

@Service
public class ServicoService {
    @Autowired
    ServicoRepository servicoRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private ComentarioRepository comentarioRepository;

    @Autowired
    private ContratanteService contratanteService;

    public void salvar(long id, ServicoModel servicoModel, Authentication authentication) {
        UserModel user = userRepository.findById(id).get();

        Date dataAtual = new Date();
        String data = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss").format(dataAtual);
        servicoModel.setDataDoServico(data);

        servicoModel.setEmailContratante(userRepository.findByEmail(authentication.getName()).getEmail());
        servicoModel.setUsuarioServico(userRepository.findByEmail(authentication.getName()));
        servicoModel.setIdaux(user.getId());
        servicoModel.setEmailPrestador(user.getEmail());

        ServicoModel novoServico = new ServicoModel();

        novoServico.setTitulo(servicoModel.getTitulo());
        novoServico.setCategoria(servicoModel.getCategoria());
        novoServico.setStatus(servicoModel.getStatus());
        novoServico.setLinguagem(servicoModel.getLinguagem());
        novoServico.setDescricao(servicoModel.getDescricao());
        novoServico.setUsuarioServico(servicoModel.getUsuarioServico());
        novoServico.setIdaux(servicoModel.getIdaux());
        novoServico.setValor(servicoModel.getValor());
        novoServico.setEmailContratante(servicoModel.getEmailContratante());
        novoServico.setEmailPrestador(servicoModel.getEmailPrestador());
        novoServico.setDataDoServico(servicoModel.getDataDoServico());

        servicoRepository.save(novoServico);
    }

    public String atualizar(long id, ServicoModel servicoModel, Authentication authentication) {
        ServicoModel findServico = servicoRepository.findById(id).get();

        Date dataAtual = new Date();
        String data = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss").format(dataAtual);
        servicoModel.setDataDoServico(data);

        servicoModel.setId(id);
        servicoModel.setIdaux(findServico.getIdaux());
        servicoModel.setEmailPrestador(findServico.getEmailPrestador());
        servicoModel.setEmailContratante(findServico.getEmailContratante());
        servicoModel.setUsuarioServico(findServico.getUsuarioServico());

        servicoRepository.save(servicoModel);
        return servicoModel.getStatus();
    }

}
