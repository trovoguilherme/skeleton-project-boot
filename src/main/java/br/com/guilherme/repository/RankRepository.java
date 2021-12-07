package br.com.guilherme.repository;

import br.com.guilherme.model.RankModel;
import br.com.guilherme.model.ServicoModel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface RankRepository extends JpaRepository<RankModel, Long> {

    @Query("SELECT r from RankModel r WHERE r.idaux = ?1")
    List<RankModel> findRanksById(long id);

}
