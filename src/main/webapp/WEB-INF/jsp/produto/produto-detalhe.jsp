<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>

<head>

    <title>Produtos - Detalhe</title>
    
    <c:set value="${pageContext.request.contextPath}" var="contextPath"/>
    
    <link href="${contextPath}/css/bootstrap.css" rel="stylesheet">
    <link href="${contextPath}/css/small-business.css" rel="stylesheet">

</head>

<body>
    
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container">
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li>
                        <a href="${contextPath}/produto">Produtos</a>
                    </li>
                    <li>
                    	<a href="${contextPath}/categoria">Categorias</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container">
        <div class="row">
            <div class="col-lg-12">
                <div class="well">
					
					<h2>Produto</h2>
					
						<div class="form-group">
							<label class="control-label" for="nome">Nome:</label>
							<b>${produto.nome}</b>
                        </div>
                        
                        <div class="form-group">
							<label class="control-label" for="nome">Categoria:</label>
							<label class="label label-default">${produto.categoria.nomeCategoria}</label>
                        </div>
                        
                        <div class="form-group">
							<label class="control-label" for="nome">Marca:</label>
							<label class="label label-default">${produto.marca.nomeMarca}</label>
                        </div>
                        
                        <div class="form-group">
							<label class="control-label" for="lojas">Lojas:</label>
							<c:forEach items="${produto.lojas}" var="lojas">
								<label class="label label-default">${lojas.nomeLoja}</label>
                        	</c:forEach>
                        </div>
                        
                        <div class="form-group">
							<label class="label label-default">${produto.sku}</label>
						</div>
						
						<div class="form-group">
							<label class="control-label" for="mesnagem">Descrição:</label>
							<label class="label label-default">${produto.descricao}</label>
						</div>
						
						<div class="form-group">
							<label class="control-label" for="preco">Preço:</label>
							<label class="label label-default">${produto.preco}</label>
						</div>
						
						<div class="form-group">
							<label class="control-label" for="mesnagem">Características:</label>
							<label class="label label-default">${produto.caracteristicas}</label>
						</div>
						<hr>
						
						<a class="btn btn-default btn-lg" href="${contextPath}/produto">Voltar</a>
                            
                        <br>
                        <br>
					
                </div>
            </div>
        </div>
    </div>

    <!-- jQuery -->
    <script src="${contextPath}/js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="${contextPath}/js/bootstrap.min.js"></script>

</body>
</html>