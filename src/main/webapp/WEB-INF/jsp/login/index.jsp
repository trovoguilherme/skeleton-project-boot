<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<!DOCTYPE html>


<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">


    <c:set value="${pageContext.request.contextPath}" var="contextPath" />
  	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="${contextPath}/css-index/theme.css" type="text/css">

</head>

<body>
  <nav class="navbar navbar-expand-md navbar-light">
    <div class="container"> <button class="navbar-toggler navbar-toggler-right border-0" type="button" data-toggle="collapse" data-target="#navbar6">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbar6"> <a class="navbar-brand text-primary d-none d-md-block" href="${contextPath}/">
          <img class="img-fluid d-block d-inline-flex w-25" src="${contextPath}/imagens/nav_logo.png" >
          <b> Sirvice<br></b>
        </a>
        <ul class="navbar-nav mx-auto">
          <li class="nav-item"> <a class="nav-link" href="#">&nbsp;</a> </li>
        </ul>
        <ul class="navbar-nav">
          <li class="nav-item"> <a class="nav-link" href="${contextPath}/login">Log in</a> </li>
          <li class="nav-item"> <a class="nav-link text-primary" href="${contextPath}/registrar" >Registrar<br></a> </li>
          <li class="nav-item" style=""> <a class="nav-link text-primary" href="${contextPath}/esqueci/senha">Esqueci minha senha</a> </li>
        </ul>
      </div>
    </div>
  </nav>
  <div class="py-5" style="	background-image: linear-gradient(to bottom, rgba(204, 88, 88, 0.9), rgba(204, 88, 88, 1.0));	background-position: top left;	background-size: 100%;	background-repeat: repeat;">
    <div class="container">
      <div class="row">
        <div class="px-md-5 p-3 col-md-6 d-flex flex-column align-items-start justify-content-center">
          <div class="form-group" style="">
            <h2 style="">Encontre serviços freelance para o seu negócio</h2>
          </div>
        </div>
        <div class="col-md-6"> <img class="img-fluid d-block" src="${contextPath}/imagens/landingpage_header.svg"> </div>
      </div>
    </div>
  </div>
  <div class="py-3 text-center">
    <div class="container">
      <div class="row">
        <div class="col-md-12 text-center">
          <h1>Como funciona?</h1>
        </div>
      </div>
      <div class="row justify-content-center">
        <div class="col-lg-3 col-6 p-4"> <i class="d-block fa fa-circle fa-3x mb-2 text-muted"></i>
          <h4>Publicar</h4>
          <p>Fácil e prático, é só colocar seu projeto dentro de nosso marketplace e já pode começar a receber encomendas</p>
        </div>
        <div class="col-lg-3 col-6 p-4"> <i class="d-block fa fa-stop-circle-o fa-3x mb-2 text-muted"></i>
          <h4>Contratar</h4>
          <p>Faça a encomenda do serviço como se estivesse em uma loja</p>
        </div>
        <div class="col-lg-3 col-6 p-4"> <i class="d-block fa fa-stop-circle fa-3x mb-2 text-muted"></i>
          <h4>Personalize</h4>
          <p>Customize seu perfil para dar a sua cara para os produtos</p>
        </div>
        <div class="col-lg-3 col-6 p-4"> <i class="d-block fa fa-circle-o fa-3x mb-2 text-muted"></i>
          <h4>Dê seu feedback</h4>
          <p>Seu feedback sera recompensado em nossa plataforma</p>
        </div>
      </div>
    </div>
  </div>
  <div class="py-5" style="	background-image: linear-gradient(to bottom, rgba(120, 87, 183, 0.7), rgba(120, 87, 183, 0.9));	background-position: top left;	background-size: 100%;	background-repeat: repeat;">
    <div class="container">
      <div class="row">
        <div class="col-lg-6 order-2 order-lg-1 p-0"> <img class="img-fluid d-block" src="${contextPath}/imagens/landingpage_registrarse.jpg" style=""> </div>
        <div class="px-5 col-lg-6 d-flex flex-column order-1 order-lg-2 justify-content-center align-items-center" style="">
          <h3>Faça seu cadastro hoje e com seu perfil tanto contrate serviços quanto publique os seus próprios, um perfil único para todas as funcionalidades</h3>
          <form class="form-inline d-flex justify-content-center mb-4">
            <div class="input-group">
              <div class="input-group-append"> <button class="btn btn-primary" type="button" style="	min-width: 200px;	border-top-left-radius: 10px;	border-top-right-radius: 10px;	border-bottom-right-radius: 10px;	border-bottom-left-radius: 10px;" href="${contextPath}/register">Registrar-se</button> </div>
            </div>
          </form>
        </div>
      </div>
    </div>
  </div>
  <div class="">
    <div class="container">
      <div class="row">
        <div class="p-4 col-md-4">
          <h2 class="mb-4">Cadastro</h2>
          <p><a class="nav-link" href="${contextPath}/login">Log-in</a><br>
          <a class="nav-link text-primary" href="${contextPath}/registrar" >Registrar-se</a></p>
        </div>
        <div class="p-4 col-md-4">
          <h2 class="mb-4">Outros</h2>
          <ul class="list-unstyled"><a class="nav-link text-primary" href="${contextPath}/esqueci/senha">esqueci minha senha</a></ul>
        </div>
        <div class="p-4 col-md-4">
          <h2 class="mb-4">Contato</h2>
          <p>
              <i class="fa d-inline mr-3 text-muted fa-phone"></i>+11999181762</p>
          <p>
              <i class="fa d-inline mr-3 text-muted fa-envelope-o"></i>SuporteSirvice@hotmail.com</p>
        </div>
      </div>
    </div>
  </div>
  <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>

</body>

</html>