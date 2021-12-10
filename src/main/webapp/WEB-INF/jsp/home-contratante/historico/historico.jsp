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
      <div class="container"> <button class="navbar-toggler navbar-toggler-right border-0" type="button" data-toggle="collapse" data-target="#navbar6" style="">
          <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbar6"> <a class="navbar-brand text-primary d-none d-md-block" href="#">
            <img class="img-fluid d-block d-inline-flex w-25" src="${contextPath}/imagens/nav_logo.png">
            <b> Sirvice<br></b>
          </a>
          <ul class="navbar-nav mx-auto">
            <li class="nav-item"> <a class="nav-link" href="#">&nbsp;</a> </li>
          </ul>
          <ul class="navbar-nav">
            <li class="nav-item" style=""><a class="nav-link text-primary" href="${contextPath}/logout">logout</a></li>
            <li class="nav-item" style=""><a href="${contextPath}/"><img class="img-fluid rounded-circle d-block d-inline-flex" src="${contextPath}/imagens/${usuario.nomeImagem}" style="max-height: 50px; max-width: 50px;"></a></li>
          </ul>
        </div>
      </div>
    </nav>
    <div class="py-3" style="">
      <div class="container">
        <div class="row">
          <div class="col-md-12">
            <h3 class="d-inline-flex px-3 text-dark" style=""><a href="${contextPath}/servico">Home</a></h3>
            <h3 class="d-inline-flex px-3 text-primary"><a href="${contextPath}/historico/aberto">Serviços</a></h3>
          </div>
        </div>
      </div>
    </div>
    <div class="" style="">
      <div class="container">
        <div class="row">
          <div class="col-md-12" >
            <ul class="nav nav-tabs">
              <li class="nav-item">
                <a class="nav-link active" aria-current="page" href="${contextPath}/historico">Todos</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="${contextPath}/historico/aberto">Abertos</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="${contextPath}/historico/fazendo">Fazendo</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="${contextPath}/historico/pausado">Pausado</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" href="${contextPath}/historico/finalizado">Finalizado</a>
              </li>
            </ul>
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
                <c:forEach items="${servicos}" var="servico">
                <c:set var="corStatus" value="${servico.status}" scope="page"/>
                  <tr>
                    <td class="" style=""><b>${servico.id}</b></td>
                    <td>${servico.titulo}</td>
                    <td>${servico.emailPrestador}</td>
                    <c:if test="${corStatus == 'aberto'}">
                        <td class="bg-secondary"><b>${servico.status}</b></td>
                    </c:if>

                    <c:if test="${corStatus == 'fazendo'}">
                        <td class="bg-success"><b>${servico.status}</b></td>
                    </c:if>

                    <c:if test="${corStatus == 'pausado'}">
                        <td class="bg-danger"><b>${servico.status}</b></td>
                    </c:if>

                    <c:if test="${corStatus == 'finalizado'}">
                        <td class="bg-info"><b>${servico.status}</b></td>
                    </c:if>

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
    </div>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

</body>

</html>