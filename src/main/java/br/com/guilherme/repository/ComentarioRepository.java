package br.com.guilherme.repository;

import br.com.guilherme.model.ComentarioModel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.math.BigDecimal;
import java.util.List;

@Repository
public interface ComentarioRepository extends JpaRepository<ComentarioModel, Long> {

    @Query("SELECT c from ComentarioModel c WHERE c.idaux = ?1")
    List<ComentarioModel> findComentariosById(long id);

}
