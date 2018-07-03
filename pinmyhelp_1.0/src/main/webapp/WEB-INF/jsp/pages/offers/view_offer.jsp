<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib tagdir="/WEB-INF/tags" prefix="custom"%> 

<div class="row mt-5">
    <div class="col-md-4 mt-3">
        <h3>Solicita��o de ${offer.helpSolicitation.type.type}</h3>
        <hr>
        <h4>Descri��o da Solicita��o</h4> 
        <p>${offer.helpSolicitation.description}</p>
        <hr>
        <h4>Per�odo</h4>
        <p>Data de in�cio:  <custom:localDateFormat localDate="${offer.helpSolicitation.startDate}"/></p>
        <p>Data de fim:  <custom:localDateFormat localDate="${offer.helpSolicitation.endDate}"/></p>
        <hr>
        <h4>Observa��o sobre a oferta</h4> 
        <p>${offer.observation}</p>
        <hr>
        <h4>Situa��o da oferta</h4> 
        <p>${offer.status.status}</p>
    </div>
    <div class="col-md-4 mt-3">
        <h3>Requerente</h3>
        <table class="table table-striped">
            <c:if test="${not empty offer.helpSolicitation.claimant}">
                <tr>
                    <td><b>Nome</b></td>
                    <td>${offer.helpSolicitation.claimant.name}</td>
                </tr>
                <tr>
                    <td><b>CPF</b></td>
                    <td>${offer.helpSolicitation.claimant.cpf}</td>
                </tr>
                <tr>
                    <td><b>E-mail</b></td>
                    <td>${offer.helpSolicitation.claimant.email}</td>
                </tr>
                <tr>
                    <td><b>Telefone</b></td>
                    <td>${offer.helpSolicitation.claimant.firstPhone}</td>
                </tr>
            </c:if>
            <c:if test="${not empty offer.helpSolicitation.entity}">
                <tr>
                    <td><b>Nome</b></td>
                    <td>${offer.helpSolicitation.entity.name}</td>
                </tr>
                <tr>
                    <td><b>CPF</b></td>
                    <td>${offer.helpSolicitation.entity.cnpj}</td>
                </tr>
                <tr>
                    <td><b>E-mail</b></td>
                    <td>${offer.helpSolicitation.entity.email}</td>
                </tr>
                <tr>
                    <td><b>Telefone</b></td>
                    <td>${offer.helpSolicitation.entity.firstPhone}</td>
                </tr>
            </c:if>
        </table>
    </div>
    <div class="col-md-4 mt-3">
        <h3>Volunt�rio</h3>
        <jsp:include page="../user_info.jsp" flush="true" />
    </div>
</div>

<div class="clearfix"></div>
<a href="${pageContext.request.contextPath}/offers/my" class="float-right">Ver todas minhas ofertas</a>

