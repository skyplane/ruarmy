<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<div class="panel panel2 container-fluid" id="totalInformationShow" align="left">




    <div class="row">
        <div class="col-md-3">

        </div>
        <div class="col-md-9">
            <div class="row">
                <div class="col-md-9">
                    <label>{{cadet.totalInformation.surname}}&nbsp
                        {{cadet.totalInformation.name}}&nbsp;{{cadet.totalInformation.patronymic}}</label>
                </div>
                <div class="col-md-3">
                    <button class="btn btn-link" ng-click="editTotalInformation()">Редактировать</button>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="row info">{{cadet.totalInformation.dateOfBirth}}</div>
                    <div class="row"><label class="signature">дата рождения</label></div>
                    <div class="row info">{{cadet.totalInformation.nationality}}</div>
                    <div class="row"><label class="signature">национальность</label></div>
                    <div class="row info">{{cadet.totalInformation.religion.name}}</div>
                    <div class="row"><label class="signature">вероисповедание</label></div>
                    <div class="row info">{{cadet.totalInformation.militaryIdNumber}}</div>
                    <div class="row"><label class="signature">военный билет</label></div>
                    <div class="row info">{{cadet.totalInformation.passportNumber}}</div>
                    <div class="row"><label class="signature">паспорт</label></div>
                    <div class="row info">{{cadet.totalInformation.phone}}</div>
                    <div class="row"><label class="signature">телефон</label></div>
                </div>
                <div class="col-md-6">
                    <div class="row info">{{cadet.totalInformation.militaryRank.name}}</div>
                    <div class="row"><label class="signature">воинское звание</label></div>
                    <div class="row info">{{cadet.totalInformation.post}}</div>
                    <div class="row"><label class="signature">должность</label></div>
                    <div class="row info">{{cadet.totalInformation.division.name}}</div>
                    <div class="row"><label class="signature">подразделение</label></div>
                    <div class="row info">{{cadet.totalInformation.faculty}}</div>
                    <div class="row"><label class="signature">факультет</label></div>
                    <div class="row info">{{cadet.totalInformation.speciality}}</div>
                    <div class="row"><label class="signature">специальность</label></div>
                    <div class="row info">{{cadet.totalInformation.yearOfAdmission}}</div>
                    <div class="row"><label class="signature">год поступления</label></div>
                </div>
            </div>
        </div>
    </div>
</div>


<div class="panel panel2 container-fluid" id="totalInformationEdit" style="display: none">


    <div class="row">
        <div class="col-md-12">
            Общие данные
        </div>
    </div>


    <div class="row">
        <label class="col-sm-4 control-label">Фамилия</label>
        <div class="col-sm-8">
            <input type="text" class="form-control" name="surname" id="surname"
                   ng-model="cadet.totalInformation.surname">
        </div>
    </div>
    <br>
    <div class="row">
        <label class="col-sm-4 control-label">Имя</label>
        <div class="col-sm-8">
            <input type="text" class="form-control" name="name" id="name"
                   ng-model="cadet.totalInformation.name">
        </div>
    </div>
    <br>
    <div class="row">
        <label class="col-sm-4 control-label">Отчество</label>
        <div class="col-sm-8">
            <input type="text" class="form-control" name="patronymic"
                   id="patronymic"
                   ng-model="cadet.totalInformation.patronymic">
        </div>
    </div>
    <br>
    <div class="row">
        <label class="col-sm-4 control-label">Дата рождения</label>
        <div class="col-sm-8">
            <input type="text" class="form-control" name="dateOfBirth"
                   id="dateOfBirth"
                   ng-model="cadet.totalInformation.dateOfBirth">
        </div>
    </div>

    <hr>


    <div class="row">
        <label class="col-sm-4 control-label">Национальность</label>
        <div class="col-sm-8">
            <input type="text" class="form-control" name="nationality"
                   id="nationality"
                   ng-model="cadet.totalInformation.nationality">
        </div>
    </div>
    <br>
    <div class="row">
        <label class="col-sm-4 control-label">Вероисповедание</label>
        <div class="col-sm-3">
            <select name="religion" id="religion"
                    ng-model="cadet.totalInformation.religion.id">
                <option value="2" ng-click="hideCustomReligion()">православный
                </option>
                <option value="3" ng-click="hideCustomReligion()">мусульманин
                </option>
                <option value="4" ng-click="hideCustomReligion()">иудей</option>
                <option value="5" ng-click="hideCustomReligion()">атеист</option>
                <option value="6" ng-click="hideCustomReligion()">католик</option>
                <option value="7" ng-click="hideCustomReligion()">буддист</option>
                <option value="10" ng-click="showCustomReligion()">свой вариант
                </option>
            </select>
        </div>
        <div class="col-sm-3">
            <input type="text" style="display: none" class="form-control"
                   name="customReligion" id="customReligion"
                   ng-model="cadet.totalInformation.customReligion">
            <label id="customReligionLabel"></label>
        </div>
    </div>
    <hr>

    <div class="row">
        <label class="col-sm-4 control-label">Воинское звание</label>
        <div class="col-sm-8">
            <select name="militaryRank" id="militaryRank"
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
        <label class="col-sm-4 control-label">Подразделение</label>
        <div class="col-sm-8">
            <select name="division" id="division" ng-model="cadet.totalInformation.division.id">
                <option ng-repeat="division in divisions" value="{{division.id}}">
                    {{division.name}}
                </option>
            </select>
        </div>
    </div>
    <br>
    <div class="row">
        <label class="col-sm-4 control-label">Должность</label>
        <div class="col-sm-8">
            <input type="text" class="form-control" name="post" id="post"
                   ng-model="cadet.totalInformation.post">
        </div>
    </div>
    <hr>
    <div class="row">
        <label class="col-sm-4 control-label">Номер паспорта</label>
        <div class="col-sm-8">
            <input type="text" class="form-control" name="passportNumber"
                   id="passportNumber" ng-model="cadet.totalInformation.passportNumber"
                   placeholder="**** ******" ui-passport>
        </div>
    </div>
    <br>
    <div class="row">
        <label class="col-sm-4 control-label">Номер военного билета</label>
        <div class="col-sm-8">
            <input type="text" class="form-control" name="militaryIdNumber"
                   id="militaryIdNumber" ng-model="cadet.totalInformation.militaryIdNumber"
                   placeholder="** *******" ui-military-ticket>
        </div>
    </div>
    <br>
    <div class="row">
        <label class="col-sm-4 control-label">Телефон</label>
        <div class="col-sm-8">
            <input type="text" class="form-control" name="phone" id="phone"
                   ng-model="cadet.totalInformation.phone" placeholder="+7(***)***-****" ui-phone>
        </div>
    </div>

    <br>
    <div class="row">
        <label class="col-sm-4 control-label">Факультет</label>
        <div class="col-sm-8">
            <input type="text" class="form-control" name="faculty" id="faculty"
                   ng-model="cadet.totalInformation.faculty">
        </div>
    </div>
    <br>
    <div class="row">
        <label class="col-sm-4 control-label">Специальность</label>
        <div class="col-sm-8">
            <input type="text" class="form-control" name="speciality" id="speciality"
                   ng-model="cadet.totalInformation.speciality">
        </div>
    </div>
    <br>
    <div class="row">
        <label class="col-sm-4 control-label">Год поступления</label>
        <div class="col-sm-8">
            <input type="text" class="form-control" name="yearOfAdmission"
                   id="yearOfAdmission"
                   ng-model="cadet.totalInformation.yearOfAdmission">
        </div>
    </div>


    <button class="btn btn-success" ng-click="saveAndLoadTotalInformation()">Сохранить</button>

</div>

