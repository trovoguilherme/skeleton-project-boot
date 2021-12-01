package br.com.guilherme.model;

import lombok.Data;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import java.util.List;

@Data
@Entity
@Table(name = "USERS")
public class UserModel {
	
	@Id
	@Column(name = "ID")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	@Column(name = "EMAIL", nullable = false, unique = true, length = 45)
	private String email;
	
	@Column(name = "PASSWORD", nullable = false, length = 64)
	private String password;
	
	@Column(name = "FIRST_NAME", nullable = false, length = 20)
	private String firstName;
	
	@Column(name = "LAST_NAME", nullable = false, length = 20)
	private String lastName;

	@OneToMany(mappedBy = "usuario")
	private List<ComentarioModel> comentarios;

	@Column(name = "CPF")
	private String cpf;

	@Column(name = "ESTADO")
	private String estado;

	@Column(name = "TELEFONE")
	private String telefone;

	@Column(name = "biografia")
	private String biografia;

	@Column(name = "TIPO_DA_CONTA")
	private String tipoDaConta;

}
