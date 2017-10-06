<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<div class="panel panel2 container-fluid" id="addressDataShow">


    <div class="row">
        <div class="col-md-9" align="left">
            <label class="caption">Адресные данные</label>
        </div>
        <div class="col-md-3">
            <button class="btn btn-link infoC" ng-click="editAddressData()">Редактировать</button>
        </div>
    </div>
    <hr>

    <div class="row">
        <div class="col-sm-2 info" align="right" style="padding-right: 6px;">
            Место рождения
        </div>
        <div class="col-sm-10 info2" align="left" style="padding-left: 6px;">
             {{cadet.addressData.birthData.subjectOfPlaceOfBirthFullName+
                ',&nbsp;'+cadet.addressData.birthData.cityOfPlaceOfBirthTypeName+cadet.addressData.birthData.cityOfPlaceOfBirth}}

        </div>
    </div>
<br>
    <div class="row">
        <div class="col-sm-2 info" align="right" style="padding-right: 6px;">
            Адрес регистрации
        </div>
        <div class="col-sm-10 info2" align="left" style="padding-left: 6px;">
            {{cadet.addressData.registeredData.subjectOfRegisteredAddressFullName
            +(',&nbsp;'+cadet.addressData.registeredData.cityOfRegisteredAddressTypeName+cadet.addressData.registeredData.cityOfRegisteredAddress)
            +(',&nbsp;'+cadet.addressData.registeredData.streetOfRegisteredAddressTypeName+cadet.addressData.registeredData.streetOfRegisteredAddress)
            +(cadet.addressData.registeredData.houseOfRegisteredAddress!=''?(',&nbsp;д.
            '+cadet.addressData.registeredData.houseOfRegisteredAddress):'')
            +(cadet.addressData.registeredData.buildingOfRegisteredAddress!=''?(',&nbsp;корп.
            '+cadet.addressData.registeredData.buildingOfRegisteredAddress):'')
            +(cadet.addressData.registeredData.apartmentOfRegisteredAddress!=''?(',&nbsp;кв.
            '+cadet.addressData.registeredData.apartmentOfRegisteredAddress):'')
            +(cadet.addressData.registeredData.indexOfRegisteredAddress!=''?(',&nbsp;индекс'+cadet.addressData.registeredData.indexOfRegisteredAddress):'')}}
        </div>
    </div>
<br>
    <div class="row">
        <div class="col-sm-2 info" align="right" style="padding-right: 6px;">
            Фактический адрес
        </div>
        <div class="col-sm-10 info2" align="left" style="padding-left: 6px;">
            {{cadet.addressData.actualData.subjectOfActualAddress+'&nbsp;'+cadet.addressData.actualData.subjectOfActualAddressTypeName
            +(',&nbsp;'+cadet.addressData.actualData.cityOfActualAddressTypeName+cadet.addressData.actualData.cityOfActualAddress)
            +(',&nbsp;'+cadet.addressData.actualData.streetOfActualAddressTypeName+cadet.addressData.actualData.streetOfActualAddress)
            +(cadet.addressData.actualData.houseOfActualAddress!=''?(',&nbsp;д.
            '+cadet.addressData.actualData.houseOfActualAddress):'')
            +(cadet.addressData.actualData.buildingOfActualAddress!=''?(',&nbsp;корп.
            '+cadet.addressData.actualData.buildingOfActualAddress):'')
            +(cadet.addressData.actualData.apartmentOfActualAddress!=''?(',&nbsp;кв.
            '+cadet.addressData.actualData.apartmentOfActualAddress):'')
            +(cadet.addressData.actualData.indexOfActualAddress!=''?(',&nbsp;индекс'+cadet.addressData.actualData.indexOfActualAddress):'')}}
        </div>

    </div>

</div>


<div class="panel panel2 container-fluid" id="addressDataEdit" style="display: none">


    <div class="row">
        <div class="col-md-9" align="left">
            <label class="caption">Адресные данные</label>
        </div>
    </div>
    <hr>

    <jsp:include page="../editForms/addressDataEdit.jsp"/>
    <hr>
    <br>
    <button class="btn btn-success" ng-click="saveAndLoadAddressData()">Сохранить</button>

</div>

