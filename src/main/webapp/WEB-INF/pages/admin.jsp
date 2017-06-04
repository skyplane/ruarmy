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
    <title>Учетные записи</title>

    <link rel="stylesheet" type="text/css" href="../bower_components/chosen_v1.4.0/chosen.min.css"/>
    <link rel="stylesheet" type="text/css" href="../bower_components/checkbo/src/0.1.4/css/checkBo.min.css"/>

    <link rel="stylesheet" type="text/css" href="../bower_components/bootstrap/dist/css/bootstrap.css"/>
    <link rel="stylesheet" type="text/css" href="../bower_components/bootstrap/dist/css/bootstrap-theme.css"/>

    <link rel="stylesheet" type="text/css" href="../bower_components/datatables/media/css/jquery.dataTables.css"/>
    <link rel="stylesheet" type="text/css" href="../bower_components/datatables/media/css/dataTables.bootstrap.css"/>

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
    <script src="../bower_components/checklist-model/checklist-model.js"></script>
    <script src="../scripts/datatables/locale.js"></script>


</head>
<body>


<div class="container-fluid" ng-app="usersApp" data-ng-controller="usersCtrl" data-ng-init="init()">
    <style>
        table.dataTable thead .sorting:after {
            content: ""
        }

        table.dataTable thead .sorting_asc:after {
            content: ""
        }

        table.dataTable thead .sorting_desc:after {
            content: ""
        }
    </style>
    <div class="row" align="right">
        <a href="/logout"/>Выход</a></h2>
    </div>
    <div class="panel panel-default">
        <div class="panel-heading">
            <h3 class="panel-title">Пользователи</h3>
        </div>
        <div class="panel-body">
            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="container-fluid">
                        <div class="row">
                            <table class="table table-bordered bordered table-striped table-condensed datatable"
                                   id="usersTable">
                                <thead>
                                <tr>
                                    <th style='font-size:12px;'>
                                        ID
                                    </th>
                                    <th style='font-size:12px;'>
                                        Логин
                                    </th>
                                    <th style='font-size:12px;'>
                                        Пароль
                                    </th>
                                    <th style='font-size:12px;'>
                                        Роль
                                    </th>
                                </tr>
                                </thead>
                                <tfoot>
                                <tr>
                                    <th style='font-size:12px;'>
                                        ID
                                    </th>
                                    <th style='font-size:12px;'>
                                        Логин
                                    </th>
                                    <th style='font-size:12px;'>
                                        Пароль
                                    </th>
                                    <th style='font-size:12px;'>
                                        Роль
                                    </th>
                                </tr>
                                </tfoot>
                            </table>

                        </div>
                    </div>
                </div>
            </div>
        </div>


        <div class="container-fluid form-group">
            <div class="row">
                <a type="button" class="btn btn-primary btn-outline" data-toggle="modal" data-target="#userModal"
                   ng-click="clearUserData()">
                    Добавить пользователя
                </a>
                <button style="display: none" type="button" class="btn btn-primary btn-outline editUser"
                        data-toggle="modal"
                        data-target="#userModal">
                    Редактировать пользователя
                </button>
            </div>

            <div class="modal fade" id="userModal" tabindex="-1" role="dialog" aria-labelledby="userModalLabel">
                <div class="modal-dialog" role="document" style="width:1138px;">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                    aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title" id="userModalLabel">Добавление/редактирование пользователя</h4>
                        </div>
                        <form class="modal-body form-horizontal" id="addUserForm" ui-jq="validate"
                              ui-options="validationOpt">
                            <div class="panel panel-default">
                                <div class="panel-body">
                                    <div class="container-fluid">
                                        <div class="row">

                                            <label class="col-md-2 control-label">Логин</label>
                                            <div class="col-md-4">
                                                <input type="text" name="id" id="id" ng-model="user.id" readonly
                                                       style="display: none">
                                                <input type="text"
                                                       class="form-control  ng-pristine ng-untouched ng-valid "
                                                       name="login"
                                                       id="login" ng-model="user.login"></div>
                                        </div>
                                        <br>
                                        <div class="row">
                                            <label class="col-md-2 control-label">Пароль</label>
                                            <div class="col-md-4"><input type="password"
                                                                         class="form-control  ng-pristine ng-untouched ng-valid "
                                                                         name="password" id="password"
                                                                         ng-model="user.password">
                                            </div>
                                            <label class="col-md-2 control-label">Подтверждение пароля</label>
                                            <div class="col-md-4"><input type="password"
                                                                         class="form-control  ng-pristine ng-untouched ng-valid "
                                                                         name="password1" id="password1"
                                                                         ng-model="user.password1"></div>
                                        </div>
                                        <div class="row">
                                            <label class="col-md-2 control-label">Роль</label>
                                            <div class="col-md-4">
                                                <select name="role" id="role" ng-model="user.role">
                                                    <option class="roleOption" ng-selected="true" value="">---</option>
                                                    <option class="roleOption" ng-repeat="role in roles"
                                                            value="{{role.key}}">
                                                        {{role.value}}
                                                    </option>
                                                </select>
                                            </div>
                                        </div>
                                        <br>
                                        <div class="row">
                                            <label class="col-md-2 control-label">Профиль</label>
                                            <div class="col-md-4">
                                                <select ng-model="userProfile"
                                                        ng-options="template.id as template.profileName for template in options.profiles">
                                                </select>
                                            </div>
                                        </div>


                                        <div class="container-fluid">
                                            <%--                                            <div class="row">
                                                                                            <div class="checkbox"  >
                                                                                                <label ng-repeat="division in options.divisions">
                                                                                                    &nbsp;&nbsp;&nbsp;
                                                                                                    <input type="checkbox" checklist-model="getDivisions()" ng-model="d" checklist-value="division" ng-change="check(division, checked)"> {{division.name}}
                                                                                                </label>
                                                                                            </div>
                                                                                                                                                                                                                                                                                                               </div>
                                                                                        <br>--%>
                                            <div class="row">
                                                <a href ng-click="checkAll()" class="btn btn-primary btn-outline">Выбрать
                                                    все</a>
                                                <a href ng-click="uncheckAll()" class="btn btn-primary btn-outline">Не
                                                    выбрать ни одного</a>
                                            </div>

                                            <div class="row">
                                                <label ng-repeat="division in options.divisions">
                                                    <input type="checkbox" checklist-model="tmp.divisions"
                                                           checklist-value="division.id"> {{division.name}}
                                                </label>
                                            </div>

                                        </div>


                                        <br>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-primary btn-outline"
                                                    ng-click="userSubmit()">
                                                Сохранить
                                            </button>
                                            <button type="button" class="btn btn-default btn-outline"
                                                    data-dismiss="modal">
                                                Закрыть
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="panel panel-default">
        <div class="panel-heading">
            <h3 class="panel-title">Профили</h3>
        </div>
        <div class="panel-body">
            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="container-fluid">
                        <div class="row">
                            <table class="table table-bordered bordered table-striped table-condensed datatable"
                                   id="profilesTable">
                                <thead>
                                <tr>
                                    <th style='font-size:12px;'>
                                        ID
                                    </th>
                                    <th style='font-size:12px;'>
                                        Название
                                    </th>
                                </tr>
                                </thead>
                                <tfoot>
                                <tr>
                                    <th style='font-size:12px;'>
                                        ID
                                    </th>
                                    <th style='font-size:12px;'>
                                        Название
                                    </th>
                                </tr>
                                </tfoot>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="container-fluid form-group">
            <div class="row">
                <a type="button" class="btn btn-primary btn-outline" data-toggle="modal" data-target="#profileModal"
                   ng-click="clearProfileData()">
                    Добавить профиль
                </a>
                <button style="display: none" type="button" class="btn btn-primary btn-outline editProfile"
                        data-toggle="modal"
                        data-target="#profileModal">
                    Редактировать профиль
                </button>
            </div>

            <div class="modal fade" id="profileModal" tabindex="-1" role="dialog" aria-labelledby="profileModalLabel">
                <div class="modal-dialog" role="document" style="width:1138px;">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                    aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title" id="profileModalLabel">Добавление/редактирование профиля</h4>
                        </div>


                        <form class="modal-body form-horizontal" id="addProfileForm" ui-jq="validate"
                              ui-options="validationOpt">

                            <div class="panel panel-default">
                                <div class="panel-body">
                                    <div class="container-fluid">
                                        <div class="row">

                                            <label class="col-md-2 control-label">Название профиля</label>
                                            <div class="col-md-4">
                                                <input type="text" name="id" id="profileId" ng-model="profile.id"
                                                       readonly
                                                       style="display: none">
                                                <input type="text"
                                                       class="form-control  ng-pristine ng-untouched ng-valid "
                                                       name="profileName"
                                                       id="profileName" ng-model="profile.profileName"></div>
                                        </div>
                                        <br>
                                        <div class="row">
                                            <label class="col-md-2 control-label">Факультет</label>
                                            <div class="col-md-2">
                                                <label>
                                                    <input type="radio" ng-model="profile.faculty" value="DENIED">
                                                    Не доступно
                                                </label>
                                                <label>
                                                    <input type="radio" ng-model="profile.faculty" value="READ">
                                                    Просмотр
                                                </label>
                                                <label>
                                                    <input type="radio" ng-model="profile.faculty" value="WRITE">
                                                    Редактирование
                                                </label>
                                            </div>
                                            <label class="col-md-2 control-label">Специальность</label>
                                            <div class="col-md-2">
                                                <label>
                                                    <input type="radio" ng-model="profile.specialty" value="DENIED">
                                                    Не доступно
                                                </label>
                                                <label>
                                                    <input type="radio" ng-model="profile.specialty" value="READ">
                                                    Просмотр
                                                </label>
                                                <label>
                                                    <input type="radio" ng-model="profile.specialty" value="WRITE">
                                                    Редактирование
                                                </label>
                                            </div>
                                            <label class="col-md-2 control-label">Год поступления</label>
                                            <div class="col-md-2">
                                                <label>
                                                    <input type="radio" ng-model="profile.yearOfAdmission"
                                                           value="DENIED">
                                                    Не доступно
                                                </label>
                                                <label>
                                                    <input type="radio" ng-model="profile.yearOfAdmission" value="READ">
                                                    Просмотр
                                                </label>
                                                <label>
                                                    <input type="radio" ng-model="profile.yearOfAdmission"
                                                           value="WRITE">
                                                    Редактирование
                                                </label>
                                            </div>
                                        </div>
                                        <hr>
                                        <div class="row">
                                            <label class="col-md-2 control-label">Воинское звание</label>
                                            <div class="col-md-2">
                                                <label>
                                                    <input type="radio" ng-model="profile.militaryRank" value="DENIED">
                                                    Не доступно
                                                </label>
                                                <label>
                                                    <input type="radio" ng-model="profile.militaryRank" value="READ">
                                                    Просмотр
                                                </label>
                                                <label>
                                                    <input type="radio" ng-model="profile.militaryRank" value="WRITE">
                                                    Редактирование
                                                </label>
                                            </div>
                                            <label class="col-md-2 control-label">Фамилия</label>
                                            <div class="col-md-2">
                                                <label>
                                                    <input type="radio" ng-model="profile.surname" value="DENIED">
                                                    Не доступно
                                                </label>
                                                <label>
                                                    <input type="radio" ng-model="profile.surname" value="READ">
                                                    Просмотр
                                                </label>
                                                <label>
                                                    <input type="radio" ng-model="profile.surname" value="WRITE">
                                                    Редактирование
                                                </label>
                                            </div>
                                            <label class="col-md-2 control-label">Имя</label>
                                            <div class="col-md-2">
                                                <label>
                                                    <input type="radio" ng-model="profile.name" value="DENIED">
                                                    Не доступно
                                                </label>
                                                <label>
                                                    <input type="radio" ng-model="profile.name" value="READ">
                                                    Просмотр
                                                </label>
                                                <label>
                                                    <input type="radio" ng-model="profile.name" value="WRITE">
                                                    Редактирование
                                                </label>
                                            </div>
                                        </div>
                                        <hr>
                                        <div class="row">
                                            <label class="col-md-2 control-label">Отчество</label>
                                            <div class="col-md-2">
                                                <label>
                                                    <input type="radio" ng-model="profile.patronymic" value="DENIED">
                                                    Не доступно
                                                </label>
                                                <label>
                                                    <input type="radio" ng-model="profile.patronymic" value="READ">
                                                    Просмотр
                                                </label>
                                                <label>
                                                    <input type="radio" ng-model="profile.patronymic" value="WRITE">
                                                    Редактирование
                                                </label>
                                            </div>
                                            <label class="col-md-2 control-label">Дата рождения</label>
                                            <div class="col-md-2">
                                                <label>
                                                    <input type="radio" ng-model="profile.dateOfBirth" value="DENIED">
                                                    Не доступно
                                                </label>
                                                <label>
                                                    <input type="radio" ng-model="profile.dateOfBirth" value="READ">
                                                    Просмотр
                                                </label>
                                                <label>
                                                    <input type="radio" ng-model="profile.dateOfBirth" value="WRITE">
                                                    Редактирование
                                                </label>
                                            </div>
                                            <label class="col-md-2 control-label">Номер паспорта</label>
                                            <div class="col-md-2">
                                                <label>
                                                    <input type="radio" ng-model="profile.passportNumber"
                                                           value="DENIED">
                                                    Не доступно
                                                </label>
                                                <label>
                                                    <input type="radio" ng-model="profile.passportNumber" value="READ">
                                                    Просмотр
                                                </label>
                                                <label>
                                                    <input type="radio" ng-model="profile.passportNumber" value="WRITE">
                                                    Редактирование
                                                </label>
                                            </div>
                                        </div>
                                        <hr>
                                        <div class="row">
                                            <label class="col-md-2 control-label">Номер военного билета</label>
                                            <div class="col-md-2">
                                                <label>
                                                    <input type="radio" ng-model="profile.militaryIdNumber"
                                                           value="DENIED">
                                                    Не доступно
                                                </label>
                                                <label>
                                                    <input type="radio" ng-model="profile.militaryIdNumber"
                                                           value="READ">
                                                    Просмотр
                                                </label>
                                                <label>
                                                    <input type="radio" ng-model="profile.militaryIdNumber"
                                                           value="WRITE">
                                                    Редактирование
                                                </label>
                                            </div>
                                            <label class="col-md-2 control-label">Национальность</label>
                                            <div class="col-md-2">
                                                <label>
                                                    <input type="radio" ng-model="profile.nationality" value="DENIED">
                                                    Не доступно
                                                </label>
                                                <label>
                                                    <input type="radio" ng-model="profile.nationality" value="READ">
                                                    Просмотр
                                                </label>
                                                <label>
                                                    <input type="radio" ng-model="profile.nationality" value="WRITE">
                                                    Редактирование
                                                </label>
                                            </div>
                                            <label class="col-md-2 control-label">Вероисповедание</label>
                                            <div class="col-md-2">
                                                <label>
                                                    <input type="radio" ng-model="profile.religion" value="DENIED">
                                                    Не доступно
                                                </label>
                                                <label>
                                                    <input type="radio" ng-model="profile.religion" value="READ">
                                                    Просмотр
                                                </label>
                                                <label>
                                                    <input type="radio" ng-model="profile.religion" value="WRITE">
                                                    Редактирование
                                                </label>
                                            </div>
                                        </div>
                                        <hr>
                                        <div class="row">
                                            <label class="col-md-2 control-label">Телефон</label>
                                            <div class="col-md-2">
                                                <label>
                                                    <input type="radio" ng-model="profile.phone" value="DENIED">
                                                    Не доступно
                                                </label>
                                                <label>
                                                    <input type="radio" ng-model="profile.phone" value="READ">
                                                    Просмотр
                                                </label>
                                                <label>
                                                    <input type="radio" ng-model="profile.phone" value="WRITE">
                                                    Редактирование
                                                </label>
                                            </div>
                                            <label class="col-md-2 control-label">Подразделение</label>
                                            <div class="col-md-2">
                                                <label>
                                                    <input type="radio" ng-model="profile.unit" value="DENIED">
                                                    Не доступно
                                                </label>
                                                <label>
                                                    <input type="radio" ng-model="profile.unit" value="READ">
                                                    Просмотр
                                                </label>
                                                <label>
                                                    <input type="radio" ng-model="profile.unit" value="WRITE">
                                                    Редактирование
                                                </label>
                                            </div>
                                            <label class="col-md-2 control-label">Должность</label>
                                            <div class="col-md-2">
                                                <label>
                                                    <input type="radio" ng-model="profile.post" value="DENIED">
                                                    Не доступно
                                                </label>
                                                <label>
                                                    <input type="radio" ng-model="profile.post" value="READ">
                                                    Просмотр
                                                </label>
                                                <label>
                                                    <input type="radio" ng-model="profile.post" value="WRITE">
                                                    Редактирование
                                                </label>
                                            </div>
                                        </div>
                                        <hr>
                                        <div class="row">
                                            <label class="col-md-2 control-label">Образование</label>
                                            <div class="col-md-2">
                                                <label>
                                                    <input type="radio" ng-model="profile.education" value="DENIED">
                                                    Не доступно
                                                </label>
                                                <label>
                                                    <input type="radio" ng-model="profile.education" value="READ">
                                                    Просмотр
                                                </label>
                                                <label>
                                                    <input type="radio" ng-model="profile.education" value="WRITE">
                                                    Редактирование
                                                </label>
                                            </div>
                                            <label class="col-md-2 control-label">Навыки</label>
                                            <div class="col-md-2">
                                                <label>
                                                    <input type="radio" ng-model="profile.skills" value="DENIED">
                                                    Не доступно
                                                </label>
                                                <label>
                                                    <input type="radio" ng-model="profile.skills" value="READ">
                                                    Просмотр
                                                </label>
                                                <label>
                                                    <input type="radio" ng-model="profile.skills" value="WRITE">
                                                    Редактирование
                                                </label>
                                            </div>
                                            <label class="col-md-2 control-label">Категории водительских прав<</label>
                                            <div class="col-md-2">
                                                <label>
                                                    <input type="radio" ng-model="profile.drivingLicense"
                                                           value="DENIED">
                                                    Не доступно
                                                </label>
                                                <label>
                                                    <input type="radio" ng-model="profile.drivingLicense" value="READ">
                                                    Просмотр
                                                </label>
                                                <label>
                                                    <input type="radio" ng-model="profile.drivingLicense" value="WRITE">
                                                    Редактирование
                                                </label>
                                            </div>
                                        </div>
                                        <hr>
                                        <div class="row">
                                            <label class="col-md-2 control-label">Адресные данные</label>
                                            <div class="col-md-2">
                                                <label>
                                                    <input type="radio" ng-model="profile.addressData" value="DENIED">
                                                    Не доступно
                                                </label>
                                                <label>
                                                    <input type="radio" ng-model="profile.addressData" value="READ">
                                                    Просмотр
                                                </label>
                                                <label>
                                                    <input type="radio" ng-model="profile.addressData" value="WRITE">
                                                    Редактирование
                                                </label>
                                            </div>
                                            <label class="col-md-2 control-label">Состав семьи</label>
                                            <div class="col-md-2">
                                                <label>
                                                    <input type="radio" ng-model="profile.compositionOfFamily"
                                                           value="DENIED">
                                                    Не доступно
                                                </label>
                                                <label>
                                                    <input type="radio" ng-model="profile.compositionOfFamily"
                                                           value="READ">
                                                    Просмотр
                                                </label>
                                                <label>
                                                    <input type="radio" ng-model="profile.compositionOfFamily"
                                                           value="WRITE">
                                                    Редактирование
                                                </label>
                                            </div>
                                            <label class="col-md-2 control-label">сотрясений головного мозга не
                                                было?</label>
                                            <div class="col-md-2">
                                                <label>
                                                    <input type="radio" ng-model="profile.concussionsWereNot"
                                                           value="DENIED">
                                                    Не доступно
                                                </label>
                                                <label>
                                                    <input type="radio" ng-model="profile.concussionsWereNot"
                                                           value="READ">
                                                    Просмотр
                                                </label>
                                                <label>
                                                    <input type="radio" ng-model="profile.concussionsWereNot"
                                                           value="WRITE">
                                                    Редактирование
                                                </label>
                                            </div>
                                        </div>
                                        <hr>
                                        <div class="row">
                                            <label class="col-md-2 control-label">черепно-мозговых травм не было?</label>
                                            <div class="col-md-2">
                                                <label>
                                                    <input type="radio" ng-model="profile.traumaticBrainInjuryWasNot"
                                                           value="DENIED">
                                                    Не доступно
                                                </label>
                                                <label>
                                                    <input type="radio" ng-model="profile.traumaticBrainInjuryWasNot"
                                                           value="READ">
                                                    Просмотр
                                                </label>
                                                <label>
                                                    <input type="radio" ng-model="profile.traumaticBrainInjuryWasNot"
                                                           value="WRITE">
                                                    Редактирование
                                                </label>
                                            </div>
                                            <label class="col-md-2 control-label">на учёте у нарколога не
                                                состоял?</label>
                                            <div class="col-md-2">
                                                <label>
                                                    <input type="radio" ng-model="profile.theNarcologWasNot"
                                                           value="DENIED">
                                                    Не доступно
                                                </label>
                                                <label>
                                                    <input type="radio" ng-model="profile.theNarcologWasNot"
                                                           value="READ">
                                                    Просмотр
                                                </label>
                                                <label>
                                                    <input type="radio" ng-model="profile.theNarcologWasNot"
                                                           value="WRITE">
                                                    Редактирование
                                                </label>
                                            </div>
                                            <label class="col-md-2 control-label">на учёте у психиатра не
                                                состоял?</label>
                                            <div class="col-md-2">
                                                <label>
                                                    <input type="radio" ng-model="profile.thePsychiatristWasNot"
                                                           value="DENIED">
                                                    Не доступно
                                                </label>
                                                <label>
                                                    <input type="radio" ng-model="profile.thePsychiatristWasNot"
                                                           value="READ">
                                                    Просмотр
                                                </label>
                                                <label>
                                                    <input type="radio" ng-model="profile.thePsychiatristWasNot"
                                                           value="WRITE">
                                                    Редактирование
                                                </label>
                                            </div>
                                        </div>
                                        <hr>
                                        <div class="row">
                                            <label class="col-md-2 control-label">Употребление алкоголя</label>
                                            <div class="col-md-2">
                                                <label>
                                                    <input type="radio" ng-model="profile.alcohol" value="DENIED">
                                                    Не доступно
                                                </label>
                                                <label>
                                                    <input type="radio" ng-model="profile.alcohol" value="READ">
                                                    Просмотр
                                                </label>
                                                <label>
                                                    <input type="radio" ng-model="profile.alcohol" value="WRITE">
                                                    Редактирование
                                                </label>
                                            </div>
                                            <label class="col-md-2 control-label">Употребление наркотиков</label>
                                            <div class="col-md-2">
                                                <label>
                                                    <input type="radio" ng-model="profile.drugUse" value="DENIED">
                                                    Не доступно
                                                </label>
                                                <label>
                                                    <input type="radio" ng-model="profile.drugUse" value="READ">
                                                    Просмотр
                                                </label>
                                                <label>
                                                    <input type="radio" ng-model="profile.drugUse" value="WRITE">
                                                    Редактирование
                                                </label>
                                            </div>
                                            <label class="col-md-2 control-label">Хронические заболевания</label>
                                            <div class="col-md-2">
                                                <label>
                                                    <input type="radio" ng-model="profile.chronicDiseases"
                                                           value="DENIED">
                                                    Не доступно
                                                </label>
                                                <label>
                                                    <input type="radio" ng-model="profile.chronicDiseases" value="READ">
                                                    Просмотр
                                                </label>
                                                <label>
                                                    <input type="radio" ng-model="profile.chronicDiseases"
                                                           value="WRITE">
                                                    Редактирование
                                                </label>
                                            </div>
                                        </div>
                                        <hr>
                                        <div class="row">
                                            <label class="col-md-2 control-label">Категория годности</label>
                                            <div class="col-md-2">
                                                <label>
                                                    <input type="radio" ng-model="profile.validityCategory"
                                                           value="DENIED">
                                                    Не доступно
                                                </label>
                                                <label>
                                                    <input type="radio" ng-model="profile.validityCategory"
                                                           value="READ">
                                                    Просмотр
                                                </label>
                                                <label>
                                                    <input type="radio" ng-model="profile.validityCategory"
                                                           value="WRITE">
                                                    Редактирование
                                                </label>
                                            </div>
                                            <label class="col-md-2 control-label">мыслей о суициде не имеет?</label>
                                            <div class="col-md-2">
                                                <label>
                                                    <input type="radio" ng-model="profile.thoughtsOfSuicideDoesNotHave"
                                                           value="DENIED">
                                                    Не доступно
                                                </label>
                                                <label>
                                                    <input type="radio" ng-model="profile.thoughtsOfSuicideDoesNotHave"
                                                           value="READ">
                                                    Просмотр
                                                </label>
                                                <label>
                                                    <input type="radio" ng-model="profile.thoughtsOfSuicideDoesNotHave"
                                                           value="WRITE">
                                                    Редактирование
                                                </label>
                                            </div>
                                            <label class="col-md-2 control-label">попыток суицида не совершал?</label>
                                            <div class="col-md-2">
                                                <label>
                                                    <input type="radio" ng-model="profile.suicideAttemptsDidNotCommit"
                                                           value="DENIED">
                                                    Не доступно
                                                </label>
                                                <label>
                                                    <input type="radio" ng-model="profile.suicideAttemptsDidNotCommit"
                                                           value="READ">
                                                    Просмотр
                                                </label>
                                                <label>
                                                    <input type="radio" ng-model="profile.suicideAttemptsDidNotCommit"
                                                           value="WRITE">
                                                    Редактирование
                                                </label>
                                            </div>
                                        </div>
                                        <hr>
                                        <div class="row">
                                            <label class="col-md-2 control-label">административные правонарушения не
                                                совершал?</label>
                                            <div class="col-md-2">
                                                <label>
                                                    <input type="radio"
                                                           ng-model="profile.administrativeOffenseDidNotCommit"
                                                           value="DENIED">
                                                    Не доступно
                                                </label>
                                                <label>
                                                    <input type="radio"
                                                           ng-model="profile.administrativeOffenseDidNotCommit"
                                                           value="READ">
                                                    Просмотр
                                                </label>
                                                <label>
                                                    <input type="radio"
                                                           ng-model="profile.administrativeOffenseDidNotCommit"
                                                           value="WRITE">
                                                    Редактирование
                                                </label>
                                            </div>
                                            <label class="col-md-2 control-label">приводов в полицию не имеет?</label>
                                            <div class="col-md-2">
                                                <label>
                                                    <input type="radio" ng-model="profile.policeRecordDoesNotHave"
                                                           value="DENIED">
                                                    Не доступно
                                                </label>
                                                <label>
                                                    <input type="radio" ng-model="profile.policeRecordDoesNotHave"
                                                           value="READ">
                                                    Просмотр
                                                </label>
                                                <label>
                                                    <input type="radio" ng-model="profile.policeRecordDoesNotHave"
                                                           value="WRITE">
                                                    Редактирование
                                                </label>
                                            </div>
                                            <label class="col-md-2 control-label">к уголовной ответственности не
                                                привлекался?</label>
                                            <div class="col-md-2">
                                                <label>
                                                    <input type="radio"
                                                           ng-model="profile.criminalLiabilityWasNotInvolved"
                                                           value="DENIED">
                                                    Не доступно
                                                </label>
                                                <label>
                                                    <input type="radio"
                                                           ng-model="profile.criminalLiabilityWasNotInvolved"
                                                           value="READ">
                                                    Просмотр
                                                </label>
                                                <label>
                                                    <input type="radio"
                                                           ng-model="profile.criminalLiabilityWasNotInvolved"
                                                           value="WRITE">
                                                    Редактирование
                                                </label>
                                            </div>
                                        </div>
                                        <hr>
                                        <div class="row">
                                            <label class="col-md-2 control-label">Шрамы</label>
                                            <div class="col-md-2">
                                                <label>
                                                    <input type="radio" ng-model="profile.scars" value="DENIED">
                                                    Не доступно
                                                </label>
                                                <label>
                                                    <input type="radio" ng-model="profile.scars" value="READ">
                                                    Просмотр
                                                </label>
                                                <label>
                                                    <input type="radio" ng-model="profile.scars" value="WRITE">
                                                    Редактирование
                                                </label>
                                            </div>
                                            <label class="col-md-2 control-label">Татуировки</label>
                                            <div class="col-md-2">
                                                <label>
                                                    <input type="radio" ng-model="profile.tattoo" value="DENIED">
                                                    Не доступно
                                                </label>
                                                <label>
                                                    <input type="radio" ng-model="profile.tattoo" value="READ">
                                                    Просмотр
                                                </label>
                                                <label>
                                                    <input type="radio" ng-model="profile.tattoo" value="WRITE">
                                                    Редактирование
                                                </label>
                                            </div>
                                            <label class="col-md-2 control-label">Выезды за границу</label>
                                            <div class="col-md-2">
                                                <label>
                                                    <input type="radio" ng-model="profile.abroad" value="DENIED">
                                                    Не доступно
                                                </label>
                                                <label>
                                                    <input type="radio" ng-model="profile.abroad" value="READ">
                                                    Просмотр
                                                </label>
                                                <label>
                                                    <input type="radio" ng-model="profile.abroad" value="WRITE">
                                                    Редактирование
                                                </label>
                                            </div>
                                        </div>
                                        <hr>
                                        <div class="row">
                                            <label class="col-md-2 control-label">Родственники, друзья за
                                                границей</label>
                                            <div class="col-md-2">
                                                <label>
                                                    <input type="radio" ng-model="profile.relativesAndFriendsAbroad"
                                                           value="DENIED">
                                                    Не доступно
                                                </label>
                                                <label>
                                                    <input type="radio" ng-model="profile.relativesAndFriendsAbroad"
                                                           value="READ">
                                                    Просмотр
                                                </label>
                                                <label>
                                                    <input type="radio" ng-model="profile.relativesAndFriendsAbroad"
                                                           value="WRITE">
                                                    Редактирование
                                                </label>
                                            </div>
                                        </div>
                                        <hr>
                                        <br>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-primary btn-outline"
                                                    ng-click="profileSubmit()">
                                                Сохранить
                                            </button>
                                            <button type="button" class="btn btn-default btn-outline"
                                                    data-dismiss="modal">
                                                Закрыть
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="panel panel-default">
        <div class="panel-heading">
            <h3 class="panel-title">Подразделения</h3>
        </div>
        <div class="panel-body">
            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="container-fluid">
                        <div class="row">
                            <table class="table table-bordered bordered table-striped table-condensed datatable"
                                   id="divisionsTable">
                                <thead>
                                <tr>
                                    <th style='font-size:12px;'>
                                        ID
                                    </th>
                                    <th style='font-size:12px;'>
                                        Название
                                    </th>
                                </tr>
                                </thead>
                                <tfoot>
                                <tr>
                                    <th style='font-size:12px;'>
                                        ID
                                    </th>
                                    <th style='font-size:12px;'>
                                        Название
                                    </th>
                                </tr>
                                </tfoot>
                            </table>

                        </div>
                    </div>
                </div>
            </div>
        </div>


        <div class="container-fluid form-group">
            <div class="row">
                <a type="button" class="btn btn-primary btn-outline" data-toggle="modal" data-target="#divisionModal"
                   ng-click="clearDivisionData()">
                    Добавить подразделениe
                </a>
                <button style="display: none" type="button" class="btn btn-primary btn-outline editDivision"
                        data-toggle="modal"
                        data-target="#divisionModal">
                    Редактировать подразделениe
                </button>
            </div>

            <div class="modal fade" id="divisionModal" tabindex="-1" role="dialog" aria-labelledby="divisionModalLabel">
                <div class="modal-dialog" role="document" style="width:1138px;">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                    aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title" id="divisionModalLabel">Добавление/редактирование подразделения</h4>
                        </div>


                        <form class="modal-body form-horizontal" id="addDivisionForm" ui-jq="validate"
                              ui-options="validationOpt">

                            <div class="panel panel-default">
                                <div class="panel-body">
                                    <div class="container-fluid">
                                        <div class="row">

                                            <label class="col-md-2 control-label">Название подразделения</label>
                                            <div class="col-md-4">
                                                <input type="text" name="id" id="divisionId" ng-model="division.id"
                                                       readonly
                                                       style="display: none">
                                                <input type="text"
                                                       class="form-control  ng-pristine ng-untouched ng-valid "
                                                       name="name"
                                                       id="divisionName" ng-model="division.name"></div>
                                        </div>
                                        <br>

                                        <br>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-primary btn-outline"
                                                    ng-click="divisionSubmit()">
                                                Сохранить
                                            </button>
                                            <button type="button" class="btn btn-default btn-outline"
                                                    data-dismiss="modal">
                                                Закрыть
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<input type="hidden"
       name="${_csrf.parameterName}" id="csrfParameter"
       value="${_csrf.token}"/>

<script src="../scripts/admin.js"></script>

</body>
</html>
