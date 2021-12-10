<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <c:set value="${pageContext.request.contextPath}" var="contextPath"/>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" type="text/css">
  <link rel="stylesheet" href="${contextPath}/css-cadastrar-conta/theme.css" type="text/css">
</head>

<body>
  <nav class="navbar navbar-expand-md navbar-light">
    <div class="container"> <button class="navbar-toggler navbar-toggler-right border-0" type="button"
        data-toggle="collapse" data-target="#navbar6" style="">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbar6"> <a class="navbar-brand text-primary d-none d-md-block" href="${contextPath}/servico">
          <img class="img-fluid d-block d-inline-flex w-25" src="${contextPath}/imagens/nav_logo.png">
          <b> Sirvice<br></b>
        </a>
        <ul class="navbar-nav mx-auto">
          <li class="nav-item"> <a class="nav-link" href="#">&nbsp;</a> </li>
        </ul>
        <ul class="navbar-nav">
          <li class="nav-item" style=""><a class="nav-link text-primary" href="${contextPath}/logout">logout</a></li>
          <li class="nav-item" style=""><a href="${contextPath}/perfil"><img class="img-fluid rounded-circle d-block d-inline-flex" src="${contextPath}/imagens/${usuario.nomeImagem}" style="max-height: 50px; max-width: 50px;"></a></li>
        </ul>
      </div>
    </div>
  </nav>
  <div class="py-5" style="">
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <h3 class="d-inline-flex px-3" style="" ><a href="${contextPath}/servico">Home</a></h3>
          <h3 class="d-inline-flex px-3" style="" ><a href="${contextPath}/historico">Serviços</a></h3>
        </div>
      </div>
    </div>
  </div>
  <div class="py-3" style="">
    <div class="container">
      <div class="row">
        <div class="col-md-5 p-4">
          <h3 class="text-center">Perfil</h3>
          <div class="col-md-12" style="">
            <img class="d-block mx-auto rounded-circle" src="${contextPath}/imagens/${usuario.nomeImagem}" style="	max-height: 250px;	max-width: 250px;	min-width: 250px;	min-height: 250px;">
            <div class="text-center" style="form-group">
              <h3>Nota: ${rank}</h3>
            </div>
            <div class="form-group">
              <h5 class="text-left mt-2">${usuario.biografia}</h5>
            </div>
          </div>
        </div>
        <div class="col-md-7 p-4" style="">
          <form>
            <div class="form-row">
              <div class="form-group col-md-6"><label class="control-label" for="categoria"><b>Nome</b></label>
                <h5 class="text-left">${usuario.firstName} ${usuario.lastName}</h5>
              </div>
              <div class="form-group col-md-6">
                <b>Estado</b>
                <h5 class="text-left">${usuario.estado}</h5>
              </div>
            </div>
            <div class="form-row">
              <div class="form-group col-md-6">
                <b>E-mail</b>
                <h5 class="text-left">${usuario.email}</h5>
              </div>
              <div class="form-group col-md-6">
                <b>Tipo de conta</b>
                <h5 class="text-left">${usuario.tipoDaConta}</h5>
              </div>
            </div>
            <div class="form-row">
              <div class="form-group col-md-6">
                <b>Telefone</b>
                <h5 class="text-left">${usuario.telefone}</h5>
              </div>
              <div class="form-group col-md-6 d-flex align-items-center">
                <a class="btn btn-warning" href="https://api.whatsapp.com/send/?phone=${whatsapp}&text&app_absent=0">entrar em contato</a>
              </div>
            </div>
          </form>
          <a type="submit" class="btn mt-2 mr-2 btn-primary" href="${contextPath}/servico/cadastrar/${usuario.id}">cadastrar serviço</a>
        </div>
      </div>
    </div>
  </div>



  <div class="py-3">
    <div class="container">

        <div class="btn-group">
                  <a href="${contextPath}/rank/${usuario.id}" class="btn btn-primary active" aria-current="page">Rank</a>
              </div>

              <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal"
                      data-bs-whatever="@mdo">Comentar
              </button>

              <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                  <div class="modal-dialog">
                      <div class="modal-content">
                          <div class="modal-header">
                              <h5 class="modal-title" id="exampleModalLabel">Novo comentário</h5>
                              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                          </div>
                          <div class="modal-body">
                              <form:form modelAttribute="comentarioModel" action="${contextPath}/servico/comentario/${usuario.id}"
                                         method="post">
                                  <div class="mb-3">
                                      <label for="message-text" class="col-form-label">Message:</label>
                                      <form:textarea class="form-control" path="mensagem" id="message-text"/>
                                  </div>
                                  <div class="modal-footer">
                                      <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Fechar</button>
                                      <button type="submit" class="btn btn-primary">Comentar</button>
                                  </div>
                              </form:form>
                          </div>

                      </div>
                  </div>
              </div>


      <div class="row">
        <div class="col-md-12">
          <h3 class="text-center my-3" contenteditable="true"><b>Comentários</b></h3>
        </div>
      </div>
      <div class="row">
        <c:forEach items="${comentarios}" var="comentario">
          <div class="p-4 col-md-6">
            <img class="img-fluid d-block rounded-circle d-inline-flex" src="${contextPath}/imagens/${imagemDoComentario}" style="min-height: 60px; min-width: 60px; max-width: 60px; max-height: 60px;">
            <h4 class="d-inline-flex"> <b>${comentario.nome}</b></h4>
            <p class="py-2">${comentario.mensagem}<br></p>
            <h5 class="text-right">${comentario.dataDoComentario}</h5>
          </div>
        </c:forEach>
      </div>
    </div>
  </div>

    <div class="container">
            <div class="row">
              <div class="col-md-12" >

    <div class="table-responsive" style="">
                  <table class="table">
                    <thead>
                      <tr>
                        <th>Id</th>
                        <th>Título</th>
                        <th>Prestador</th>
                        <th>Status</th>
                        <th>Preço</th>
                        <th>Ação</th>
                      </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${servicosFinalizados}" var="servico">
                      <tr>
                        <td class="" style=""><b>${servico.id}</b></td>
                        <td>${servico.titulo}</td>
                        <td>${servico.emailPrestador}</td>
                        <td>${servico.status}</td>
                        <td>${servico.valor}</td>
                        <td><a href="${contextPath}/historico/servico/detalhe/${servico.id}" class="btn btn-warning d-flex justify-content-center align-items-center" style="	max-height: 20px;">Detalhes</a></td>
                      </tr>
                      </c:forEach>
                    </tbody>
                  </table>
                </div>

               </div>
            </div>
          </div>

    <!-- jQuery -->
    <script src="${contextPath}/js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="${contextPath}/js/bootstrap.bundle.js"></script>
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
    integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
    crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"
    integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut"
    crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
    integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
    crossorigin="anonymous"></script>
</body>

</html>