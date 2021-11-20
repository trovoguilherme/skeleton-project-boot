package br.com.guilherme.repository;

import br.com.guilherme.model.ServicoModel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.util.List;


public interface ServicoRepository extends JpaRepository<ServicoModel, Long> {

    @Query("SELECT s from ServicoModel s WHERE s.categoria = ?1")
    List<ServicoModel> findServicoByCategoria(String categoria);

    @Transactional
    @Modifying
    @Query("DELETE ServicoModel WHERE id = ?1")
    void deleteById(long id);

}
