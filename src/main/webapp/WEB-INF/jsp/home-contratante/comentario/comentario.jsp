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


        <h1>Comentário</h1>

        <form:form modelAttribute="comentarioModel" action="${contextPath}/servico/comentario/${id}" method="post">

            <spring:hasBindErrors name="comentarioModel">
                <div class="alert alert-danger" role="alert">
                    <form:errors path="*" class="has-error" />
                </div>
            </spring:hasBindErrors>


            <div class="form-floating mb-3">
                <form:input type="text" path="mensagem" class="form-control" id="floatingInput"
                    placeholder="Comentário" />
                <label for="floatingInput">Comentário</label>
            </div>

            <hr>

            <a class="btn btn-default btn-lg" href="${contextPath}/servico">Cancelar</a>
            <button type="submit" class="btn btn-primary btn-lg">Gravar</button>

            <br>
            <br>
        </form:form>

    </div>
    <!-- Bootstrap Core JavaScript -->
    <script src="${contextPath}/js/bootstrap.bundle.js"></script>
</body>

</html>