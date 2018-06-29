<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib tagdir="/WEB-INF/tags" prefix="custom"%>

<div class="row mt-5">
    <div class="col-md-8 mt-3">
        <h3>Descrição da Solicitação</h3>
        <div class="md-form">
            <textarea type="text" id="Form-requirement" name="description" class="md-textarea form-control" rows="2">${helpSolicitation.description}</textarea>
            <label for="Form-requirement">Descreva a sua necessidade</label>
            <form:errors path="helpSolicitation.description" cssStyle="color:red"/>
        </div>
        <hr>
        <h3>Tipo de ajuda</h3>
        <div class="row">
            <div class="col">
                <div class="form-group">
                    <select name="type_id" id="type_id" class="mdb-select form-control">
                        <option value="" disabled selected>Selecione um tipo</option>
                        <c:forEach var="helpType" items="${helpTypes}">
                            <option value="${helpType.id}" <c:if test="${helpSolicitation.type.id == helpType.id}">selected</c:if>>${helpType.type}</option>

                        </c:forEach>
                    </select>
                </div>
                <c:if test="${not empty errorHelpType}"><span class="error">${errorHelpType}</span></c:if>
                </div>
            </div>
            <hr>
            <h3>Meu endereço <a id="btn-get-address" class="btn btn-pink float-right waves-effect waves-light">Usar endereço atual</a></h3> 
            <div class="row height-60">
                <div class="col-8">
                    <div class="md-form">
                        <input type="text" name="address.postalCode" value="${address.postalCode}"  id="Form-cep" class="form-control">
                    <label for="Form-cep">CEP</label>
                    <form:errors path="helpSolicitation.address.postalCode" cssStyle="color:red"/>
                </div>
            </div>

            <div class="col-4">
                <div class="md-form">
                    <input type="text" name="address.state" value="${address.state}" id="Form-uf" class="form-control" >
                    <label for="Form-uf">UF</label>
                    <form:errors path="helpSolicitation.address.state" cssStyle="color:red"/>
                </div>
            </div>
        </div>

        <div class="md-form">
            <input type="text" name="address.city" value="${address.city}" id="Form-city" class="form-control" >
            <label for="Form-city">Cidade</label>
            <form:errors path="helpSolicitation.address.city" cssStyle="color:red"/>
        </div>

        <div class="row height-60">
            <div class="col-8">
                <div class="md-form">
                    <input type="text" name="address.street" value="${address.street}" id="Form-street" class="form-control" >
                    <label for="Form-street">Rua</label>
                    <form:errors path="helpSolicitation.address.street" cssStyle="color:red"/>
                </div>
            </div>

            <div class="col-4">
                <div class="md-form">
                    <input type="number" name="address.number" value="${address.number}" id="Form-number" class="form-control" min="0">
                    <label for="Form-number">Nº</label>
                    <form:errors path="helpSolicitation.address.number" cssStyle="color:red"/>
                </div>
            </div>
        </div>

        <div class="md-form">
            <input type="text" name="address.neighborhood" value="${address.neighborhood}" id="Form-neighborhood" class="form-control" >
            <label for="Form-neighborhood">Bairro</label>
            <form:errors path="helpSolicitation.address.neighborhood" cssStyle="color:red"/>
        </div>

        <%--     <div class="row">
                 <div class="col">  
                     <div class="md-form">
                         <input type="text" id="Form-address" name="Form-address" class="form-control" value="${claimant.address.street}, ${claimant.address.number} - ${claimant.address.neighborhood}, ${claimant.address.city} - ${claimant.address.state}, ${claimant.address.postalCode}, Brasil"/>
                         <input type="hidden" id="Form-latitude" name="latitude" value="${claimant.address.location.latitude}"/>
                         <input type="hidden" id="Form-longitude" name="longitude" value="${claimant.address.location.longitude}"/>
                         <label for="Form-address">Endereço</label>
                     </div>
                 </div>
             </div>    --%>
        <hr>
        <h3>Data</h3>
        <div class="row">
            <div class="col">
                <div class="md-form">
                    <input type="text" name="startDate" id="Form-start-date" value="<custom:localDateFormat localDate="${helpSolicitation.startDate}"/>" class="form-control">
                    <label for="Form-date">Data inicial</label>
                    <c:if test="${not empty errorStartDate}"><span class="error">${errorStartDate}</span></c:if>
                    </div>
                </div>
                <div class="col">
                    <div class="md-form">
                        <input type="text" name="endDate" id="Form-end-date" value="<custom:localDateFormat localDate="${helpSolicitation.endDate}"/>" class="form-control">
                    <label for="Form-time">Data final</label>
                    <c:if test="${not empty errorEndDate}"><span class="error">${errorStartDate}</span></c:if>
                    </div>
                </div>
            </div>

        <c:if test="${page == 'solicitations/edit'}">
            <input type="hidden" name="id" value="${id}"/>
        </c:if>

        <hr>          
        <button type="submit" class="btn btn-pink float-right waves-effect waves-light">Salvar</button></h3> 
    </div>
    <div class="col-md-4 mt-3">

        <h3>Minhas informações</h3>

        <!--Caso for uma entedidade, pode selecionar requerente
        <p><i>Caso for entidade</i></p>
        <div class="form-group mb-0 mt-4">
            <select name="objective" class="mdb-select form-control">
                <option value="" disabled selected>Selecione um requerente</option>
                <option value="1" selected>Pedro Soares</option>
                <option value="2">Maria Luísa</option>
            </select>
        </div>
        -->
        <c:if test="${not empty person}">
            <table class="table table-striped mt-3">
                <tr>
                    <td><b>Nome</b></td>
                    <td>${person.name}</td>
                </tr>
                <tr>
                    <td><b>CPF</b></td>
                    <td>${person.cpf}</td>         
                </tr>
                <tr>
                    <td><b>E-mail</b></td>
                    <td>${person.email}</td>
                </tr>
                <tr>
                    <td><b>Telefone</b></td>
                    <td>${person.firstPhone}</td>
                </tr>
            </table>
        </c:if>
        <c:if test="${not empty entity}">
            <table class="table table-striped mt-3">
                <tr>
                    <td><b>Nome</b></td>
                    <td>${entity.name}</td>
                </tr>
                <tr>
                    <td><b>CNPJ</b></td>
                    <td>${entity.cnpj}</td>
                </tr>
                <tr>
                    <td><b>E-mail</b></td>
                    <td>${entity.email}</td>
                </tr>
                <tr>
                    <td><b>Telefone</b></td>
                    <td>${entity.firstPhone}</td>
                </tr>
            </table>
        </c:if>
    </div>
</div>


<c:if test="${helpSolicitation.type != null}">
    <script>
        $(function () {
            $('#type_id').val('${helpSolicitation.type.getId()}');
        });
    </script>
</c:if>                    

<!-- Mask JQuery -->
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery.mask.min.js"></script>                                          
<script>
        $(function () {
            $('#btn-get-address').click(function () {
                if ("geolocation" in navigator) { //check if geolocation is available 
                    navigator.geolocation.getCurrentPosition(function (position) {
                        getPositionInfo(position);
                    });
                } else
                    alert("Geocalização não suportada pelo navegador atual.");
            });

            function getPositionInfo(position) {
                var GEOCODING = 'https://maps.googleapis.com/maps/api/geocode/json?latlng='
                        + position.coords.latitude + '%2C'
                        + position.coords.longitude + '&language=pt';
                var $inputlatitude = $('#Form-latitude');
                var $inputlongitude = $('#Form-longitude');
                $($inputlatitude).val(position.coords.latitude);
                $($inputlongitude).val(position.coords.longitude);
                $.getJSON(GEOCODING).done(function (location) {
                    showLocation(location);
                });
            }

            function showLocation(location) {
                if (location === null || location.results[0] === null || location.results[0].address_components === null) { // ok
                    alert("Não foi possível recuperar a localização atual. Verifique sua conexão com a internet.");
                    // $($buttonAddress).prop("disabled", false); // let's user try again...
                } else {
                    // var $input = $('#Form-address');
                    var address = location.results[0].address_components;
                    // $($input).val(location.results[0].formatted_address);
                    for (i in address) {
                        switch (String(address[i].types[0])) {
                            case "street_number":
                                $("#Form-number").focus();
                                $("#Form-number").val(String(address[i].long_name));
                                break;
                            case "route":
                                $("#Form-street").focus();
                                $("#Form-street").val(String(address[i].long_name));
                                break;
                            case "administrative_area_level_2":
                                $("#Form-city").focus();
                                $("#Form-city").val(String(address[i].long_name));
                                break;
                            case  "administrative_area_level_1":
                                $("#Form-uf").focus();
                                $("#Form-uf").val(String(address[i].short_name));
                                break;
                            case "postal_code":
                                $("#Form-cep").focus();
                                $("#Form-cep").val(String(address[i].long_name));
                                break;
                        }
                        /*  $($input).keyup(function (event) { // if user edit his address then active the button again
                         $($buttonAddress).prop("disabled", false);
                         }); */
                    }
                }
            }


            $("#Form-cep").mask("00.000-000", {clearIfNotMatch: true});
            $("#Form-start-date").mask("00/00/0000", {clearIfNotMatch: true});
            $("#Form-end-date").mask("00/00/0000", {clearIfNotMatch: true});
        });
</script>