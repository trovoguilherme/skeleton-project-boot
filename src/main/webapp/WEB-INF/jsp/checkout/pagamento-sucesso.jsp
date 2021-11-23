<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>

<head>

    <title>Pagar</title>

    <c:set value="${pageContext.request.contextPath}" var="contextPath" />
    <link href="${contextPath}/sucesso/sucesso-pagamento.css" rel="stylesheet">
    <link href="${contextPath}/css/bootstrap.css" rel="stylesheet">

</head>

<body>
    <div class="container">
       <div class="row">
          <div class="col-md-6 mx-auto mt-5">
             <div class="payment">
                <div class="payment_header">
                   <div class="check"><i class="fa fa-check" aria-hidden="true"></i></div>
                </div>
                <div class="content">
                   <h1>Pagameto com sucesso!</h1>
                   <p>Lorem ipsum, or lipsum as it is sometimes known, is dummy text used in laying out print, graphic or web designs. </p>
                   <a href="${contextPath}/servico">Voltar para home</a>
                </div>

             </div>
          </div>
       </div>
    </div>
</body>

</html>