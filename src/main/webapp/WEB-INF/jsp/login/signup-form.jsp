<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>

    <head>
        <meta charset="ISO-8859-1">
        <title>Cadastrar</title>

        <c:set value="${pageContext.request.contextPath}" var="contextPath"/>

        <link href="${contextPath}/css/bootstrap.css" rel="stylesheet">
    </head>

    <body>
        <br>
        <div class="container text-center">
            <div>
                <h1>Cadastro de nova conta</h1>
            </div>

            <form:form modelAttribute="userModel" action="${contextPath}/process-register" method="post">

                <spring:hasBindErrors name="userModel">
                    <div class="alert alert-danger" role="alert">
                        <form:errors path="*" class="has-error"/>
                    </div>
                </spring:hasBindErrors>


                <div class="form-floating mb-3">
                    <form:input type="email" path="email" class="form-control" id="floatingInput"
                                placeholder="nome@exemplo.com.br"/>
                    <label for="floatingInput">Seu e-mail</label>
                </div>

                <div class="form-floating mb-3">
                    <form:input type="password" path="password" class="form-control" id="floatingPassword"
                                placeholder="Senha"/>
                    <label for="floatingPassword">Sua senha</label>
                </div>

                <div class="form-floating mb-3">
                    <form:input type="text" path="firstName" class="form-control" id="floatingInput" placeholder="Nome"/>
                    <label for="floatingInput">Seu Nome</label>
                </div>

                <div class="form-floating mb-3">
                    <form:input type="text" path="lastName" class="form-control" id="floatingInput"
                                placeholder="Área de atuação"/>
                    <label for="floatingInput">Sua área de atuação</label>
                </div>

                <div class="form-group">
                    <form:select path="tipoDaConta" class="form-select" aria-label="Default select example">
                        <option selected>Tipo da conta</option>
                        <form:option value="contratante" itemLabel="contratante"/>
                        <form:option value="prestador" itemLabel="prestador"/>
                    </form:select>
                </div>
                <br>
                <div class="form-floating mb-3">
                    <form:input type="text" path="cpf" class="form-control" id="floatingInput"
                                placeholder="111.111.111-11"/>
                    <label for="floatingInput">Seu CPF</label>
                </div>

                <div class="form-floating mb-3">
                    <form:input type="text" path="telefone" class="form-control" id="floatingInput"
                                placeholder="(11)99999-9999"/>
                    <label for="floatingInput">Seu Telefone</label>
                </div>

                <div class="form-group">
                    <form:select path="estado" class="form-select" aria-label="Default select example">
                        <option selected>Estado</option>
                        <form:option value="AC" itemLabel="Acre"/>
                        <form:option value="AL" itemLabel="Alagoas"/>
                        <form:option value="AP" itemLabel="Amapá"/>
                        <form:option value="AM" itemLabel="Amazonas"/>
                        <form:option value="BA" itemLabel="Bahia"/>
                        <form:option value="CE" itemLabel="Ceará"/>
                        <form:option value="DF" itemLabel="Distrito Federal"/>
                        <form:option value="ES" itemLabel="Espírito Santo"/>
                        <form:option value="GO" itemLabel="Goiás"/>
                        <form:option value="MA" itemLabel="Maranhão"/>
                        <form:option value="MT" itemLabel="Mato Grosso"/>
                        <form:option value="MS" itemLabel="Mato Grosso do Sul"/>
                        <form:option value="MG" itemLabel="Minas Gerais"/>
                        <form:option value="PA" itemLabel="Pará"/>
                        <form:option value="PB" itemLabel="Paraíba"/>
                        <form:option value="PR" itemLabel="Paraná"/>
                        <form:option value="PE" itemLabel="Pernambuco"/>
                        <form:option value="PI" itemLabel="Piauí"/>
                        <form:option value="RJ" itemLabel="Rio de Janeiro"/>
                        <form:option value="RN" itemLabel="Rio Grande do Norte"/>
                        <form:option value="RS" itemLabel="Rio Grande do Sul"/>
                        <form:option value="RO" itemLabel="Rondônia"/>
                        <form:option value="RR" itemLabel="Roraima"/>
                        <form:option value="SC" itemLabel="Santa Catarina"/>
                        <form:option value="SP" itemLabel="São Paulo"/>
                        <form:option value="SE" itemLabel="Sergipe"/>
                        <form:option value="TO" itemLabel="Tocantins"/>
                        <form:option value="EX" itemLabel="Estrangeiro"/>
                    </form:select>
                </div>
                <br>
                <div class="form-floating">
                    <form:textarea class="form-control" placeholder="Sobre você" path="biografia" id="floatingTextarea2"
                                   style="height: 100px"/>
                    <label for="floatingTextarea2">Sobre você</label>
                </div>

                <hr>
                <a class="btn btn-default btn-lg" href="${contextPath}/">Cancelar</a>
                <button type="submit" class="btn btn-primary btn-lg">Cadastrar</button>
                <br>
            </form:form>

        </div>
        <!-- Bootstrap Core JavaScript -->
        <script src="${contextPath}/js/bootstrap.bundle.js"></script>
    </body>

</html>