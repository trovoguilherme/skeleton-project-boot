package br.com.guilherme.model;

import lombok.Data;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@Data
@Entity
@Table(name = "TB_SERVICO")
public class ServicoModel {

    @Id
    @Column(name = "ID")
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "SERVICO_SEQ")
    @SequenceGenerator(name = "SERVICO_SEQ", sequenceName = "SERVICO_SEQ", allocationSize = 1)
    private Long id;

    @Column(name = "TITULO")
    @NotNull(message = "Título obrigatório")
    @Size(min = 2, max = 50, message = "TITULO deve ser entre 2 e 50 caracteres")
    private String titulo;

    @Column(name = "DESCRICAO")
    @NotNull(message = "Descrição obrigatório")
    @Size(min = 2, max = 500, message = "DESCRICAO deve ser entre 2 e 50 caracteres")
    private String descricao;

    @Column(name = "CATEGORIA")
    @NotNull(message = "Categoria obrigatório")
    @Size(min = 2, max = 50, message = "CATEGORIA deve ser entre 2 e 50 caracteres")
    private String categoria;

    @Column(name = "LINGUAGEM")
    @NotNull(message = "Linguagem obrigatório")
    @Size(min = 2, max = 50, message = "LIGUAGEM deve ser entre 2 e 50 caracteres")
    private String linguagem;

    @Column(name = "STATUS")
    @NotNull(message = "Status obrigatório")
    private String status;

    @Column(name = "VALOR")
    @NotNull(message = "Status obrigatório")
    private double valor;

    @ManyToOne
    @JoinColumn(name = "ID_CONTRATANTE")
    private UserModel usuarioServico;

    /*ID Usado para saber pra quem foi feito o servico*/
    @Column(name = "ID_PRESTADOR")
    private long idaux;

    @Column(name = "EMAIL_CONTRATANTE")
    @NotNull(message = "Nome obrigatório")
    private String emailContratante; //email ed quem criou o servico

    @Column(name = "EMAIL_PRESTADOR")
    @NotNull(message = "Nome obrigatório")
    private String emailPrestador; //email do dono servico




}
