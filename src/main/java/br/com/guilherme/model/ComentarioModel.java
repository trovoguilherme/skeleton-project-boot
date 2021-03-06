package br.com.guilherme.model;

import lombok.Data;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Data
@Entity
@Table(name = "TB_COMENTARIO")
public class ComentarioModel {

    @Id
    @Column(name = "ID_COMENTARIO")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long idComentario;

    @Column(name = "NOME")
    private String nome;

    @Column(name = "MENSAGEM")
    private String mensagem;

    /*ID Usado para saber pra quem foi feito o comentário*/
    @Column(name = "IDAUX")
    private long idaux;

    @ManyToOne
    @JoinColumn(name = "ID_USUARIO")
    private UserModel usuario;

    @Column(name = "data")
    private String dataDoComentario;

}
