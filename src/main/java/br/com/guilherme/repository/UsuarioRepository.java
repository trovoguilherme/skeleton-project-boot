package br.com.guilherme.repository;

import br.com.guilherme.model.UsuarioModel;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UsuarioRepository extends JpaRepository<UsuarioModel, String> {

}
