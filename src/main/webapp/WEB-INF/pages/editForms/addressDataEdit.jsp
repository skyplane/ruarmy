<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="row">
    <div class="col-sm-4" align="left">
        <label class="info">Место рождения:</label>
    </div>
    <div class="col-sm-3" align="right">
        <select name="subjectOfPlaceOfBirthType" id="subjectOfPlaceOfBirthType" class="form-control"
                ng-model="cadet.addressData.birthData.subjectOfPlaceOfBirthType">
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
        <select ng-model="cadet.addressData.birthData.cityOfPlaceOfBirthType" class="form-control"
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
        <label class="info">Адрес регистрации:</label>
    </div>
    <div class="col-sm-3" align="right">
        <select name="subjectOfRegisteredAddressType"
                id="subjectOfRegisteredAddressType" class="form-control"
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
        <select ng-model="cadet.addressData.registeredData.cityOfRegisteredAddressType" class="form-control"
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
        <select ng-model="cadet.addressData.registeredData.streetOfRegisteredAddressType" class="form-control"
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
               ng-model="cadet.addressData.registeredData.indexOfRegisteredAddress"
               placeholder="******" ui-index>
    </div>
</div>
<hr>
<div class="row" align="center">
    <button class="btn btn-info btn-mini"
            ng-click="updateActualAddressByRegistered()">Фактический адрес
        совпадает с адресом регистрации
    </button>
</div>
<hr>
<div class="row">
    <div class="col-sm-4" align="left">
        <label class="info">Фактический адрес:</label>
    </div>
    <div class="col-sm-3" align="right">
        <select name="subjectOfActualAddressType"
                id="subjectOfActualAddressType" class="form-control"
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
        <select ng-model="cadet.addressData.actualData.cityOfActualAddressType" class="form-control"
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
        <select ng-model="cadet.addressData.actualData.streetOfActualAddressType" class="form-control"
                ng-options="template.value as template.name for template in options.addressData.streetTypes">
        </select>
    </div>
    <div class="col-sm-5">
        <input type="text" class="form-control" name="streetOfActualAddress"
               id="streetOfActualAddress"
               ng-model="cadet.addressData.actualData.streetOfActualAddress">
    </div>
</div>
<br>
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
               ng-model="cadet.addressData.actualData.indexOfActualAddress"
               placeholder="******" ui-index>
    </div>
</div>