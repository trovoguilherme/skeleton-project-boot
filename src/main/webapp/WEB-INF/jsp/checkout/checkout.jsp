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
        <button class="navbar-toggler navbar-toggler-right border-0" type="button" data-toggle="collapse"
                data-target="#navbar6" style="">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbar6"><a class="navbar-brand text-primary d-none d-md-block"
                                                              href="#">
            <img class="img-fluid d-block d-inline-flex w-25" src="${contextPath}/imagens/nav_logo.png">
            <b> Sirvice<br></b>
        </a>
            <ul class="navbar-nav mx-auto">
                <li class="nav-item"><a class="nav-link" href="#">&nbsp;</a></li>
            </ul>
            <ul class="navbar-nav">
                <li class="nav-item" style=""><a class="nav-link text-primary" href="${contextPath}/logout">logout</a>
                </li>
                <li class="nav-item" style=""><a href="${contextPath}/"><img
                        class="img-fluid rounded-circle d-block d-inline-flex"
                        style="max-height: 50px; max-width: 50px;"
                        src="${contextPath}/imagens/${usuario.nomeImagem}"></a></li>
            </ul>
        </div>
    </div>
</nav>
<div class="py-5" style="">
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <div class="w-full text-left p-0 py-0 px-0">
                    <h1 class="text-xl font-medium text-left py-2 px-2">Carrinho</h1>
                </div>
                <div class="col-md-12 my-3">
                    <h3 class="d-inline-flex">Criar website</h3><i
                        class="fa fa-close text-xs font-medium justify-content-end d-inline-flex mx-3 fa-2x"></i><span
                        class="md:text-md font-medium my-2 d-flex">Lorem ipsum dolor sit amet, consectetur adipiscing elit. In eget eleifend diam, id interdum arcu. Vivamus sagittis bibendum neque, et lobortis eros scelerisque sit amet. Nullam non libero ipsum. Vestibulum eu egestas erat. Vivamus elementum augue quis at.</span>
                    <div class="flex justify-between items-center mt-6 pt-6 col-md-12">
                        <div class="flex items-center col-md-6">
                            <div class="flex flex-col ml-3"></div>
                        </div>
                        <b>
                        </b>
                        <div class="flex justify-center items-center my-2"><b>
                            <span class="md:text-md font-medium d-flex my-1">html/css</span>
                            <div class="pr-8 "><span class="text-xs font-medium p-1 px-2 bg-warning d-inline-flex my-1">web</span>
                            </div>
                            <b>
                                <h3 class="md:text-md font-medium my-1 justify-content-end d-flex">R$500.00</h3>
                            </b>
                        </b>
                            <div></div>
                        </div>
                    </div>
                    <h5 class="md:text-md font-medium d-inline-flex justify-content-start col-md-5 my-1"
                        contenteditable="true">voltar para serviços</h5>
                    <h5 class="md:text-md font-medium justify-content-end d-inline-flex text-primary col-md-5 my-1 ml-5">
                        Subtotal - R$500.00</h5>
                </div>
                <div class="col-md-12 my-3">
                    <h3 class="d-inline-flex">Criar website</h3><i
                        class="fa fa-close text-xs font-medium justify-content-end d-inline-flex mx-3 fa-2x"></i><span
                        class="md:text-md font-medium my-2 d-flex">Lorem ipsum dolor sit amet, consectetur adipiscing elit. In eget eleifend diam, id interdum arcu. Vivamus sagittis bibendum neque, et lobortis eros scelerisque sit amet. Nullam non libero ipsum. Vestibulum eu egestas erat. Vivamus elementum augue quis at.</span>
                    <div class="flex justify-between items-center mt-6 pt-6 col-md-12">
                        <div class="flex items-center col-md-6">
                            <div class="flex flex-col ml-3"></div>
                        </div>
                        <b>
                        </b>
                        <div class="flex justify-center items-center my-2"><b>
                            <span class="md:text-md font-medium d-flex my-1">html/css</span>
                            <div class="pr-8 "><span class="text-xs font-medium p-1 px-2 bg-warning d-inline-flex my-1">web</span>
                            </div>
                            <b>
                                <h3 class="md:text-md font-medium my-1 justify-content-end d-flex">R$500.00</h3>
                            </b>
                        </b>
                            <div></div>
                        </div>
                    </div>
                    <h5 class="md:text-md font-medium d-inline-flex justify-content-start col-md-5 my-1"
                        contenteditable="true">voltar para serviços</h5>
                    <h5 class="md:text-md font-medium justify-content-end d-inline-flex text-primary col-md-5 my-1 ml-5">
                        Subtotal - R$500.00</h5>
                </div>
            </div>



                <div class="col-md-6" style="">
                    <div class="w-full bg-dark text-light p-4 py-5 px-5" style="">
                        <h3 class="text-xl font-medium text-center">Detalhes do pagamento</h3>
                        <div class="form-group my-2 py-1">
                            <label class="control-label" for="titulo">Nome do card holder:</label>
                            <input path="#" type="text" class="form-control" id="form36" placeholder="Nome"/>
                        </div>
                        <div class="form-group my-2 py-1">
                            <label class="control-label" for="titulo">Número do cartão:</label>
                            <div class="form-group"><input path="#" type="text" class="form-control" id="form36"
                                                           placeholder="0000 0000 0000 0000"/></div>
                        </div>
                        <div class="form-row my-2 py-1">
                            <label class="control-label col-md-8 200px" for="titulo" style="">Data de
                                validade</label><label class="control-label col-md-4 200px" for="titulo"
                                                       style="">CVV</label>
                            <div class="form-group col-md-4" style=""><input type="number" class="form-control"
                                                                             id="form36" placeholder="mm"
                                                                             style="max-width: 200px;"/></div>
                            <div class="form-group col-md-4" style=""><input type="number" class="form-control w-100"
                                                                             id="form36" placeholder="yyyy"
                                                                             style="	max-width: 200px;"/>
                            </div>
                            <div class="form-group col-md-4" style=""><input type="number" class="form-control w-100"
                                                                             id="form36" placeholder="XXX"
                                                                             style="	max-width: 200px;"/>
                            </div>
                        </div>
                        <a href="${contextPath}/checkout/sucesso" class="btn btn-primary mt-2 justify-content-center d-flex" style="">Check out</a>
                    </div>
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