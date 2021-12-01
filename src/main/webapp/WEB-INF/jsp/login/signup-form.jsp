<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>

<head>
    <meta charset="ISO-8859-1">
    <title>Cadastrar</title>

    <c:set value="${pageContext.request.contextPath}" var="contextPath" />

    <link href="${contextPath}/css/bootstrap.css" rel="stylesheet">
</head>

<body>
    <div class="container text-center">
        <div>
            <h1>Cadastrar - Sign Up</h1>
        </div>

        <form:form modelAttribute="userModel" action="${contextPath}/process-register" method="post">

            <spring:hasBindErrors name="userModel">
                <div class="alert alert-danger" role="alert">
                    <form:errors path="*" class="has-error" />
                </div>
            </spring:hasBindErrors>


            <div class="form-floating mb-3">
                <form:input type="email" path="email" class="form-control" id="floatingInput"
                    placeholder="nome@exemplo.com.br" />
                <label for="floatingInput">Email</label>
            </div>
            <div class="form-floating mb-3">
                <form:input type="password" path="password" class="form-control" id="floatingPassword"
                    placeholder="Senha" />
                <label for="floatingPassword">Senha</label>
            </div>


            <div class="form-floating mb-3">
                <form:input type="text" path="firstName" class="form-control" id="floatingInput" placeholder="Nome" />
                <label for="floatingInput">Nome</label>
            </div>

            <div class="form-floating mb-3">
                <form:input type="text" path="lastName" class="form-control" id="floatingInput"
                    placeholder="Sobrenome" />
                <label for="floatingInput">Sobrenome</label>
            </div>

            <div class="form-group">
                <form:select path="tipoDaConta" class="form-select" aria-label="Default select example">
                    <option selected>Tipo da conta</option>
                    <form:option value="contratante" itemLabel="contratante" />
                    <form:option value="prestador" itemLabel="prestador" />
                </form:select>
            </div>

            <div class="form-floating mb-3">
                <form:input type="text" path="cpf" class="form-control" id="floatingInput"
                    placeholder="111.111.111-11" />
                <label for="floatingInput">CPF</label>
            </div>

            <div class="form-floating mb-3">
                <form:input type="text" path="telefone" class="form-control" id="floatingInput"
                    placeholder="(11)99999-9999" />
                <label for="floatingInput">Telefone</label>
            </div>

            <div class="form-floating mb-3">
                <form:input type="text" path="estado" class="form-control" id="floatingInput" placeholder="São Paulo" />
                <label for="floatingInput">Estado</label>
            </div>

            <div class="form-floating">
                <form:textarea class="form-control" placeholder="Breve decrição" path="biografia" id="floatingTextarea2" style="height: 100px"/>
                    <label for="floatingTextarea2">Comments</label>
            </div>

            <hr>

            <a class="btn btn-default btn-lg" href="${contextPath}/">Cancelar</a>
            <button type="submit" class="btn btn-primary btn-lg">Gravar</button>

            <br>
            <br>
        </form:form>

    </div>
    <!-- Bootstrap Core JavaScript -->
    <script src="${contextPath}/js/bootstrap.bundle.js"></script>
</body>

</html>