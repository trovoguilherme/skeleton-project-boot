package br.com.guilherme.model;

import lombok.Data;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@Data
@Entity
@Table(name = "TB_RANKING")
public class RankModel {

    @Id
    @Column(name = "ID")
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "RANKING_SEQ")
    @SequenceGenerator(name = "RANKING_SEQ", sequenceName = "RANKING_SEQ", allocationSize = 1)
    private Long id;

    @Column(name = "VALOR_VOTO")
    private double voto;

    @ManyToOne
    @JoinColumn(name = "ID_CONTRATANTE")
    private UserModel usuarioRanking;

    /*ID Usado para saber pra quem foi feito o servico*/
    @Column(name = "ID_PRESTADOR")
    private long idaux;

}
