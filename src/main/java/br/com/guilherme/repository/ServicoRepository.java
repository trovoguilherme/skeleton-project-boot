package br.com.guilherme.repository;

import br.com.guilherme.model.ComentarioModel;
import br.com.guilherme.model.ServicoModel;
import br.com.guilherme.model.UserModel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;


public interface ServicoRepository extends JpaRepository<ServicoModel, Long> {

    @Query("SELECT s from ServicoModel s WHERE s.categoria = ?1")
    List<ServicoModel> findServicoByCategoria(String categoria);

    @Query("SELECT s from ServicoModel s WHERE s.status = ?1 AND s.idaux = ?2")
    List<ServicoModel> findServicoByStatusAndId(String status, long id);

    @Transactional
    @Modifying
    @Query("DELETE ServicoModel WHERE id = ?1")
    void deleteById(long id);

    @Query("SELECT s from ServicoModel s WHERE s.idaux = ?1 AND s.id = ?2")
    ServicoModel findSThisServiceById(long idaux, long id);

    @Query("SELECT s from ServicoModel s WHERE s.idaux = ?1")
    List<ServicoModel> findServicosById(long id);

    @Query("SELECT s from ServicoModel s WHERE s.usuarioServico = ?1 AND s.status = ?2")
    List<ServicoModel> findServicosMyServicesByStatus(UserModel userModel, String status);

    @Query("SELECT s from ServicoModel s WHERE s.idaux = ?1 AND s.status = ?2")
    List<ServicoModel> findServicosMyServicesByStatusPrestador(long idaux, String status);

    @Query("SELECT s from ServicoModel s WHERE s.usuarioServico = ?1")
    List<ServicoModel> findMyServices(UserModel userModel);

}
