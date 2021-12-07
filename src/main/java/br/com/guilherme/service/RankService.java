package br.com.guilherme.service;

import br.com.guilherme.model.RankModel;
import br.com.guilherme.repository.RankRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RankService {

    @Autowired
    private RankRepository rankRepository;

    public String calcularMediaDeVoto(long id) {
        List<RankModel> listaDeRank = rankRepository.findRanksById(id);

        double aux = 0;
        for (RankModel r : listaDeRank) {
            aux += r.getVoto();
        }

        double media = aux/listaDeRank.size();
        String resultado = String.format("%.1f", media);
        return resultado;
    }

}
