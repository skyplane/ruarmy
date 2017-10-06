
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="row">
    <div class="col-sm-4" align="right"><label class="info">Фамилия</label></div>
    <div class="col-sm-8" align="left">
        <input type="text" class="form-control" name="surname" id="surname"
               ng-model="cadet.totalInformation.surname">
    </div>
</div>
<br>
<div class="row">
    <div class="col-sm-4" align="right"><label class="info">Имя</label></div>
    <div class="col-sm-8">
        <input type="text" class="form-control" name="name" id="name"
               ng-model="cadet.totalInformation.name">
    </div>
</div>
<br>
<div class="row">
    <div class="col-sm-4" align="right"><label class="info">Отчество</label></div>
    <div class="col-sm-8">
        <input type="text" class="form-control" name="patronymic"
               id="patronymic"
               ng-model="cadet.totalInformation.patronymic">
    </div>
</div>
<br>
<div class="row">
    <div class="col-sm-4" align="right"><label class="info">Дата рождения</label></div>
    <div class="col-sm-8">
        <input type="text" class="form-control" name="dateOfBirth"
               id="dateOfBirth"
               ng-model="cadet.totalInformation.dateOfBirth">
    </div>
</div>

<hr>


<div class="row">
    <div class="col-sm-4" align="right"><label class="info">Национальность</label></div>
    <div class="col-sm-8">
        <input type="text" class="form-control" name="nationality"
               id="nationality"
               ng-model="cadet.totalInformation.nationality">
    </div>
</div>
<br>
<div class="row">
    <div class="col-sm-4" align="right"><label class="info">Вероисповедание</label></div>
    <div class="col-sm-3" align="left">
        <select name="religion" id="religion" class="form-control"
                ng-model="cadet.totalInformation.religion.id" ng-change="hideOrShowCustomReligion()">
            <option value="2" >православный</option>
            <option value="3" >мусульманин</option>
            <option value="4" >иудей</option>
            <option value="5" >атеист</option>
            <option value="6" >католик</option>
            <option value="7" >буддист</option>
            <option value="10" >свой вариант
            </option>
        </select>
    </div>
    <div class="col-sm-5" align="left">
        <input type="text" style="display: none" class="form-control"
               name="customReligion" id="customReligion"
               ng-model="cadet.totalInformation.customReligion">
        <label id="customReligionLabel"></label>
    </div>
</div>
<hr>

<div class="row">
    <div class="col-sm-4" align="right"><label class="info">Воинское звание</label></div>
    <div class="col-sm-8" align="left">
        <select name="militaryRank" id="militaryRank" class="form-control"
                ng-model="cadet.totalInformation.militaryRank.id">
            <option value="1">рядовой</option>
            <option value="2">ефрейтор</option>
            <option value="3">мл. сержант</option>
            <option value="4">сержант</option>
            <option value="5">ст. сержант</option>
        </select>
    </div>
</div>
<br>
<div class="row">
    <div class="col-sm-4" align="right"><label class="info">Подразделение</label></div>
    <div class="col-sm-8" align="left">
        <select name="division" id="division" ng-model="cadet.totalInformation.division.id" class="form-control">
            <option ng-repeat="division in divisions" value="{{division.id}}">
                {{division.name}}
            </option>
        </select>
    </div>
</div>
<br>
<div class="row">
    <div class="col-sm-4" align="right"><label class="info">Должность</label></div>
    <div class="col-sm-8">
        <input type="text" class="form-control" name="post" id="post"
               ng-model="cadet.totalInformation.post">
    </div>
</div>
<hr>
<div class="row">
    <div class="col-sm-4" align="right"><label class="info">Номер паспорта</label></div>
    <div class="col-sm-8">
        <input type="text" class="form-control" name="passportNumber"
               id="passportNumber" ng-model="cadet.totalInformation.passportNumber"
               placeholder="**** ******" ui-passport>
    </div>
</div>
<br>
<div class="row">
    <div class="col-sm-4" align="right"><label class="info">Номер военного билета</label></div>
    <div class="col-sm-8">
        <input type="text" class="form-control" name="militaryIdNumber"
               id="militaryIdNumber" ng-model="cadet.totalInformation.militaryIdNumber"
               placeholder="** *******" ui-military-ticket>
    </div>
</div>
<br>
<div class="row">
    <div class="col-sm-4" align="right"><label class="info">Телефон</label></div>
    <div class="col-sm-8">
        <input type="text" class="form-control" name="phone" id="phone"
               ng-model="cadet.totalInformation.phone" placeholder="+7(***)***-****" ui-phone>
    </div>
</div>

<br>
<div class="row">
    <div class="col-sm-4" align="right"><label class="info">Факультет</label></div>
    <div class="col-sm-8">
        <input type="text" class="form-control" name="faculty" id="faculty"
               ng-model="cadet.totalInformation.faculty">
    </div>
</div>
<br>
<div class="row">
    <div class="col-sm-4" align="right"><label class="info">Специальность</label></div>
    <div class="col-sm-8">
        <input type="text" class="form-control" name="speciality" id="speciality"
               ng-model="cadet.totalInformation.speciality">
    </div>
</div>
<br>
<div class="row">
    <div class="col-sm-4" align="right"><label class="info">Год поступления</label></div>
    <div class="col-sm-8">
        <input type="text" class="form-control" name="yearOfAdmission"
               id="yearOfAdmission"
               ng-model="cadet.totalInformation.yearOfAdmission" placeholder="****" ui-year>
    </div>
</div>