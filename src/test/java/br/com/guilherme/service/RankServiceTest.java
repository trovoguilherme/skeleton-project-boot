package br.com.guilherme.service;

import br.com.guilherme.model.RankModel;
import br.com.guilherme.repository.RankRepository;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.MockitoAnnotations;
import org.mockito.junit.jupiter.MockitoExtension;

import java.util.ArrayList;
import java.util.List;

import static org.mockito.ArgumentMatchers.eq;
import static org.mockito.Mockito.when;

@ExtendWith(MockitoExtension.class)
public class RankServiceTest {

    @InjectMocks
    private RankService rankService;

    @Mock
    private RankRepository rankRepository;


    @BeforeEach
    public void setUp() {
        MockitoAnnotations.initMocks(this);
    }

    @Test
    @DisplayName("Se tiver votos deve retornar a média dos votos")
    void seTiverVotoDeveSerFeitoAMedia() {

        RankModel rank1 = new RankModel();
        rank1.setId(1L);
        rank1.setVoto(10);

        RankModel rank2 = new RankModel();
        rank2.setId(1L);
        rank2.setVoto(7.3);

        when(rankRepository.findRanksById(eq(1L))).thenReturn(new ArrayList<RankModel>(List.of(rank1, rank2)));

        Assertions.assertEquals("8,7", rankService.calcularMediaDeVoto(1L));

    }

    @Test
    @DisplayName("Se não tiver votos deve retornar 0")
    void seNaoTiverVotosDeveRetornarZero() {

        when(rankRepository.findRanksById(eq(1L))).thenReturn(new ArrayList<RankModel>());

        Assertions.assertEquals("0", rankService.calcularMediaDeVoto(1L));

    }

}
