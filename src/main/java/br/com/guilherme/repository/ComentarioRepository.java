package br.com.guilherme.repository;

import br.com.guilherme.model.ComentarioModel;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ComentarioRepository extends JpaRepository<ComentarioModel, Long> {
}
