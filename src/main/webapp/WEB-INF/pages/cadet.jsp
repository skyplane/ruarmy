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
    <link rel="stylesheet" type="text/css"
          href="../bower_components/bootstrap-datepicker/dist/css/bootstrap-datepicker.css"/>


    <script src="../bower_components/jquery/dist/jquery.js"></script>
    <script src="../bower_components/jquery-mask-plugin/dist/jquery.mask.js"></script>

    <script src="../bower_components/angular/angular.js"></script>
    <script src="../bower_components/bootstrap/dist/js/bootstrap.js"></script>
    <script src="../bower_components/chosen_v1.4.0/chosen.jquery.min.js"></script>
    <script src="../bower_components/checkbo/src/0.1.4/js/checkBo.min.js"></script>
    <script src="../bower_components/card/lib/js/jquery.card.js"></script>
    <script src="../bower_components/bootstrap/js/tab.js"></script>
    <script src="../bower_components/datatables/media/js/jquery.dataTables.js"></script>
    <script src="../bower_components/datatables/media/js/dataTables.bootstrap.js"></script>
    <script src="../bower_components/jquery-validation/dist/jquery.validate.js"></script>
    <script src="../bower_components/jquery-validation/dist/additional-methods.js"></script>
    <script src="../bower_components/jquery-validation/src/localization/messages_ru.js"></script>
    <script src="../bower_components/twitter-bootstrap-wizard/jquery.bootstrap.wizard.js"></script>
    <script src="../bower_components/autocomplete/jquery.autocomplete.js"></script>
    <script src="../bower_components/checklist-model/checklist-model.js"></script>
    <script src="../bower_components/bootstrap-datepicker/js/bootstrap-datepicker.js"></script>
    <script src="../bower_components/bootstrap-datepicker/js/locales/bootstrap-datepicker.ru.js"></script>

    <script src="../scripts/datatables/locale.js"></script>

</head>
<body>

<div class="panel">

    <div class="container-fluid" ng-app="cadetApp" data-ng-controller="cadetCtrl" data-ng-init="init()">


        <div class="row" align="right">
            <a href="/logout"/>Выход</a></h2>
        </div>


        <br>
        <br>
        <br>

        <style>
            .disabledTab {
                pointer-events: none;
            }
        </style>

        <div class="row">
            <div class="col-lg-2"></div>
            <div class="col-xs-8">

                <form id="cadetForm" class="form-horizontal" role="form" data-ui-jq="validate"
                      data-ui-options="validationOpt">
                    <div class="box-tab justified" id="rootwizard">

                        <div class="navbar">
                            <div class="navbar-inner">
                                <div class="container">
                                    <ul>
                                        <li <%--class="disabledTab"--%>><a href="#tab1" data-toggle="tab">Общие
                                            данные</a></li>
                                        <li <%--class="disabledTab"--%>><a href="#tab5" data-toggle="tab">Адресные
                                            данные</a></li>
                                        <li <%--class="disabledTab"--%>><a href="#tab6" data-toggle="tab">Образование и
                                            навыки</a></li>
                                        <li <%--class="disabledTab"--%>><a href="#tab7" data-toggle="tab">Состав
                                            семьи</a></li>
                                        <li <%--class="disabledTab"--%>><a href="#tab8" data-toggle="tab">Здоровье</a>
                                        </li>
                                        <li <%--class="disabledTab"--%>><a href="#tab9" data-toggle="tab">Поведение</a>
                                        </li>
                                        <li <%--class="disabledTab"--%>><a href="#tab10"
                                                                           data-toggle="tab">Выезды за границу</a>
                                        </li>
                                        <li <%--class="disabledTab"--%>><a href="#tab11"
                                                                           data-toggle="tab">Дополнительно</a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>

                        <div class="tab-content">
                            <div class="tab-pane active" id="tab1">
                                <div class="container-fluid">
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

                                    <hr>


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
                                        <div class="col-sm-3">
                                            <select name="religion" id="religion"
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
                                        <div class="col-sm-3">
                                            <input type="text" style="display: none" class="form-control"
                                                   name="customReligion" id="customReligion"
                                                   ng-model="cadet.customReligion">
                                            <label id="customReligionLabel"></label>
                                        </div>
                                    </div>
                                    <hr>

                                    <div class="row">
                                        <label class="col-sm-4 control-label">Воинское звание</label>
                                        <div class="col-sm-8">
                                            <select name="militaryRank" id="militaryRank"
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
                                        <label class="col-sm-4 control-label">Подразделение</label>
                                        <div class="col-sm-8">
                                            <select name="division" id="division" ng-model="division">
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
                                                   ng-model="cadet.post">
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="row">
                                        <label class="col-sm-4 control-label">Номер паспорта</label>
                                        <div class="col-sm-8">
                                            <input type="text" class="form-control" name="passportNumber"
                                                   id="passportNumber" ng-model="cadet.passportNumber"
                                                   placeholder="**** ******" ui-passport>
                                        </div>
                                    </div>
                                    <br>
                                    <div class="row">
                                        <label class="col-sm-4 control-label">Номер военного билета</label>
                                        <div class="col-sm-8">
                                            <input type="text" class="form-control" name="militaryIdNumber"
                                                   id="militaryIdNumber" ng-model="cadet.militaryIdNumber"
                                                   placeholder="** *******" ui-military-ticket>
                                        </div>
                                    </div>
                                    <br>
                                    <div class="row">
                                        <label class="col-sm-4 control-label">Телефон</label>
                                        <div class="col-sm-8">
                                            <input type="text" class="form-control" name="phone" id="phone"
                                                   ng-model="cadet.phone" placeholder="+7(***)***-****" ui-phone>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane" id="tab5">
                                <div class="container-fluid">
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
                                                   ng-model="cadet.addressData.subjectOfPlaceOfBirth">
                                        </div>
                                    </div>
                                    <div class="row">
                                        <label class="col-sm-4 control-label"></label>
                                        <div class="col-sm-3" align="right">
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
                                        <div class="col-sm-4" align="left">
                                            <label class="control-label">Адрес регистрации:</label>
                                        </div>
                                        <div class="col-sm-3" align="right">
                                            <select name="subjectOfRegisteredAddressType"
                                                    id="subjectOfRegisteredAddressType"
                                                    ng-model="cadet.addressData.subjectOfRegisteredAddressType">
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
                                        <div class="col-sm-3" align="right">
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
                                        <div class="col-sm-3" align="right">
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
                                                    ng-model="cadet.addressData.subjectOfActualAddressType">
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
                                        <div class="col-sm-3" align="right">
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
                                        <div class="col-sm-3" align="right">
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
                            <div class="tab-pane" id="tab6">
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
                                    <hr>
                                    <div class="row" align="center">
                                        <label class="control-label">Образование</label>
                                    </div>
                                    <div class="row" align="center">
                                        <button ng-click="addEducation()">Добавить образование</button>
                                    </div>
                                    <br>
                                    <div class="row" ng-repeat="education in cadet.educations track by $index">
                                        <div class="col-sm-8">
                                            {{textByInstitutionType(education.institutionType)}}
                                            {{education.institutionType<5?(', '+education.institutionName+', '+education.specialty+', '+education.yearOfEnding+educationSubData(education)):''}}
                                        </div>
                                        <div class="col-sm-4">
                                            <button ng-click="editEducation($index)">Редактировать</button>
                                            <button ng-click="removeEducation($index)">Удалить</button>
                                        </div>
                                    </div>
                                    <hr>

                                    <div class="row" align="center">
                                        <label class="control-label">Навыки</label>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <label class=" control-label">компьютеры</label>
                                        </div>
                                        <div class="col-sm-6">
                                            <label class=" control-label">профессиональный спорт (при наличии
                                                разряда)</label>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-4">
                                            {{skillsTextByFoa1}}
                                        </div>
                                        <div class="col-sm-2">
                                            <button class="btn btn-default btn-xs"
                                                    ng-click="skillsByFieldOfActivity(1)">Редактировать
                                            </button>
                                        </div>
                                        <div class="col-sm-4">
                                            {{skillsTextByFoa2}}
                                        </div>
                                        <div class="col-sm-2">
                                            <button class="btn btn-default btn-xs"
                                                    ng-click="skillsByFieldOfActivity(2)">Редактировать
                                            </button>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-6">
                                            <label class=" control-label">искусство</label>
                                        </div>
                                        <div class="col-sm-6">
                                            <label class=" control-label">технические навыки</label>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-sm-4">
                                            {{skillsTextByFoa3}}
                                        </div>
                                        <div class="col-sm-2">
                                            <button class="btn btn-default btn-xs"
                                                    ng-click="skillsByFieldOfActivity(3)">Редактировать
                                            </button>
                                        </div>
                                        <div class="col-sm-4">
                                            {{skillsTextByFoa4}}
                                        </div>
                                        <div class="col-sm-2">
                                            <button class="btn btn-default btn-xs"
                                                    ng-click="skillsByFieldOfActivity(4)">Редактировать
                                            </button>
                                        </div>
                                    </div>

                                    <hr>
                                    <div class="row" align="center">
                                        <label class="control-label">Категории водительских прав</label>
                                    </div>
                                    <div class="row" align="center">
                                        <label ng-repeat="driverLicense in driversLicensesAll">
                                            <input type="checkbox" checklist-model="driversLicenses"
                                                   checklist-value="driverLicense"> {{driverLicense}}&nbsp;
                                        </label>
                                    </div>

                                    <hr>

                                    <div class="row" align="center">
                                        <label class=" control-label">Иностранные языки</label>
                                    </div>
                                    <div class="row" align="center">
                                        <button ng-click="addForeignLanguage()">Добавить язык</button>
                                    </div>
                                    <br>
                                    <div class="row"
                                         ng-repeat="foreignLanguage in cadet.foreignLanguages track by $index">
                                        <div class="col-lg-4">
                                            <select ng-model="foreignLanguage.language">
                                                <option value="1">английский</option>
                                                <option value="2">немецкий</option>
                                                <option value="3">французский</option>
                                                <option value="4">итальянский</option>
                                                <option value="5">испанский</option>
                                            </select>
                                        </div>
                                        <div class="col-lg-4">
                                            <select ng-model="foreignLanguage.level">
                                                <option value="1">свободно владею</option>
                                                <option value="2">средний уровень</option>
                                                <option value="3">базовый уровень</option>
                                            </select>
                                        </div>

                                        <div class="col-lg-2">
                                            <button ng-click="removeFamilyMember($index)">Удалить</button>
                                        </div>
                                    </div>

                                    <hr>
                                </div>
                            </div>
                            <div class="tab-pane" id="tab7">
                                <div class="container-fluid">
                                    <div class="row">
                                        <label class="col-sm-1 control-label">Состав семьи</label>
                                        <div class="col-sm-2">
                                            <select name="compositionOfFamily"
                                                    id="compositionOfFamily" ng-model="cadet.compositionOfFamily"
                                                    ng-change="compositionOfFamily()">
                                                <option value="1">
                                                    полная
                                                </option>
                                                <option value="2">
                                                    без отца
                                                </option>
                                                <option value="3">
                                                    без матери
                                                </option>
                                                <option value="4">
                                                    сирота
                                                </option>
                                            </select>
                                        </div>
                                        <div id="hasInformationAboutParentsId" style="display:none">
                                            <label class="col-sm-4 control-label">имеет ли сведения о родителях?</label>
                                            <div class="col-sm-2">
                                                <div class="btn-group btn-group-justified" role="group">
                                                    <div class="btn-group" role="group">
                                                        <button type="button"
                                                                class="btn btn-default btn-xs trueHasInformationAboutParents"
                                                                ng-click="setHasInformationAboutParents(true)">Да
                                                        </button>
                                                    </div>
                                                    <div class="btn-group" role="group">
                                                        <button type="button"
                                                                class="btn btn-default btn-xs falseHasInformationAboutParents"
                                                                ng-click="setHasInformationAboutParents(false)">Нет
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div id="withoutFatherId" style="display: none">
                                            <label class="col-sm-2 control-label">Укажите причину</label>
                                            <div class="col-sm-2">
                                                <select name="withoutFather"
                                                        id="withoutFather" ng-model="cadet.withoutFather">
                                                    <option value="1" onclick="$('#fatherExistId').attr('style','');">
                                                        родители в разводе
                                                    </option>
                                                    <option value="2" onclick="$('#fatherExistId').attr('style','');">
                                                        отец ушел из семьи
                                                    </option>
                                                    <option value="3"
                                                            onclick="$('#fatherExistId').attr('style','display:none');">
                                                        отец умер
                                                    </option>
                                                </select>
                                            </div>
                                            <div id="fatherExistId" style="display: none">
                                                <label class="col-sm-3 control-label">поддерживаете ли
                                                    отношения?</label>
                                                <div class="col-sm-2">
                                                    <div class="btn-group btn-group-justified" role="group">
                                                        <div class="btn-group" role="group">
                                                            <button type="button"
                                                                    class="btn btn-default trueFatherExist"
                                                                    ng-click="setFatherExist(true)">Да
                                                            </button>
                                                        </div>
                                                        <div class="btn-group" role="group">
                                                            <button type="button"
                                                                    class="btn btn-default falseFatherExist"
                                                                    ng-click="setFatherExist(false)">Нет
                                                            </button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                        <div id="withoutMotherId" style="display: none">
                                            <label class="col-sm-2 control-label">Укажите причину</label>
                                            <div class="col-sm-2">
                                                <select name="withoutMother"
                                                        id="withoutMother" ng-model="cadet.withoutMother">
                                                    <option value="1" onclick="$('#motherExistId').attr('style','');">
                                                        родители в разводе
                                                    </option>
                                                    <option value="2" onclick="$('#motherExistId').attr('style','');">
                                                        мать ушла из семьи
                                                    </option>
                                                    <option value="3"
                                                            onclick="$('#motherExistId').attr('style','display:none');">
                                                        мать умерла
                                                    </option>
                                                </select>
                                            </div>
                                            <div id="motherExistId" style="display: none">
                                                <label class="col-sm-3 control-label">поддерживаете ли
                                                    отношения?</label>
                                                <div class="col-sm-2">
                                                    <div class="btn-group btn-group-justified" role="group">
                                                        <div class="btn-group" role="group">
                                                            <button type="button"
                                                                    class="btn btn-default trueMotherExist"
                                                                    ng-click="setMotherExist(true)">Да
                                                            </button>
                                                        </div>
                                                        <div class="btn-group" role="group">
                                                            <button type="button"
                                                                    class="btn btn-default falseMotherExist"
                                                                    ng-click="setMotherExist(false)">Нет
                                                            </button>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="row">
                                        <label class="col-sm-4 control-label">Семейное положение</label>
                                        <div class="col-sm-2">
                                            <select name="married"
                                                    id="married" ng-model="cadet.married">
                                                <option value="1">холост</option>
                                                <option value="2">женат</option>
                                                <option value="3">в гражданском браке</option>
                                                <option value="4">состою в отношениях</option>
                                                <option value="5">вдовец</option>
                                            </select>
                                        </div>
                                        <label class="col-sm-4 control-label">Сколько браков вы заключали</label>
                                        <div class="col-sm-2">
                                            <select name="married"
                                                    id="marrieds" ng-model="cadet.marrieds">
                                                <option value="1">ни одного</option>
                                                <option value="2">один</option>
                                                <option value="3">два</option>
                                                <option value="4">три</option>
                                                <option value="5">четыре и более</option>
                                            </select>
                                        </div>
                                    </div>

                                    <hr>
                                    <div class="row" align="center">
                                        <button ng-click="addFamilyMember()">Добавить члена семьи</button>
                                    </div>
                                    <hr>
                                    <%--<div class="row">
                                        <div class="col-sm-2">
                                            Родственная связь
                                        </div>
                                        <div class="col-sm-4">
                                            ФИО
                                        </div>

                                        <div class="col-sm-2">
                                            Управление
                                        </div>
                                    </div>--%>
                                    <div class="row"
                                         ng-repeat="familyMember in cadet.familyMembers track by $index">
                                        <div class="col-sm-2">
                                            {{textByFamilyMemberType(familyMember.familyMemberType)}}
                                        </div>

                                        <div class="col-sm-4">
                                            {{familyMember.lastName+' '+familyMember.firstName+'
                                            '+familyMember.patronymic}}
                                        </div>

                                        <div class="col-sm-4">
                                            <button ng-click="editFamilyMember($index)">Редактировать</button>
                                            <button ng-click="removeFamilyMember($index)">Удалить</button>
                                        </div>
                                    </div>
                                    <br>
                                </div>
                                <hr>
                            </div>
                            <div class="tab-pane" id="tab8">
                                <div class="container-fluid">
                                    <div class="row">
                                        <label class="col-sm-4 control-label">сотрясений головного мозга не
                                            было?</label>
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
                                                            class="btn btn-default falseConcussionsWereNot "
                                                            ng-click="setConcussionsWereNot(false)">Нет
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="row">
                                        <label class="col-sm-4 control-label">черепно-мозговых травм не
                                            было?</label>
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
                                                            class="btn btn-default falseTraumaticBrainInjuryWasNot"
                                                            ng-click="setTraumaticBrainInjuryWasNot(false)">Нет
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="row">
                                        <label class="col-sm-4 control-label">на учёте у нарколога не
                                            состоял?</label>
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
                                                            class="btn btn-default falseTheNarcologWasNot"
                                                            ng-click="setTheNarcologWasNot(false)">Нет
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <hr>
                                    <div class="row">
                                        <label class="col-sm-4 control-label">на учёте у психиатра не
                                            состоял?</label>
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
                                                            class="btn btn-default falseThePsychiatristWasNot"
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
                                            <input type="text" class="form-control" name="validityCategory"
                                                   id="categoryDate" ng-model="cadet.validityCategory">
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane" id="tab9">
                                <div class="container-fluid">
                                    <div class="row">
                                        <label class="col-sm-4 control-label">мыслей о суициде не имеет?</label>
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
                                                            class="btn btn-default falseThoughtsOfSuicideDoesNotHave"
                                                            ng-click="setThoughtsOfSuicideDoesNotHave(false)">Нет
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <br>
                                    <div class="row">
                                        <label class="col-sm-4 control-label">попыток суицида не совершал?</label>
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
                                                            class="btn btn-default falseSuicideAttemptsDidNotCommit"
                                                            ng-click="setSuicideAttemptsDidNotCommit(false)">Нет
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <br>
                                    <div class="row">
                                        <label class="col-sm-4 control-label">административные правонарушения не
                                            совершал?</label>
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
                                                            class="btn btn-default falseAdministrativeOffenseDidNotCommit"
                                                            ng-click="setAdministrativeOffenseDidNotCommit(false)">
                                                        Нет
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <br>
                                    <div class="row">
                                        <label class="col-sm-4 control-label">приводов в полицию не имеет?</label>
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
                                                            class="btn btn-default falsePoliceRecordDoesNotHave"
                                                            ng-click="setPoliceRecordDoesNotHave(false)">Нет
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <br>
                                    <div class="row">
                                        <label class="col-sm-4 control-label">к уголовной ответственности не
                                            привлекался?</label>
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
                                                            class="btn btn-default falseCriminalLiabilityWasNotInvolved"
                                                            ng-click="setCriminalLiabilityWasNotInvolved(false)">Нет
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <br>
                                </div>
                            </div>

                            <div class="tab-pane" id="tab10">
                                <div class="container-fluid">
                                    <div class="row" align="center">
                                        <label class=" control-label">Родственники, друзья проживающие за
                                            границей</label>
                                    </div>
                                    <div class="row" align="center">
                                        <button ng-click="addTripsAbroad()">Добавить</button>
                                    </div>
                                    <br>
                                    <div class="row"
                                         ng-repeat="tripsAbroadItem in cadet.tripsAbroads track by $index">
                                        <div class="col-lg-2">
                                            <label>{{tripsAbroadItem.who}}</label>
                                        </div>
                                        <div class="col-lg-3">
                                            <label>{{tripsAbroadItem.firstName+' '+tripsAbroadItem.lastName+'
                                                '+tripsAbroadItem.patronymic}}</label>
                                        </div>
                                        <div class="col-lg-3">
                                            <label>{{tripsAbroadItem.country}}</label>
                                        </div>
                                        <div class="col-lg-2">
                                            <label>
                                                {{tripsAbroadItem.doMaintainARelationship==true?'Поддерживает
                                                отношения':''}}
                                                {{tripsAbroadItem.doMaintainARelationship==false?'Не поддерживает
                                                отношения':''}}
                                            </label>
                                        </div>
                                        <div class="col-lg-2">
                                            <button ng-click="editTripsAbroad($index)">Редактировать</button>
                                            <button ng-click="removeTripsAbroad($index)">Удалить</button>
                                        </div>
                                    </div>
                                </div>
                            </div>


                            <div class="tab-pane" id="tab11">
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
                                    <%--<div class="row">
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
                                                            class="btn btn-default falseRelativesAndFriendsAbroad"
                                                            ng-click="setRelativesAndFriendsAbroad(false)">Нет
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>--%>
                                </div>
                            </div>
                            <br>
                            <ul class="pager wizard">
                                <li class="previous"><a href="javascript:;">Предыдущая</a></li>
                                <li class="next"><a href="javascript:;">Следующая</a></li>
                                <li class="finish" style="display:none"><a href="javascript:;"
                                                                           ng-click="submit()">Сохранить</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </form>

            </div>

            <div class="col-lg-2"></div>

        </div>

        <input type="hidden"
               name="${_csrf.parameterName}" id="csrfParameter"
               value="${_csrf.token}"/>


        <!-- Modal -->
        <div class="modal fade" id="familyMemberModal" tabindex="-1" role="dialog"
             aria-labelledby="familyMemberModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content" style="width:1000px" align="center">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="familyMemberModalLabel">Член семьи</h4>
                    </div>
                    <div class="modal-body">
                        <div class="container-fluid">
                            <div class="row">
                                <label class="col-sm-3 control-label">Родственная связь</label>
                                <div class="col-sm-2">
                                    <select name="familyMemberType" ng-model="familyMember.familyMemberType">
                                        <option value="1"
                                                onclick="$('#isBroughtUpSeparatelyId').attr('style','display:none');">
                                            мать
                                        </option>
                                        <option value="2"
                                                onclick="$('#isBroughtUpSeparatelyId').attr('style','display:none');">
                                            отец
                                        </option>
                                        <option value="3"
                                                onclick="$('#isBroughtUpSeparatelyId').attr('style','display:none');">
                                            мачеха
                                        </option>
                                        <option value="4"
                                                onclick="$('#isBroughtUpSeparatelyId').attr('style','display:none');">
                                            отчим
                                        </option>
                                        <option value="5"
                                                onclick="$('#isBroughtUpSeparatelyId').attr('style','display:none');">
                                            опекун
                                        </option>
                                        <option value="6"
                                                onclick="$('#isBroughtUpSeparatelyId').attr('style','display:none');">
                                            брат
                                        </option>
                                        <option value="7"
                                                onclick="$('#isBroughtUpSeparatelyId').attr('style','display:none');">
                                            сестра
                                        </option>
                                        <option value="8"
                                                onclick="$('#isBroughtUpSeparatelyId').attr('style','display:none');">
                                            жена
                                        </option>
                                        <option value="9" onclick="$('#isBroughtUpSeparatelyId').attr('style','');">
                                            сын
                                        </option>
                                        <option value="10" onclick="$('#isBroughtUpSeparatelyId').attr('style','');">
                                            дочь
                                        </option>
                                    </select>
                                </div>
                                <div id="isBroughtUpSeparatelyId" style="display:none">
                                    <label class="col-sm-4 control-label">воспитывается отдельно?</label>
                                    <div class="col-sm-2">
                                        <div class="btn-group btn-group-justified" role="group">
                                            <div class="btn-group" role="group">
                                                <button type="button"
                                                        class="btn btn-default btn-xs trueFamilyMemberIsBroughtUpSeparately"
                                                        ng-click="setFamilyMemberIsBroughtUpSeparately(true)">Да
                                                </button>
                                            </div>
                                            <div class="btn-group" role="group">
                                                <button type="button"
                                                        class="btn btn-default btn-xs falseFamilyMemberIsBroughtUpSeparately"
                                                        ng-click="setFamilyMemberIsBroughtUpSeparately(false)">Нет
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                            </div>
                            <br>
                            <div class="row">
                                <label class="col-sm-1 control-label">Фамилия</label>
                                <div class="col-sm-3">
                                    <input type="text" class="form-control" name="familyMemberLastName"
                                           id="familyMemberLastName"
                                           ng-model="familyMember.lastName">
                                </div>
                                <label class="col-sm-1 control-label">Имя</label>
                                <div class="col-sm-3">
                                    <input type="text" class="form-control" name="familyMemberFirstName"
                                           id="familyMemberFirstName"
                                           ng-model="familyMember.firstName">
                                </div>
                                <label class="col-sm-1 control-label">Отчество</label>
                                <div class="col-sm-3">
                                    <input type="text" class="form-control" name="familyMemberPatronymic"
                                           id="familyMemberPatronymic"
                                           ng-model="familyMember.patronymic">
                                </div>
                            </div>
                            <br>
                            <div class="row">
                                <label class="col-sm-1 control-label">Дата рождения</label>
                                <div class="col-sm-2">
                                    <input type="text" class="form-control" name="familyMemberDateOfBirth"
                                           id="familyMemberDateOfBirth"
                                           ng-model="familyMember.dateOfBirth">
                                </div>
                                <label class="col-sm-2 control-label">Род деятельности</label>
                                <div class="col-sm-3">
                                    <input type="text" class="form-control" name="familyMemberOccupation"
                                           id="familyMemberOccupation"
                                           ng-model="familyMember.occupation">
                                </div>
                                <label class="col-sm-2 control-label">Номер телефона</label>
                                <div class="col-sm-2">
                                    <input type="text" class="form-control" name="familyMemberPhone"
                                           id="familyMemberPhone"
                                           ng-model="familyMember.phone">
                                </div>
                            </div>
                            <br>
                            <div class="row" align="right">
                                <label class="col-sm-4 control-label">проходил/а лечение от алкоголизма?</label>
                                <div class="col-sm-2">
                                    <div class="btn-group btn-group-justified" role="group">
                                        <div class="btn-group" role="group">
                                            <button type="button"
                                                    class="btn btn-default btn-xs trueFamilyMemberWasTreatedForAlcoholism"
                                                    ng-click="setFamilyMemberWasTreatedForAlcoholism(true)">Да
                                            </button>
                                        </div>
                                        <div class="btn-group" role="group">
                                            <button type="button"
                                                    class="btn btn-default btn-xs falseFamilyMemberWasTreatedForAlcoholism"
                                                    ng-click="setFamilyMemberWasTreatedForAlcoholism(false)">Нет
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row" align="right">
                                <label class="col-sm-4 control-label">проходил/а лечение от наркомании?</label>
                                <div class="col-sm-2">
                                    <div class="btn-group btn-group-justified" role="group">
                                        <div class="btn-group" role="group">
                                            <button type="button"
                                                    class="btn btn-default btn-xs trueFamilyMemberWasTreatedForAddiction"
                                                    ng-click="setFamilyMemberWasTreatedForAddiction(true)">Да
                                            </button>
                                        </div>
                                        <div class="btn-group" role="group">
                                            <button type="button"
                                                    class="btn btn-default btn-xs falseFamilyMemberWasTreatedForAddiction"
                                                    ng-click="setFamilyMemberWasTreatedForAddiction(false)">Нет
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row" align="right">
                                <label class="col-sm-4 control-label">имеет судимость?</label>
                                <div class="col-sm-2">
                                    <div class="btn-group btn-group-justified" role="group">
                                        <div class="btn-group" role="group">
                                            <button type="button"
                                                    class="btn btn-default btn-xs trueFamilyMemberHasACriminalRecord"
                                                    ng-click="setFamilyMemberHasACriminalRecord(true)">Да
                                            </button>
                                        </div>
                                        <div class="btn-group" role="group">
                                            <button type="button"
                                                    class="btn btn-default btn-xs falseFamilyMemberHasACriminalRecord"
                                                    ng-click="setFamilyMemberHasACriminalRecord(false)">Нет
                                            </button>
                                        </div>
                                    </div>
                                </div>
                                <div class="hasACriminalRecordClass">
                                    <label class="col-sm-2 control-label">Укажите статью и период</label>
                                    <div class="col-sm-4">
                                        <input type="text" class="form-control" name="hasACriminalRecordDetails"
                                               id="hasACriminalRecordDetails"
                                               ng-model="familyMember.hasACriminalRecordDetails">
                                    </div>
                                </div>
                            </div>
                            <div class="row" align="right">
                                <label class="col-sm-4 control-label">имеет психическое заболевание?</label>
                                <div class="col-sm-2">
                                    <div class="btn-group btn-group-justified" role="group">
                                        <div class="btn-group" role="group">
                                            <button type="button"
                                                    class="btn btn-default btn-xs trueFamilyMemberHasAMentalIllness"
                                                    ng-click="setFamilyMemberHasAMentalIllness(true)">Да
                                            </button>
                                        </div>
                                        <div class="btn-group" role="group">
                                            <button type="button"
                                                    class="btn btn-default btn-xs falseFamilyMemberHasAMentalIllness"
                                                    ng-click="setFamilyMemberHasAMentalIllness(false)">Нет
                                            </button>
                                        </div>
                                    </div>
                                </div>
                                <div class="hasAMentalIllnessClass">
                                    <label class="col-sm-2 control-label">Укажите какое</label>
                                    <div class="col-sm-4">
                                        <input type="text" class="form-control" name="hasAMentalIllnessName"
                                               id="hasAMentalIllnessName"
                                               ng-model="familyMember.hasAMentalIllnessName">
                                    </div>
                                </div>
                            </div>
                            <div class="row" align="right">
                                <label class="col-sm-4 control-label">имеет попытки суицида?</label>
                                <div class="col-sm-2">
                                    <div class="btn-group btn-group-justified" role="group">
                                        <div class="btn-group" role="group">
                                            <button type="button"
                                                    class="btn btn-default btn-xs trueFamilyMemberHasSuicideAttempts"
                                                    ng-click="setFamilyMemberHasSuicideAttempts(true)">Да
                                            </button>
                                        </div>
                                        <div class="btn-group" role="group">
                                            <button type="button"
                                                    class="btn btn-default btn-xs falseFamilyMemberHasSuicideAttempts"
                                                    ng-click="setFamilyMemberHasSuicideAttempts(false)">Нет
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row" align="right">
                                <label class="col-sm-4 control-label">имеет инвалидность?</label>
                                <div class="col-sm-2">
                                    <div class="btn-group btn-group-justified" role="group">
                                        <div class="btn-group" role="group">
                                            <button type="button"
                                                    class="btn btn-default btn-xs trueFamilyMemberHasADisability"
                                                    ng-click="setFamilyMemberHasADisability(true)">Да
                                            </button>
                                        </div>
                                        <div class="btn-group" role="group">
                                            <button type="button"
                                                    class="btn btn-default btn-xs falseFamilyMemberHasADisability"
                                                    ng-click="setFamilyMemberHasADisability(false)">Нет
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row" align="right">
                                <label class="col-sm-4 control-label">умер/умерла?</label>
                                <div class="col-sm-2">
                                    <div class="btn-group btn-group-justified" role="group">
                                        <div class="btn-group" role="group">
                                            <button type="button"
                                                    class="btn btn-default btn-xs trueFamilyMemberHasDied"
                                                    ng-click="setFamilyMemberHasDied(true)">Да
                                            </button>
                                        </div>
                                        <div class="btn-group" role="group">
                                            <button type="button"
                                                    class="btn btn-default btn-xs falseFamilyMemberHasDied"
                                                    ng-click="setFamilyMemberHasDied(false)">Нет
                                            </button>
                                        </div>
                                    </div>
                                </div>
                                <div class="hasDiedClass">
                                    <label class="col-sm-2 control-label">В каком году?</label>
                                    <div class="col-sm-4">
                                        <input type="text" class="form-control" name="familyMemberHasDiedYear"
                                               id="familyMemberHasDiedYear"
                                               ng-model="familyMember.familyMemberHasDiedYear">
                                    </div>
                                </div>
                            </div>

                            <div class="hasDiedClass">
                                <div class="row" align="right">
                                    <label class="col-sm-2 control-label">Причина смерти</label>
                                    <div class="col-sm-4">
                                        <input type="text" class="form-control" name="familyMemberHasDiedCause"
                                               id="familyMemberHasDiedCause"
                                               ng-model="familyMember.familyMemberHasDiedCause">

                                    </div>

                                    <label class="col-sm-2 control-label">Место захоронения</label>
                                    <div class="col-sm-4">
                                        <input type="text" class="form-control" name="familyMemberHasDiedPlace"
                                               id="familyMemberHasDiedPlace"
                                               ng-model="familyMember.familyMemberHasDiedPlace">
                                    </div>
                                </div>
                            </div>

                            <hr>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Закрыть</button>
                        <button type="button" class="btn btn-primary" ng-click="saveFamilyMember()">Сохранить</button>
                    </div>
                </div>
            </div>
        </div>


        <!-- Modal -->
        <div class="modal fade" id="educationModal" tabindex="-1" role="dialog"
             aria-labelledby="educationModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content" style="width:900">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="educationModalLabel">Образование</h4>
                    </div>
                    <div class="modal-body">
                        <div class="container-fluid">

                            <div class="row">
                                <div class="col-sm-8">
                                    <div class="row">
                                        <label class="col-sm-4 control-label">Тип Образования</label>
                                        <div class="col-sm-8">
                                            <select name="institutionType" ng-model="education.institutionType"
                                                    ng-change="changeInstitutionType()">
                                                <option value="1">
                                                    Высшее профессиональное (магистр)
                                                </option>
                                                <option value="2">
                                                    Высшее профессиональное
                                                </option>
                                                <option value="3">
                                                    Среднее профессиональное
                                                </option>
                                                <option value="4">
                                                    Начальное профессиональное
                                                </option>
                                                <option value="5">
                                                    Среднее полное (11 классов)
                                                </option>
                                                <option value="6">
                                                    Среднее общее (9 классов)
                                                </option>
                                                <option value="7">
                                                    Среднее начальное (4 класса)
                                                </option>
                                            </select>
                                        </div>
                                    </div>
                                    <div id="notSchoolEducationDiv">
                                        <br>
                                        <div class="row">
                                            <label class="col-sm-4 control-label">Учебное заведение</label>
                                            <div class="col-sm-8">
                                                <input type="text" class="form-control" name="institutionName"
                                                       id="institutionName"
                                                       ng-model="education.institutionName">
                                            </div>
                                        </div>
                                        <br>
                                        <div class="row">
                                            <label class="col-sm-4 control-label">Специальность</label>
                                            <div class="col-sm-8">
                                                <input type="text" class="form-control" name="educationSpecialty"
                                                       id="educationSpecialty"
                                                       ng-model="education.specialty">
                                            </div>
                                        </div>
                                        <br>
                                        <div class="row">
                                            <label class="col-sm-4 control-label">Год окончания</label>
                                            <div class="col-sm-8">
                                                <input type="text" class="form-control" name="yearOfEnding"
                                                       id="yearOfEnding"
                                                       ng-model="education.yearOfEnding">
                                            </div>

                                        </div>
                                    </div>

                                </div>
                                <div class="col-sm-4">

                                    <div class="row" id="unfinishedDiv">
                                        <label class="col-sm-6 control-label">Неоконченное</label>
                                        <div class="col-sm-6">
                                            <div class="btn-group btn-group-justified" role="group">
                                                <div class="btn-group" role="group">
                                                    <button type="button"
                                                            class="btn btn-default btn-xs trueEducationUnfinished"
                                                            ng-click="setEducationUnfinished(true)">Да
                                                    </button>
                                                </div>
                                                <div class="btn-group" role="group">
                                                    <button type="button"
                                                            class="btn btn-default btn-xs falseEducationUnfinished"
                                                            ng-click="setEducationUnfinished(false)">Нет
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div id="highAchieverDiv" style="display: none">
                                        <br>
                                        <div class="row">

                                            <label class="col-sm-6 control-label">Отличник</label>
                                            <div class="col-sm-6">
                                                <div class="btn-group btn-group-justified" role="group">
                                                    <div class="btn-group" role="group">
                                                        <button type="button"
                                                                class="btn btn-default btn-xs trueEducationHighAchiever"
                                                                ng-click="setEducationHighAchiever(true)">Да
                                                        </button>
                                                    </div>
                                                    <div class="btn-group" role="group">
                                                        <button type="button"
                                                                class="btn btn-default btn-xs falseEducationHighAchiever"
                                                                ng-click="setEducationHighAchiever(false)">Нет
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div id="redDiplomaDiv">
                                        <br>
                                        <div class="row">
                                            <label class="col-sm-6 control-label">Красный диплом</label>
                                            <div class="col-sm-6">
                                                <div class="btn-group btn-group-justified" role="group">
                                                    <div class="btn-group" role="group">
                                                        <button type="button"
                                                                class="btn btn-default btn-xs trueEducationRedDiploma"
                                                                ng-click="setEducationRedDiploma(true)">Да
                                                        </button>
                                                    </div>
                                                    <div class="btn-group" role="group">
                                                        <button type="button"
                                                                class="btn btn-default btn-xs falseEducationRedDiploma"
                                                                ng-click="setEducationRedDiploma(false)">Нет
                                                        </button>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Закрыть</button>
                        <button type="button" class="btn btn-primary" ng-click="saveEducation()">Сохранить</button>
                    </div>
                </div>
            </div>
        </div>


        <!-- Modal -->
        <div class="modal fade" id="skillsModal" tabindex="-1" role="dialog"
             aria-labelledby="skillsModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content" style="width:900">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="skillsModalLabel">Навыки</h4>
                    </div>
                    <div class="modal-body">
                        <div class="container-fluid">
                            <div class="row" ng-repeat="skill in actualSkills">
                                <div class="col-lg-12">
                                    <input type="checkbox" checklist-model="skills" checklist-value="skill.id">
                                    {{skill.name}}
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal"
                                ng-click="loadSkillsByFoa();">Закрыть
                        </button>
                    </div>
                </div>
            </div>
        </div>


        <!-- Modal -->
        <div class="modal fade" id="tripsAbroadModal" tabindex="-1" role="dialog"
             aria-labelledby="skillsModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content" style="width:900">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="tripsAbroadModalLabel">Навыки</h4>
                    </div>
                    <div class="modal-body">
                        <div class="container-fluid">
                            <div class="row">
                                <label class="col-sm-4 control-label">Кем приходится</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" name="tripsAbroadWho"
                                           id="tripsAbroadWho"
                                           ng-model="tripsAbroad.who">
                                </div>
                            </div>
                            <div class="row">
                                <label class="col-sm-4 control-label">Фамилия</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" name="tripsAbroadLastName"
                                           id="tripsAbroadLastName"
                                           ng-model="tripsAbroad.lastName">
                                </div>
                            </div>
                            <div class="row">
                                <label class="col-sm-4 control-label">Имя</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" name="tripsAbroadFirstName"
                                           id="tripsAbroadFirstName"
                                           ng-model="tripsAbroad.firstName">
                                </div>
                            </div>
                            <div class="row">
                                <label class="col-sm-4 control-label">Отчество</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" name="tripsAbroadPatronymic"
                                           id="tripsAbroadPatronymic"
                                           ng-model="tripsAbroad.patronymic">
                                </div>
                            </div>

                            <div class="row">
                                <label class="col-sm-4 control-label">Страна проживания</label>
                                <div class="col-sm-8">
                                    <input type="text" class="form-control" name="tripsAbroadCountry"
                                           id="tripsAbroadCountry"
                                           ng-model="tripsAbroad.country">
                                </div>
                            </div>
                            <label class="col-sm-4 control-label">Поддерживаете ли вы отношения?</label>
                            <div class="col-sm-8">
                                <div class="btn-group btn-group-justified" role="group">
                                    <div class="btn-group" role="group">
                                        <button type="button"
                                                class="btn btn-default btn-xs trueDoMaintainARelationShip"
                                                ng-click="setDoMaintainARelationShip(true)">Да
                                        </button>
                                    </div>
                                    <div class="btn-group" role="group">
                                        <button type="button"
                                                class="btn btn-default btn-xs falseDoMaintainARelationShip"
                                                ng-click="setDoMaintainARelationShip(false)">Нет
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">Закрыть</button>
                        <button type="button" class="btn btn-primary" ng-click="saveTripsAbroad()">Сохранить</button>
                    </div>
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
