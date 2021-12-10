<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <c:set value="${pageContext.request.contextPath}" var="contextPath"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"
          type="text/css">
    <link rel="stylesheet" href="https://static.pingendo.com/bootstrap/bootstrap-4.3.1.css">
</head>

<body>
<nav class="navbar navbar-expand-md navbar-light">
    <div class="container">
        <button class="navbar-toggler navbar-toggler-right border-0" type="button"
                data-toggle="collapse" data-target="#navbar6" style="">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbar6"><a class="navbar-brand text-primary d-none d-md-block" href="${contextPath}/servico">
            <img class="img-fluid d-block d-inline-flex w-25" src="${contextPath}/imagens/nav_logo.png">
            <b> Sirvice<br></b>
        </a>
            <ul class="navbar-nav mx-auto">
                <li class="nav-item"><a class="nav-link" href="#">&nbsp;</a></li>
            </ul>
            <ul class="navbar-nav">
                <li class="nav-item" style=""><a class="nav-link text-primary" href="${contextPath}/logout">logout</a></li>
                <li class="nav-item" style=""><a href="${contextPath}/"><img class="img-fluid rounded-circle d-block d-inline-flex" style="max-height: 50px; max-width: 50px;" src="${contextPath}/imagens/${usuario.nomeImagem}"></a></li>
            </ul>
        </div>
    </div>
</nav>
<div class="py-5" style="">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h3 class="d-inline-flex px-3" style=""><a href="${contextPath}/">Serviços ativos</a></h3>
                <h3 class="d-inline-flex px-3"><a href="${contextPath}/">Serviços novos</a></h3>
                <h3 class="d-inline-flex px-3 text-primary"><a href="${contextPath}/">Histórico</a></h3>
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
                    <img class="d-block rounded-circle mx-auto" src="${contextPath}/imagens/${usuario.nomeImagem}" style="max-height: 250px;	max-width: 250px;	min-width: 250px;	min-height: 250px;">
                    <div class="text-center" style="form-group">
                        <img class="d-block mx-auto d-inline-flex"src="${contextPath}/imagens/notaPerfil.png" style="max-height: 25px; max-width: 25px;">
                        <img class="d-block mx-auto d-inline-flex" src="${contextPath}/imagens/notaPerfil.png" style="max-height: 25px; max-width: 25px;">
                        <img class="d-block mx-auto d-inline-flex" src="${contextPath}/imagens/notaPerfil.png" style="max-height: 25px; max-width: 25px;">
                        <img class="d-block mx-auto d-inline-flex" src="${contextPath}/imagens/notaPerfil.png" style="max-height: 25px; max-width: 25px;">
                        <img class="d-block mx-auto d-inline-flex" src="${contextPath}/imagens/notaPerfil.png" style="max-height: 25px; max-width: 25px;">
                    </div>
            <form:form modelAttribute="userModel" enctype="multipart/form-data" action="${contextPath}/perfil/editar" method="put">
                    <div class="form-group">
                        <form:textarea class="form-control mt-3" path="biografia" id="form43" rows="3" placeholder="Uma breve descrição sua"/>
                    </div>
                </div>
            </div>
            <div class="col-md-7 p-4" style="">


                    <div class="form-row">

                        <div class="form-group col-md-6">
                            <form:input type="text" path="firstName" class="form-control" id="form36" placeholder="Nome"/>
                        </div>

                        <div class="form-group col-md-6">
                            <form:input type="text" path="lastName" class="form-control" id="form37" placeholder="Sobrenome"/>
                        </div>

                    </div>

                    <div class="form-group">
                        <form:input type="email" path="email" class="form-control" id="form38" placeholder="E-mail"/>
                    </div>

                    <div class="form-group">
                        <form:input type="password" path="password" class="form-control" id="form39" placeholder="Senha"/>
                    </div>

                    <div class="form-row">

                        <div class="form-group col-md-6">
                            <h5 class="text-center">${usuario.cpf}</h5>
                            <form:input type="hidden" path="cpf" value="${usuario.cpf}"/>
                        </div>

                        <div class="form-group col-md-6">
                            <h5 class="text-center"><b>${usuario.tipoDaConta}</b></h5>
                            <form:input type="hidden" path="tipoDaConta" value="${usuario.tipoDaConta}"/>
                        </div>

                    </div>
                    <div class="form-row">
                        <div class="form-group col-md-6">
                            <form:input type="text" path="telefone" class="form-control" id="form40" placeholder="Telefone"/>
                        </div>

                        <div class="form-group col-md-6">
                            <div class="form-group">
                                <form:select path="estado" class="form-form:select" aria-label="Default form:select example" style="	min-height: 35px;	min-width: 275px;">
                                    <option selected>Estado</option>
                                    <form:option value="AC" itemlabel="Acre"/>

                                    <form:option value="AL" itemlabel="Alagoas"/>

                                    <form:option value="AP" itemlabel="Amap�"/>

                                    <form:option value="AM" itemlabel="Amazonas"/>

                                    <form:option value="BA" itemlabel="Bahia"/>

                                    <form:option value="CE" itemlabel="Cear�"/>

                                    <form:option value="DF" itemlabel="Distrito Federal"/>

                                    <form:option value="ES" itemlabel="Esp�rito Santo"/>

                                    <form:option value="GO" itemlabel="Goi�s"/>

                                    <form:option value="MA" itemlabel="Maranh�o"/>

                                    <form:option value="MT" itemlabel="Mato Grosso"/>

                                    <form:option value="MS" itemlabel="Mato Grosso do Sul"/>

                                    <form:option value="MG" itemlabel="Minas Gerais"/>

                                    <form:option value="PA" itemlabel="Par�"/>

                                    <form:option value="PB" itemlabel="Para�ba"/>

                                    <form:option value="PR" itemlabel="Paran�"/>

                                    <form:option value="PE" itemlabel="Pernambuco"/>

                                    <form:option value="PI" itemlabel="Piau�"/>

                                    <form:option value="RJ" itemlabel="Rio de Janeiro"/>

                                    <form:option value="RN" itemlabel="Rio Grande do Norte"/>

                                    <form:option value="RS" itemlabel="Rio Grande do Sul"/>

                                    <form:option value="RO" itemlabel="Rond�nia"/>

                                    <form:option value="RR" itemlabel="Roraima"/>

                                    <form:option value="SC" itemlabel="Santa Catarina"/>

                                    <form:option value="SP" itemlabel="S�o Paulo"/>

                                    <form:option value="SE" itemlabel="Sergipe"/>

                                    <form:option value="TO" itemlabel="Tocantins"/>

                                    <form:option value="EX" itemlabel="Estrangeiro"/>

                                </form:select>
                            </div>
                        </div>
                    </div>
                    <div>
                        <label for="formFileLg" class="form-label">Foto de perfil</label>
                        <input class="form-control form-control-lg" id="formFileLg" type="file" name="file">
                    </div>

                    <a class="btn btn-danger mt-2 mr-2" href="${contextPath}/servico">Cancelar<br></a>
                    <button type="submit" class="btn btn-primary mt-2 mr-2" href="${contextPath}/">Atualizar</button>

                </form:form>


            </div>
        </div>
    </div>
</div>

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