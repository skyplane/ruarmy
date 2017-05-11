<%--
  Created by IntelliJ IDEA.
  User: skyplane
  Date: 06.05.17
  Time: 12:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Анкета</title>

    <link rel="stylesheet" type="text/css" href="../bower_components/chosen_v1.4.0/chosen.min.css"/>
    <link rel="stylesheet" type="text/css" href="../bower_components/checkbo/src/0.1.4/css/checkBo.min.css"/>
    <link rel="stylesheet" type="text/css" href="../bower_components/bootstrap/dist/css/bootstrap.css"/>
    <link rel="stylesheet" type="text/css" href="../bower_components/bootstrap/dist/css/bootstrap-theme.css"/>
    <link rel="stylesheet" type="text/css" href="../bower_components/datatables/media/css/jquery.dataTables.css"/>
    <link rel="stylesheet" type="text/css" href="../bower_components/datatables/media/css/dataTables.bootstrap.css"/>
    <link rel="stylesheet" type="text/css" href="../bower_components/bootstrap-datepicker/dist/css/bootstrap-datepicker.css"/>


    <script src="../bower_components/jquery/dist/jquery.js"></script>
    <script src="../bower_components/angular/angular.js"></script>
    <script src="../bower_components/bootstrap/dist/js/bootstrap.js"></script>
    <script src="../bower_components/chosen_v1.4.0/chosen.jquery.min.js"></script>
    <script src="../bower_components/checkbo/src/0.1.4/js/checkBo.min.js"></script>
    <script src="../bower_components/card/lib/js/jquery.card.js"></script>
    <script src="../bower_components/bootstrap/js/tab.js"></script>
    <script src="../bower_components/datatables/media/js/jquery.dataTables.js"></script>
    <script src="../bower_components/datatables/media/js/dataTables.bootstrap.js"></script>
    <script src="../bower_components/jquery-validation/dist/jquery.validate.js"></script>
    <script src="../bower_components/twitter-bootstrap-wizard/jquery.bootstrap.wizard.js"></script>
    <script src="../bower_components/autocomplete/jquery.autocomplete.js"></script>
    <script src="../bower_components/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
    <script src="../bower_components/bootstrap-datepicker/js/locales/bootstrap-datepicker.ru.js"></script>
    <script src="../scripts/datatables/locale.js"></script>

</head>
<body>

<div ng-app="cadetApp" data-ng-controller="cadetCtrl" data-ng-init="init()">

    <br>
    <br>
    <br>

    <div class="container form-group">
        <div class="row" align="center">
            <button type="button" class="btn btn-primary btn-outline" data-toggle="modal" data-target="#cadetModal"
                    ng-click="clearData()">
                Регистрация
            </button>
        </div>
    </div>

    <!-- Modal -->
    <div class="modal fade" id="cadetModal" tabindex="-1" role="dialog" aria-labelledby="cadetModalLabel">
        <div class="modal-dialog" role="document" style="width:1138px;">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                            aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="cadetModalLabel">Регистрация</h4>
                </div>
                <div class="modal-body">
                    <form id="cadetForm" class="form-horizontal" role="form" data-ui-jq="validate"
                          data-ui-options="validationOpt">
                        <div class="box-tab justified" id="rootwizard">

                            <div class="navbar">
                                <div class="navbar-inner">
                                    <div class="container">
                                        <ul>
                                            <li><a href="#tab1" data-toggle="tab">Общие данные</a></li>
                                            <li><a href="#tab2" data-toggle="tab">Адресные данные</a></li>
                                            <li><a href="#tab3" data-toggle="tab">Состав семьи</a></li>
                                            <li><a href="#tab4" data-toggle="tab">Здоровье</a></li>
                                            <li><a href="#tab5" data-toggle="tab">Поведение</a></li>
                                            <li><a href="#tab6" data-toggle="tab">Дополнительно</a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>

                            <div class="tab-content">
                                <div class="tab-pane active" id="tab1">
                                    <div class="container-fluid">
                                        <div class="row">
                                            <label class="col-sm-4 control-label">Факультет</label>
                                            <div class="col-sm-8">
                                                <input type="text" class="form-control" name="faculty" id="faculty"
                                                       ng-model="cadet.faculty">
                                            </div>
                                        </div>
                                        <br>
                                        <div class="row">
                                            <label class="col-sm-4 control-label">Специальность</label>
                                            <div class="col-sm-8">
                                                <input type="text" class="form-control" name="specialty" id="specialty"
                                                       ng-model="cadet.specialty">
                                            </div>
                                        </div>
                                        <br>
                                        <div class="row">
                                            <label class="col-sm-4 control-label">Год поступления</label>
                                            <div class="col-sm-8">
                                                <input type="text" class="form-control" name="yearOfAdmission"
                                                       id="yearOfAdmission"
                                                       ng-model="cadet.yearOfAdmission">
                                            </div>
                                        </div>
                                        <br>
                                        <div class="row">
                                            <label class="col-sm-4 control-label">Воинское звание</label>
                                            <div class="col-sm-8">
                                                <select  name="militaryRank" id="militaryRank"
                                                        ng-model="cadet.militaryRank">
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
                                            <label class="col-sm-4 control-label">Фамилия</label>
                                            <div class="col-sm-8">
                                                <input type="text" class="form-control" name="surname" id="surname"
                                                       ng-model="cadet.surname">
                                            </div>
                                        </div>
                                        <br>
                                        <div class="row">
                                            <label class="col-sm-4 control-label">Имя</label>
                                            <div class="col-sm-8">
                                                <input type="text" class="form-control" name="name" id="name"
                                                       ng-model="cadet.name">
                                            </div>
                                        </div>
                                        <br>
                                        <div class="row">
                                            <label class="col-sm-4 control-label">Отчество</label>
                                            <div class="col-sm-8">
                                                <input type="text" class="form-control" name="patronymic"
                                                       id="patronymic"
                                                       ng-model="cadet.patronymic">
                                            </div>
                                        </div>
                                        <br>
                                        <div class="row">
                                            <label class="col-sm-4 control-label">Дата рождения</label>
                                            <div class="col-sm-8">
                                                <input type="text" class="form-control" name="dateOfBirth"
                                                       id="dateOfBirth"
                                                       ng-model="cadet.dateOfBirth">
                                            </div>
                                        </div>
                                        <br>
                                        <div class="row">
                                            <label class="col-sm-4 control-label">Номер паспорта</label>
                                            <div class="col-sm-8">
                                                <input type="text" class="form-control" name="passportNumber"
                                                       id="passportNumber" ng-model="cadet.passportNumber">
                                            </div>
                                        </div>
                                        <br>
                                        <div class="row">
                                            <label class="col-sm-4 control-label">Номер военного билета</label>
                                            <div class="col-sm-8">
                                                <input type="text" class="form-control" name="militaryIdNumber"
                                                       id="militaryIdNumber" ng-model="cadet.militaryIdNumber">
                                            </div>
                                        </div>
                                        <br>
                                        <div class="row">
                                            <label class="col-sm-4 control-label">Национальность</label>
                                            <div class="col-sm-8">
                                                <input type="text" class="form-control" name="nationality"
                                                       id="nationality"
                                                       ng-model="cadet.nationality">
                                            </div>
                                        </div>
                                        <br>
                                        <div class="row">
                                            <label class="col-sm-4 control-label">Вероисповедание</label>
                                            <div class="col-sm-2">
                                                <select  name="religion" id="religion"
                                                        ng-model="cadet.religion">
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
                                            <div class="col-sm-6">
                                                <input type="text" style="display: none" class="form-control"
                                                       name="customReligion" id="customReligion"
                                                       ng-model="cadet.customReligion">
                                            </div>
                                        </div>
                                        <br>
                                        <div class="row">
                                            <label class="col-sm-4 control-label">Телефон</label>
                                            <div class="col-sm-8">
                                                <input type="text" class="form-control" name="phone" id="phone"
                                                       ng-model="cadet.phone">
                                            </div>
                                        </div>
                                        <br>
                                        <div class="row">
                                            <label class="col-sm-4 control-label">Подразделение</label>
                                            <div class="col-sm-8">
                                                <input type="text" class="form-control" name="unit" id="unit"
                                                       ng-model="cadet.unit">
                                            </div>
                                        </div>
                                        <br>
                                        <div class="row">
                                            <label class="col-sm-4 control-label">Должность</label>
                                            <div class="col-sm-8">
                                                <input type="text" class="form-control" name="post" id="post"
                                                       ng-model="cadet.post">
                                            </div>
                                        </div>
                                        <br>
                                        <div class="row">
                                            <label class="col-sm-4 control-label">Образование</label>
                                            <div class="col-sm-8">
                                                <input type="text" class="form-control" name="education" id="education"
                                                       ng-model="cadet.education">
                                            </div>
                                        </div>
                                        <br>
                                        <div class="row">
                                            <label class="col-sm-4 control-label">Навыки</label>
                                            <div class="col-sm-8">
                                                <input type="text" class="form-control" name="skills" id="skills"
                                                       ng-model="cadet.skills">
                                            </div>
                                        </div>
                                        <br>
                                        <div class="row">
                                            <label class="col-sm-4 control-label">Категории водительских прав</label>
                                            <div class="col-sm-8">
                                                <input type="text" class="form-control" name="drivingLicense"
                                                       id="drivingLicense" ng-model="cadet.drivingLicense">
                                            </div>
                                        </div>
                                    </div>
                                    <hr>
                                </div>
                                <div class="tab-pane" id="tab2">
                                    <div class="container-fluid">
                                        <div class="row">
                                            <label class="col-sm-4 control-label">Место рождения</label>
                                            <div class="col-sm-3">
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
                                                       ng-model="cadet.addressData.subjectOfPlaceOfBirth">
                                            </div>
                                        </div>
                                        <div class="row">
                                            <label class="col-sm-4 control-label"></label>
                                            <div class="col-sm-3">
                                                <select ng-model="cadet.addressData.cityOfPlaceOfBirthType"
                                                        ng-options="template.value as template.name for template in options.cityTypes">
                                                </select>
                                            </div>
                                            <div class="col-sm-5">
                                                <input type="text" class="form-control" name="cityOfPlaceOfBirth"
                                                       id="cityOfPlaceOfBirth"
                                                       ng-model="cadet.addressData.cityOfPlaceOfBirth">
                                            </div>
                                        </div>
                                        <hr>
                                        <div class="row">
                                            <label class="col-sm-4 control-label">Адрес регистрации</label>
                                            <div class="col-sm-3">
                                                <select name="subjectOfRegisteredAddressType"
                                                        id="subjectOfRegisteredAddressType">
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
                                                       ng-model="cadet.addressData.subjectOfRegisteredAddress">
                                            </div>
                                        </div>
                                        <div class="row">
                                            <label class="col-sm-4 control-label"></label>
                                            <div class="col-sm-3">
                                                <select ng-model="cadet.addressData.cityOfRegisteredAddressType"
                                                        ng-options="template.value as template.name for template in options.cityTypes">
                                                </select>
                                            </div>
                                            <div class="col-sm-5">
                                                <input type="text" class="form-control" name="cityOfRegisteredAddress"
                                                       id="cityOfRegisteredAddress"
                                                       ng-model="cadet.addressData.cityOfRegisteredAddress">
                                            </div>
                                        </div>
                                        <div class="row">
                                            <label class="col-sm-4 control-label"></label>
                                            <div class="col-sm-3">
                                                <select ng-model="cadet.addressData.streetOfRegisteredAddressType"
                                                        ng-options="template.value as template.name for template in options.streetTypes">
                                                </select>
                                            </div>
                                            <div class="col-sm-5">
                                                <input type="text" class="form-control" name="streetOfRegisteredAddress"
                                                       id="streetOfRegisteredAddress"
                                                       ng-model="cadet.addressData.streetOfRegisteredAddress">
                                            </div>
                                        </div>
                                        <br>
                                        <div class="row">
                                            <label class="col-sm-1 control-label">Дом</label>
                                            <div class="col-sm-1">
                                                <input type="text" class="form-control" name="houseOfRegisteredAddress"
                                                       id="houseOfRegisteredAddress"
                                                       ng-model="cadet.addressData.houseOfRegisteredAddress">
                                            </div>
                                            <label class="col-sm-1 control-label">Корпус</label>
                                            <div class="col-sm-1">
                                                <input type="text" class="form-control"
                                                       name="buildingOfRegisteredAddress"
                                                       id="buildingOfRegisteredAddress"
                                                       ng-model="cadet.addressData.buildingOfRegisteredAddress">
                                            </div>
                                            <label class="col-sm-1 control-label">Квартира</label>
                                            <div class="col-sm-1">
                                                <input type="text" class="form-control"
                                                       name="apartmentOfRegisteredAddress"
                                                       id="apartmentOfRegisteredAddress"
                                                       ng-model="cadet.addressData.apartmentOfRegisteredAddress">
                                            </div>
                                            <label class="col-sm-1 control-label">Индекс</label>
                                            <div class="col-sm-3">
                                                <input type="text" class="form-control" name="indexOfRegisteredAddress"
                                                       id="indexOfRegisteredAddress"
                                                       ng-model="cadet.addressData.indexOfRegisteredAddress">
                                            </div>
                                        </div>
                                        <hr>
                                        <div class="row">
                                            <label class="col-sm-4 control-label">Фактический адрес</label>
                                            <div class="col-sm-3">
                                                <select name="subjectOfActualAddressType"
                                                        id="subjectOfActualAddressType">
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
                                                       ng-model="cadet.addressData.subjectOfActualAddress">
                                            </div>
                                        </div>
                                        <div class="row">
                                            <label class="col-sm-4 control-label"></label>
                                            <div class="col-sm-3">
                                                <select ng-model="cadet.addressData.cityOfActualAddressType"
                                                        ng-options="template.value as template.name for template in options.cityTypes">
                                                </select>
                                            </div>
                                            <div class="col-sm-5">
                                                <input type="text" class="form-control" name="cityOfActualAddress"
                                                       id="cityOfActualAddress"
                                                       ng-model="cadet.addressData.cityOfActualAddress">
                                            </div>
                                        </div>
                                        <div class="row">
                                            <label class="col-sm-4 control-label"></label>
                                            <div class="col-sm-3">
                                                <select ng-model="cadet.addressData.streetOfActualAddressType"
                                                        ng-options="template.value as template.name for template in options.streetTypes">
                                                </select>
                                            </div>
                                            <div class="col-sm-5">
                                                <input type="text" class="form-control" name="streetOfActualAddress"
                                                       id="streetOfActualAddress"
                                                       ng-model="cadet.addressData.streetOfActualAddress">
                                            </div>
                                        </div>
                                        <div class="row">
                                            <label class="col-sm-1 control-label">Дом</label>
                                            <div class="col-sm-1">
                                                <input type="text" class="form-control" name="houseOfActualAddress"
                                                       id="houseOfActualAddress"
                                                       ng-model="cadet.addressData.houseOfActualAddress">
                                            </div>
                                            <label class="col-sm-1 control-label">Корпус</label>
                                            <div class="col-sm-1">
                                                <input type="text" class="form-control" name="buildingOfActualAddress"
                                                       id="buildingOfActualAddress"
                                                       ng-model="cadet.addressData.buildingOfActualAddress">
                                            </div>
                                            <label class="col-sm-1 control-label">Квартира</label>
                                            <div class="col-sm-1">
                                                <input type="text" class="form-control" name="apartmentOfActualAddress"
                                                       id="apartmentOfActualAddress"
                                                       ng-model="cadet.addressData.apartmentOfActualAddress">
                                            </div>
                                            <label class="col-sm-1 control-label">Индекс</label>
                                            <div class="col-sm-3">
                                                <input type="text" class="form-control" name="indexOfActualAddress"
                                                       id="indexOfActualAddress"
                                                       ng-model="cadet.addressData.indexOfActualAddress">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane" id="tab3">
                                    <div class="container-fluid">
                                        <div class="row">
                                            <label class="col-sm-4 control-label">Состав семьи</label>
                                            <div class="col-sm-8">
                                                <select  name="compositionOfFamily"
                                                        id="compositionOfFamily" ng-model="cadet.compositionOfFamily">
                                                    <option value="1">полная</option>
                                                    <option value="2">без отца</option>
                                                    <option value="3">без матери</option>
                                                    <option value="4">сирота</option>
                                                </select>
                                            </div>
                                        </div>
                                        <br>
                                        <div class="row">
                                            <label class="col-sm-4 control-label">Отец</label>
                                            <div class="col-sm-8">
                                                <input type="text" class="form-control" name="father" id="father"
                                                       ng-model="cadet.father">
                                            </div>
                                        </div>
                                        <br>
                                        <div class="row">
                                            <label class="col-sm-4 control-label">Мать</label>
                                            <div class="col-sm-8">
                                                <input type="text" class="form-control" name="mother" id="mother"
                                                       ng-model="cadet.mother">
                                            </div>
                                        </div>
                                        <br>
                                        <div class="row">
                                            <label class="col-sm-4 control-label">Братья</label>
                                            <div class="col-sm-1"><button ng-click="addBrother()">+</button></div>
                                            <div class="col-sm-6">
                                                <div class="row" ng-repeat="brother in cadet.brothers track by $index">
                                                    <div class="col-sm-11">
                                                        <input type="text" class="form-control" ng-model="cadet.brothers[$index]">
                                                    </div>
                                                    <div class="col-sm-1"><button ng-click="removeBrother($index)">-</button></div>
                                                </div>
                                            </div>
                                        </div>
                                        <br>
                                        <div class="row">
                                            <label class="col-sm-4 control-label">Сёстры</label>
                                            <div class="col-sm-1"><button ng-click="addSister()">+</button></div>
                                            <div class="col-sm-6">
                                                <div class="row" ng-repeat="sister in cadet.sisters track by $index">
                                                    <div class="col-sm-11">
                                                        <input type="text" class="form-control" ng-model="cadet.sisters[$index]">
                                                    </div>
                                                    <div class="col-sm-1"><button ng-click="removeSister($index)">-</button></div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane" id="tab4">
                                    <div class="container-fluid">
                                        <div class="row">
                                            <label class="col-sm-4 control-label">сотрясений головного мозга не
                                                было</label>
                                            <div class="col-sm-3"></div>
                                            <div class="col-sm-2">
                                                <div class="btn-group btn-group-justified" role="group">
                                                    <div class="btn-group" role="group">
                                                        <button type="button"
                                                                class="btn btn-default trueConcussionsWereNot"
                                                                ng-click="setConcussionsWereNot(true)">Да
                                                        </button>
                                                    </div>
                                                    <div class="btn-group" role="group">
                                                        <button type="button"
                                                                class="btn btn-default falseConcussionsWereNot active"
                                                                ng-click="setConcussionsWereNot(false)">Нет
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <hr>
                                        <div class="row">
                                            <label class="col-sm-4 control-label">черепно-мозговых травм не было</label>
                                            <div class="col-sm-3"></div>
                                            <div class="col-sm-2">
                                                <div class="btn-group btn-group-justified" role="group">
                                                    <div class="btn-group" role="group">
                                                        <button type="button"
                                                                class="btn btn-default trueTraumaticBrainInjuryWasNot"
                                                                ng-click="setTraumaticBrainInjuryWasNot(true)">Да
                                                        </button>
                                                    </div>
                                                    <div class="btn-group" role="group">
                                                        <button type="button"
                                                                class="btn btn-default falseTraumaticBrainInjuryWasNot active"
                                                                ng-click="setTraumaticBrainInjuryWasNot(false)">Нет
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <hr>
                                        <div class="row">
                                            <label class="col-sm-4 control-label">на учёте у нарколога не
                                                состоял</label>
                                            <div class="col-sm-3"></div>
                                            <div class="col-sm-2">
                                                <div class="btn-group btn-group-justified" role="group">
                                                    <div class="btn-group" role="group">
                                                        <button type="button"
                                                                class="btn btn-default trueTheNarcologWasNot"
                                                                ng-click="setTheNarcologWasNot(true)">Да
                                                        </button>
                                                    </div>
                                                    <div class="btn-group" role="group">
                                                        <button type="button"
                                                                class="btn btn-default falseTheNarcologWasNot active"
                                                                ng-click="setTheNarcologWasNot(false)">Нет
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <hr>
                                        <div class="row">
                                            <label class="col-sm-4 control-label">на учёте у психиатра не
                                                состоял</label>
                                            <div class="col-sm-3"></div>
                                            <div class="col-sm-2">
                                                <div class="btn-group btn-group-justified" role="group">
                                                    <div class="btn-group" role="group">
                                                        <button type="button"
                                                                class="btn btn-default trueThePsychiatristWasNot"
                                                                ng-click="setThePsychiatristWasNot(true)">Да
                                                        </button>
                                                    </div>
                                                    <div class="btn-group" role="group">
                                                        <button type="button"
                                                                class="btn btn-default falseThePsychiatristWasNot active"
                                                                ng-click="setThePsychiatristWasNot(false)">Нет
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <hr>
                                        <div class="row">
                                            <label class="col-sm-4 control-label">Употребление алкоголя</label>
                                            <div class="col-sm-8">
                                                <select name="alcohol" id="alcohol"
                                                        ng-model="cadet.alcohol">
                                                    <option value="1">не употребляю</option>
                                                    <option value="2">по праздникам</option>
                                                    <option value="3">1 раз в неделю или реже</option>
                                                    <option value="4">1 - 3 раза в неделю</option>
                                                    <option value="5">более 3-х раз в неделю</option>
                                                </select>
                                            </div>
                                        </div>
                                        <hr>
                                        <div class="row">
                                            <label class="col-sm-4 control-label">Употребление наркотиков</label>
                                            <div class="col-sm-8">
                                                <select name="drugUse" id="drugUse"
                                                        ng-model="cadet.drugUse">
                                                    <option value="1">не употреблял</option>
                                                    <option value="2">употреблял однократно</option>
                                                    <option value="3">употреблял систематически</option>
                                                </select>
                                            </div>
                                        </div>
                                        <br>
                                        <div class="row">
                                            <label class="col-sm-4 control-label">Хронические заболевания</label>
                                            <div class="col-sm-8">
                                                <input type="text" class="form-control" name="chronicDiseases"
                                                       id="chronicDiseases" ng-model="cadet.chronicDiseases">
                                            </div>
                                        </div>
                                        <br>
                                        <div class="row">
                                            <label class="col-sm-4 control-label">Категория годности</label>
                                            <div class="col-sm-8">
                                                <input type="text" class="form-control" name="categoryDate"
                                                       id="categoryDate" ng-model="cadet.categoryDate">
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="tab-pane" id="tab5">
                                    <div class="container-fluid">
                                        <div class="row">
                                            <label class="col-sm-4 control-label">мыслей о суициде не имеет</label>
                                            <div class="col-sm-3"></div>
                                            <div class="col-sm-2">
                                                <div class="btn-group btn-group-justified" role="group">
                                                    <div class="btn-group" role="group">
                                                        <button type="button"
                                                                class="btn btn-default trueThoughtsOfSuicideDoesNotHave"
                                                                ng-click="setThoughtsOfSuicideDoesNotHave(true)">Да
                                                        </button>
                                                    </div>
                                                    <div class="btn-group" role="group">
                                                        <button type="button"
                                                                class="btn btn-default falseThoughtsOfSuicideDoesNotHave active"
                                                                ng-click="setThoughtsOfSuicideDoesNotHave(false)">Нет
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <br>
                                        <div class="row">
                                            <label class="col-sm-4 control-label">попыток суицида не совершал</label>
                                            <div class="col-sm-3"></div>
                                            <div class="col-sm-2">
                                                <div class="btn-group btn-group-justified" role="group">
                                                    <div class="btn-group" role="group">
                                                        <button type="button"
                                                                class="btn btn-default trueSuicideAttemptsDidNotCommit"
                                                                ng-click="setSuicideAttemptsDidNotCommit(true)">Да
                                                        </button>
                                                    </div>
                                                    <div class="btn-group" role="group">
                                                        <button type="button"
                                                                class="btn btn-default falseSuicideAttemptsDidNotCommit active"
                                                                ng-click="setSuicideAttemptsDidNotCommit(false)">Нет
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <br>
                                        <div class="row">
                                            <label class="col-sm-4 control-label">административные правонарушения не
                                                совершал</label>
                                            <div class="col-sm-3"></div>
                                            <div class="col-sm-2">
                                                <div class="btn-group btn-group-justified" role="group">
                                                    <div class="btn-group" role="group">
                                                        <button type="button"
                                                                class="btn btn-default trueAdministrativeOffenseDidNotCommit"
                                                                ng-click="setAdministrativeOffenseDidNotCommit(true)">Да
                                                        </button>
                                                    </div>
                                                    <div class="btn-group" role="group">
                                                        <button type="button"
                                                                class="btn btn-default falseAdministrativeOffenseDidNotCommit active"
                                                                ng-click="setAdministrativeOffenseDidNotCommit(false)">
                                                            Нет
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <br>
                                        <div class="row">
                                            <label class="col-sm-4 control-label">приводов в полицию не имеет</label>
                                            <div class="col-sm-3"></div>
                                            <div class="col-sm-2">
                                                <div class="btn-group btn-group-justified" role="group">
                                                    <div class="btn-group" role="group">
                                                        <button type="button"
                                                                class="btn btn-default truePoliceRecordDoesNotHave"
                                                                ng-click="setPoliceRecordDoesNotHave(true)">Да
                                                        </button>
                                                    </div>
                                                    <div class="btn-group" role="group">
                                                        <button type="button"
                                                                class="btn btn-default falsePoliceRecordDoesNotHave active"
                                                                ng-click="setPoliceRecordDoesNotHave(false)">Нет
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <br>
                                        <div class="row">
                                            <label class="col-sm-4 control-label">к уголовной ответственности не
                                                привлекался</label>
                                            <div class="col-sm-3"></div>
                                            <div class="col-sm-2">
                                                <div class="btn-group btn-group-justified" role="group">
                                                    <div class="btn-group" role="group">
                                                        <button type="button"
                                                                class="btn btn-default trueCriminalLiabilityWasNotInvolved"
                                                                ng-click="setCriminalLiabilityWasNotInvolved(true)">Да
                                                        </button>
                                                    </div>
                                                    <div class="btn-group" role="group">
                                                        <button type="button"
                                                                class="btn btn-default falseCriminalLiabilityWasNotInvolved active"
                                                                ng-click="setCriminalLiabilityWasNotInvolved(false)">Нет
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <br>

                                    </div>
                                </div>
                                <div class="tab-pane" id="tab6">
                                    <div class="container-fluid">
                                        <div class="row">
                                            <label class="col-sm-4 control-label">Шрамы</label>

                                            <div class="col-sm-8">
                                                <input type="text" class="form-control" name="scars" id="scars"
                                                       ng-model="cadet.scars">
                                            </div>
                                        </div>
                                        <br>
                                        <div class="row">
                                            <label class="col-sm-4 control-label">Татуировки</label>

                                            <div class="col-sm-8">
                                                <input type="text" class="form-control" name="tattoo" id="tattoo"
                                                       ng-model="cadet.tattoo">
                                            </div>
                                        </div>
                                        <br>
                                        <div class="row">
                                            <label class="col-sm-4 control-label">Выезды за границу</label>

                                            <div class="col-sm-8">
                                                <input type="text" class="form-control" name="abroad" id="abroad"
                                                       ng-model="cadet.abroad">
                                            </div>
                                        </div>
                                        <hr>
                                        <div class="row">
                                            <label class="col-sm-4 control-label">Родственники, друзья за
                                                границей</label>
                                            <div class="col-sm-3"></div>
                                            <div class="col-sm-2">
                                                <div class="btn-group btn-group-justified" role="group">
                                                    <div class="btn-group" role="group">
                                                        <button type="button"
                                                                class="btn btn-default trueRelativesAndFriendsAbroad"
                                                                ng-click="setRelativesAndFriendsAbroad(true)">Да
                                                        </button>
                                                    </div>
                                                    <div class="btn-group" role="group">
                                                        <button type="button"
                                                                class="btn btn-default falseRelativesAndFriendsAbroad active"
                                                                ng-click="setRelativesAndFriendsAbroad(false)">Нет
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <br>
                                <ul class="pager wizard">

                                    <button class="btn btn-success pull-right" type="submit" name="submit" id="submit">Send</button>

                                    <li class="previous"><a href="javascript:;">Предыдущая</a></li>
                                    <li class="next"><a href="javascript:;">Следующая</a></li>

                                    <li class="finish"><a href="javascript:;" ng-click="submit()">Сохранить</a></li>

                                </ul>

                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default btn-outline" data-dismiss="modal">Закрыть</button>
                </div>
            </div>
        </div>
    </div>


</div>

<style>

    .autocomplete-suggestions {
        border: 1px solid #999;
        background: #FFF;
        overflow: auto;
    }

    .autocomplete-suggestion {
        padding: 2px 5px;
        white-space: nowrap;
        overflow: hidden;
    }

    .autocomplete-selected {
        background: #F0F0F0;
    }

    .autocomplete-suggestions strong {
        font-weight: normal;
        color: #3399FF;
    }

    .autocomplete-group {
        padding: 2px 5px;
    }

    .autocomplete-group strong {
        display: block;
        border-bottom: 1px solid #000;
    }

</style>


<script src="../scripts/cadet.js"></script>

</body>
</html>
