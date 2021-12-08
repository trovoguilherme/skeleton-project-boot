<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>

<head>

    <title>Editar Serviço</title>

    <c:set value="${pageContext.request.contextPath}" var="contextPath" />

    <link href="${contextPath}/css/bootstrap.css" rel="stylesheet">
    <meta charset="utf-8">

</head>

<body>
    <div class="container">
        <nav class="navbar navbar-expand-lg navbar-light bg-light">
            <div class="container-fluid">
                <a class="navbar-brand" href="${contextPath}/servico">Serviços</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse"
                    data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent"
                    aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page"
                                href="${contextPath}/servico/form?page=servico-novo">Cadastrar</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">Link</a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                                data-bs-toggle="dropdown" aria-expanded="false">
                                Dropdown
                            </a>
                            <ul class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <li><a class="dropdown-item" href="#">Action</a></li>
                                <li><a class="dropdown-item" href="#">Another action</a></li>
                                <li>
                                    <hr class="dropdown-divider">
                                </li>
                                <li><a class="dropdown-item" href="#">Something else here</a></li>
                            </ul>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link disabled">Disabled</a>
                        </li>
                    </ul>
                    <form class="d-flex">
                        <input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
                        <button class="btn btn-outline-success" type="submit">Search</button>
                    </form>
                </div>
            </div>
        </nav>

        <form:form modelAttribute="userModel" enctype="multipart/form-data" action="${contextPath}/perfil/editar" method="put">

            <spring:hasBindErrors name="userModel">
                <div class="alert alert-danger" role="alert">
                    <form:errors path="*" class="has-error" />
                </div>
            </spring:hasBindErrors>

            <div class="form-group">
                <label class="control-label" for="titulo">Email:</label>
                <form:input type="text" path="email" id="titulo" class="form-control" maxlength="50" size="50" />
                <font color="red">
                    <form:errors path="email" />
                </font><br />
            </div>

            <div class="form-group">
                <label class="control-label" for="titulo">Senha:</label>
                <form:input type="password" path="password" id="titulo" class="form-control" maxlength="50" size="50" />
                <font color="red">
                    <form:errors path="password" />
                </font><br />
            </div>

            <div class="form-group">
                <label class="control-label" for="categoria">Nome:</label>
                <form:input type="text" path="firstName" id="categoria" class="form-control" maxlength="50" size="50" />
                <font color="red">
                    <form:errors path="firstName" />
                </font><br />
            </div>

            <div class="form-group">
                <label class="control-label" for="categoria">Sobrenome:</label>
                <form:input type="text" path="lastName" id="categoria" class="form-control" maxlength="50" size="50" />
                <font color="red">
                    <form:errors path="lastName" />
                </font><br />
            </div>

            <div class="form-group">
                <form:select path="tipoDaConta" class="form-select" aria-label="Default select example">
                    <option selected>Tipo da conta</option>
                    <form:option value="contratante" itemLabel="contratante" />
                    <form:option value="prestador" itemLabel="prestador" />
                </form:select>
            </div>

            <div class="form-group">
                <label class="control-label" for="cpf">CPF:</label>
                <form:input type="text" path="cpf" id="cpf" class="form-control" maxlength="50" size="50" />
                <font color="red">
                    <form:errors path="cpf" />
                </font><br />
            </div>

            <div class="form-group">
                <label class="control-label" for="telefone">Telefone:</label>
                <form:input type="text" path="telefone" id="telefone" class="form-control" maxlength="50" size="50" />
                <font color="red">
                    <form:errors path="telefone" />
                </font><br />
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

            <div class="form-group">
                <label class="control-label" for="biografia">Biográfia:</label>
                <form:textarea id="biografia" class="form-control" path="biografia" rows="4" cols="100" />
                <font color="red">
                    <form:errors path="biografia" />
                </font><br />

            </div>

            <div>
                <label for="formFileLg" class="form-label">Foto de perfil</label>
                <input class="form-control form-control-lg" id="formFileLg" type="file" name="file">
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