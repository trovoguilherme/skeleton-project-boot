<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>

<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <c:set value="${pageContext.request.contextPath}" var="contextPath" />
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
    type="text/css">
  <link rel="stylesheet" href="${contextPath}/css-cadastrar-conta/theme.css" type="text/css">

</head>

<body>
  <nav class="navbar navbar-expand-md navbar-light">
    <div class="container"> <button class="navbar-toggler navbar-toggler-right border-0" type="button"
        data-toggle="collapse" data-target="#navbar6" style="">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbar6"> <a class="navbar-brand text-primary d-none d-md-block"
          href="#">
          <img class="img-fluid d-block d-inline-flex w-25" src="${contextPath}/imagens/nav_logo.png">
          <b> Sirvice<br></b>
        </a>
        <ul class="navbar-nav mx-auto">
          <li class="nav-item"> <a class="nav-link" href="#">&nbsp;</a> </li>
        </ul>
        <ul class="navbar-nav">
          <li class="nav-item" style=""><a class="nav-link text-primary" href="${contextPath}/logout">logout</a>
          </li>
          <li class="nav-item" style=""><a href="${contextPath}/perfil"><img class="img-fluid rounded-circle d-block d-inline-flex" src="${contextPath}/imagens/${usuario.nomeImagem}" style="max-height: 50px; max-width: 50px;"></a></li>
        </ul>
      </div>
    </div>
  </nav>
  <div class="py-3" style="">
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <h3 class="d-inline-flex px-3 text-dark" style=""><a href="${contextPath}/">Home</a></h3>
          <h3 class="d-inline-flex px-3 text-primary"><a href="${contextPath}/">Serviços</a></h3>
        </div>

      </div>

    </div>

  </div>

  <div class="py-5">

    <div class="container">

      <div class="row">

        <div class="col-md-12 over the sky" style="">

          <div class="card d-inline-flex w-100">
            <form:form modelAttribute="servicoModel" action="${contextPath}/servico/cadastrar/${id}" method="post">
              <div class="card-body" style="">
                <b><label>Novo Serviço</label></b>
                <h4 class="card-title"></h4>
                <div class="form-group"> <b><label>Título</label> </b>
                  <form:input type="text" path="titulo" class="form-control text-body" id="floatingInput" style=""
                    required="required" />
                </div>
                <div class="form-group">
                  <div class="form-group"> <b><label>Categoria</label> </b>
                    <form:input type="text" path="categoria" class="form-control text-body" id="floatingInput" style=""
                      required="required" />
                  </div>
                  <div class="form-group"> <b><label>Linguagem</label> </b>
                    <form:input type="text" path="linguagem" class="form-control text-body" id="floatingInput" style=""
                      required="required" />
                  </div>
                </div>

                <div class="form-group">
                  <b><label>Descrição</label></b>
                  <form:textarea class="form-control mt-3" path="descricao" id="form43" rows="3" placeholder="Uma breve descrição sua" />
                </div>
                <div class="form-group"> <b><label>Valor</label> </b>
                  <form:input type="number" path="valor" class="form-control text-body" id="floatingInput" style=""
                    required="required" />
                </div>

                <div class="form-group">

                  <div class="form-group">
                                  <form:select path="status" class="form-select" aria-label="Default select example">
                                      <option selected>Status</option>
                                      <form:option value="aberto" itemLabel="Aberto"/>
                                      <form:option value="pausado" itemLabel="Pausado"/>
                                      <form:option value="fazendo" itemLabel="Fazendo"/>
                                      <form:option value="finalizado" itemLabel="Finalizado"/>
                                  </form:select>
                  </div>
                </div>
              </div>
          </div>
          <a href="${contextPath}/historico/aberto" class="btn px-3 mr-2 btn-danger">Cancelar<br></a>
          <button type="submit" class="btn px-3 mr-2 btn-primary">Atualizar<br></button>
          </form:form>
        </div>
      </div>
    </div>
  </div>
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
    integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"
    style=""></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"
    integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut"
    crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
    integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
    crossorigin="anonymous"></script>
</body>

</html>