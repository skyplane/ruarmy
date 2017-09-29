<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<div class="panel panel2 container-fluid" id="addressDataShow">


    <div class="row">
        <div class="col-md-9" align="left">
            <label class="caption">Адресные данные</label>
        </div>
        <div class="col-md-3">
            <button class="btn btn-link" ng-click="editAddressData()">Редактировать</button>
        </div>
    </div>


    <div class="row">
        <div class="col-sm-2 info" align="right" style="padding-right: 6px;">
            Место рождения
        </div>
        <div class="col-sm-10 info2" align="left" style="padding-left: 6px;">
             {{cadet.addressData.birthData.subjectOfPlaceOfBirthTypeName+cadet.addressData.birthData.subjectOfPlaceOfBirth+
                ',&nbsp;'+cadet.addressData.birthData.cityOfPlaceOfBirthTypeName+cadet.addressData.birthData.cityOfPlaceOfBirth}}

        </div>
    </div>
<br>
    <div class="row">
        <div class="col-sm-2 info" align="right" style="padding-right: 6px;">
            Адрес регистрации
        </div>
        <div class="col-sm-10 info2" align="left" style="padding-left: 6px;">
            {{cadet.addressData.registeredData.subjectOfRegisteredAddressTypeName+cadet.addressData.registeredData.subjectOfRegisteredAddress
            +(',&nbsp;'+cadet.addressData.registeredData.cityOfRegisteredAddressTypeName+cadet.addressData.registeredData.cityOfRegisteredAddress)
            +(',&nbsp;'+cadet.addressData.registeredData.streetOfRegisteredAddressTypeName+cadet.addressData.registeredData.streetOfRegisteredAddress)
            +(cadet.addressData.registeredData.houseOfRegisteredAddress!=''?(',&nbsp;д.
            '+cadet.addressData.registeredData.houseOfRegisteredAddress):'')
            +(cadet.addressData.registeredData.buildingOfRegisteredAddress!=''?(',&nbsp;корп.
            '+cadet.addressData.registeredData.buildingOfRegisteredAddress):'')
            +(cadet.addressData.registeredData.apartmentOfRegisteredAddress!=''?(',&nbsp;кв.
            '+cadet.addressData.registeredData.apartmentOfRegisteredAddress):'')
            +(cadet.addressData.registeredData.indexOfRegisteredAddress!=''?(',&nbsp;'+cadet.addressData.registeredData.indexOfRegisteredAddress):'')}}
        </div>
    </div>
<br>
    <div class="row">
        <div class="col-sm-2 info" align="right" style="padding-right: 6px;">
            Фактический адрес
        </div>
        <div class="col-sm-10 info2" align="left" style="padding-left: 6px;">
            {{cadet.addressData.actualData.subjectOfActualAddressTypeName+cadet.addressData.actualData.subjectOfActualAddress
            +(',&nbsp;'+cadet.addressData.actualData.cityOfActualAddressTypeName+cadet.addressData.actualData.cityOfActualAddress)
            +(',&nbsp;'+cadet.addressData.actualData.streetOfActualAddressTypeName+cadet.addressData.actualData.streetOfActualAddress)
            +(cadet.addressData.actualData.houseOfActualAddress!=''?(',&nbsp;д.
            '+cadet.addressData.actualData.houseOfActualAddress):'')
            +(cadet.addressData.actualData.buildingOfActualAddress!=''?(',&nbsp;корп.
            '+cadet.addressData.actualData.buildingOfActualAddress):'')
            +(cadet.addressData.actualData.apartmentOfActualAddress!=''?(',&nbsp;кв.
            '+cadet.addressData.actualData.apartmentOfActualAddress):'')
            +(cadet.addressData.actualData.indexOfActualAddress!=''?(',&nbsp;'+cadet.addressData.actualData.indexOfActualAddress):'')}}
        </div>

    </div>

</div>


<div class="panel panel2 container-fluid" id="addressDataEdit" style="display: none">


    <div class="row">
        <div class="col-md-12">
            Адресные данные
        </div>
    </div>

    <div class="row">
        <div class="col-sm-4" align="left">
            <label class="control-label">Место рождения:</label>
        </div>
        <div class="col-sm-3" align="right">
            <select name="subjectOfPlaceOfBirthType" id="subjectOfPlaceOfBirthType">
                <option value="1" selected
                        onclick="loadSubjectsByIdAndType('subjectOfPlaceOfBirth', 'cityOfPlaceOfBirth', 1);">
                    область
                </option>
                <option value="2"
                        onclick="loadSubjectsByIdAndType('subjectOfPlaceOfBirth', 'cityOfPlaceOfBirth', 2);">
                    край
                </option>
                <option value="3"
                        onclick="loadSubjectsByIdAndType('subjectOfPlaceOfBirth', 'cityOfPlaceOfBirth', 3);">
                    республика
                </option>
                <option value="4"
                        onclick="loadSubjectsByIdAndType('subjectOfPlaceOfBirth', 'cityOfPlaceOfBirth', 4);">
                    автономный округ
                </option>
            </select>
        </div>
        <div class="col-sm-5">
            <input type="text" class="form-control" name="subjectOfPlaceOfBirth"
                   id="subjectOfPlaceOfBirth"
                   ng-model="cadet.addressData.birthData.subjectOfPlaceOfBirth">
        </div>
    </div>
    <div class="row">
        <label class="col-sm-4 control-label"></label>
        <div class="col-sm-3" align="right">
            <select ng-model="cadet.addressData.birthData.cityOfPlaceOfBirthType"
                    ng-options="template.value as template.name for template in options.addressData.cityTypes">
            </select>
        </div>
        <div class="col-sm-5">
            <input type="text" class="form-control" name="cityOfPlaceOfBirth"
                   id="cityOfPlaceOfBirth"
                   ng-model="cadet.addressData.birthData.cityOfPlaceOfBirth">
        </div>
    </div>
    <hr>
    <div class="row">
        <div class="col-sm-4" align="left">
            <label class="control-label">Адрес регистрации:</label>
        </div>
        <div class="col-sm-3" align="right">
            <select name="subjectOfRegisteredAddressType"
                    id="subjectOfRegisteredAddressType"
                    ng-model="cadet.addressData.registeredData.subjectOfRegisteredAddressType">
                <option value="1" selected
                        onclick="loadSubjectsByIdAndType('subjectOfRegisteredAddress', 'cityOfRegisteredAddress', 1);">
                    область
                </option>
                <option value="2"
                        onclick="loadSubjectsByIdAndType('subjectOfRegisteredAddress', 'cityOfRegisteredAddress', 2);">
                    край
                </option>
                <option value="3"
                        onclick="loadSubjectsByIdAndType('subjectOfRegisteredAddress', 'cityOfRegisteredAddress', 3);">
                    республика
                </option>
                <option value="4"
                        onclick="loadSubjectsByIdAndType('subjectOfRegisteredAddress', 'cityOfRegisteredAddress', 4);">
                    автономный округ
                </option>
            </select>
        </div>
        <div class="col-sm-5">
            <input type="text" class="form-control"
                   name="subjectOfRegisteredAddress" id="subjectOfRegisteredAddress"
                   ng-model="cadet.addressData.registeredData.subjectOfRegisteredAddress">
        </div>
    </div>
    <div class="row">
        <label class="col-sm-4 control-label"></label>
        <div class="col-sm-3" align="right">
            <select ng-model="cadet.addressData.registeredData.cityOfRegisteredAddressType"
                    ng-options="template.value as template.name for template in options.addressData.cityTypes">
            </select>
        </div>
        <div class="col-sm-5">
            <input type="text" class="form-control" name="cityOfRegisteredAddress"
                   id="cityOfRegisteredAddress"
                   ng-model="cadet.addressData.registeredData.cityOfRegisteredAddress">
        </div>
    </div>
    <div class="row">
        <label class="col-sm-4 control-label"></label>
        <div class="col-sm-3" align="right">
            <select ng-model="cadet.addressData.registeredData.streetOfRegisteredAddressType"
                    ng-options="template.value as template.name for template in options.addressData.streetTypes">
            </select>
        </div>
        <div class="col-sm-5">
            <input type="text" class="form-control" name="streetOfRegisteredAddress"
                   id="streetOfRegisteredAddress"
                   ng-model="cadet.addressData.registeredData.streetOfRegisteredAddress">
        </div>
    </div>
    <br>
    <div class="row">
        <label class="col-sm-1 control-label">Дом</label>
        <div class="col-sm-1">
            <input type="text" class="form-control" name="houseOfRegisteredAddress"
                   id="houseOfRegisteredAddress"
                   ng-model="cadet.addressData.registeredData.houseOfRegisteredAddress">
        </div>
        <label class="col-sm-1 control-label">Корпус</label>
        <div class="col-sm-1">
            <input type="text" class="form-control"
                   name="buildingOfRegisteredAddress"
                   id="buildingOfRegisteredAddress"
                   ng-model="cadet.addressData.registeredData.buildingOfRegisteredAddress">
        </div>
        <label class="col-sm-1 control-label">Квартира</label>
        <div class="col-sm-1">
            <input type="text" class="form-control"
                   name="apartmentOfRegisteredAddress"
                   id="apartmentOfRegisteredAddress"
                   ng-model="cadet.addressData.registeredData.apartmentOfRegisteredAddress">
        </div>
        <label class="col-sm-1 control-label">Индекс</label>
        <div class="col-sm-3">
            <input type="text" class="form-control" name="indexOfRegisteredAddress"
                   id="indexOfRegisteredAddress"
                   ng-model="cadet.addressData.registeredData.indexOfRegisteredAddress">
        </div>
    </div>
    <hr>
    <div class="row" align="center">
        <button class="btn btn-primary btn-mini"
                ng-click="updateActualAddressByRegistered()">Фактический адрес
            совпадает с адресом регистрации
        </button>
    </div>
    <br>
    <div class="row">
        <div class="col-sm-4" align="left">
            <label class="control-label">Фактический адрес:</label>
        </div>
        <div class="col-sm-3" align="right">
            <select name="subjectOfActualAddressType"
                    id="subjectOfActualAddressType"
                    ng-model="cadet.addressData.actualData.subjectOfActualAddressType">
                <option value="1" selected
                        onclick="loadSubjectsByIdAndType('subjectOfActualAddress', 'cityOfActualAddress', 1);">
                    область
                </option>
                <option value="2"
                        onclick="loadSubjectsByIdAndType('subjectOfActualAddress', 'cityOfActualAddress', 2);">
                    край
                </option>
                <option value="3"
                        onclick="loadSubjectsByIdAndType('subjectOfActualAddress', 'cityOfActualAddress', 3);">
                    республика
                </option>
                <option value="4"
                        onclick="loadSubjectsByIdAndType('subjectOfActualAddress', 'cityOfActualAddress', 4);">
                    автономный округ
                </option>
            </select>
        </div>
        <div class="col-sm-5">
            <input type="text" class="form-control" name="subjectOfActualAddress"
                   id="subjectOfActualAddress"
                   ng-model="cadet.addressData.actualData.subjectOfActualAddress">
        </div>
    </div>
    <div class="row">
        <label class="col-sm-4 control-label"></label>
        <div class="col-sm-3" align="right">
            <select ng-model="cadet.addressData.actualData.cityOfActualAddressType"
                    ng-options="template.value as template.name for template in options.addressData.cityTypes">
            </select>
        </div>
        <div class="col-sm-5">
            <input type="text" class="form-control" name="cityOfActualAddress"
                   id="cityOfActualAddress"
                   ng-model="cadet.addressData.actualData.cityOfActualAddress">
        </div>
    </div>
    <div class="row">
        <label class="col-sm-4 control-label"></label>
        <div class="col-sm-3" align="right">
            <select ng-model="cadet.addressData.actualData.streetOfActualAddressType"
                    ng-options="template.value as template.name for template in options.addressData.streetTypes">
            </select>
        </div>
        <div class="col-sm-5">
            <input type="text" class="form-control" name="streetOfActualAddress"
                   id="streetOfActualAddress"
                   ng-model="cadet.addressData.actualData.streetOfActualAddress">
        </div>
    </div>
    <div class="row">
        <label class="col-sm-1 control-label">Дом</label>
        <div class="col-sm-1">
            <input type="text" class="form-control" name="houseOfActualAddress"
                   id="houseOfActualAddress"
                   ng-model="cadet.addressData.actualData.houseOfActualAddress">
        </div>
        <label class="col-sm-1 control-label">Корпус</label>
        <div class="col-sm-1">
            <input type="text" class="form-control" name="buildingOfActualAddress"
                   id="buildingOfActualAddress"
                   ng-model="cadet.addressData.actualData.buildingOfActualAddress">
        </div>
        <label class="col-sm-1 control-label">Квартира</label>
        <div class="col-sm-1">
            <input type="text" class="form-control" name="apartmentOfActualAddress"
                   id="apartmentOfActualAddress"
                   ng-model="cadet.addressData.actualData.apartmentOfActualAddress">
        </div>
        <label class="col-sm-1 control-label">Индекс</label>
        <div class="col-sm-3">
            <input type="text" class="form-control" name="indexOfActualAddress"
                   id="indexOfActualAddress"
                   ng-model="cadet.addressData.actualData.indexOfActualAddress">
        </div>
    </div>
    <button class="btn btn-success" ng-click="saveAndLoadAddressData()">Сохранить</button>

</div>

