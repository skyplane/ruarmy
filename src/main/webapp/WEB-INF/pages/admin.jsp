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
    <script src="../scripts/datatables/locale.js"></script>


</head>
<body>


<div ng-app="usersApp" data-ng-controller="usersCtrl" data-ng-init="init()">


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
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <div class="container-fluid form-group">
            <div class="row">
                <a type="button" class="btn btn-primary btn-outline" data-toggle="modal" data-target="#myModal"
                   ng-click="clearData()">
                    Добавить пользователя
                </a>
                <button style="display: none" type="button" class="btn btn-primary btn-outline editUser"
                        data-toggle="modal"
                        data-target="#myModal">
                    Редактировать пользователя
                </button>
            </div>

            <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                <div class="modal-dialog" role="document" style="width:1138px;">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                    aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title" id="myModalLabel">Добавление/редактирование пользователя</h4>
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
                                            <%--                        <label class="col-md-2 control-label">ФИО</label>
                                                                    <div class="col-md-4"><input type="text" class="form-control  ng-pristine ng-untouched ng-valid " name="fio" id="fio" ng-model="user.fio"></div>
                                             --%>                   </div>
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
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-primary btn-outline"
                                                    ng-click="submit()">
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

<script>

    var datatablesColumns = [
        {data: "id"},
        {data: "login"},
        {data: "password"},
        {data: "role"}
    ];

    function loadUsersTable($scope) {
        $.post(
            "../api/user/loadUsers",
            $scope.csrfData()
            , function (json) {
                $('#usersTable').DataTable({
                    destroy: true,
                    language: datatablesLanguage,
                    columns: datatablesColumns,
                    data: json.data,
                    order: [1, 'desc'],
                    "fnInitComplete": function (oSettings) {
                        $('#usersTable tbody').on('click', 'tr', function () {
                            var tr = this;
                            if ($(tr).hasClass('selected')) {
                                $(tr).removeClass('selected');
                                $('.editUser').fadeOut();
                            } else {
                                $('#usersTable').DataTable().$('tr.selected').removeClass('selected');
                                $(tr).addClass('selected');
                                $('.editUser').fadeIn();
                                $('#id').val($($(tr).find('td')[0]).text());
                                $('#id').change();
                                $('#login').val($($(tr).find('td')[1]).text());
                                $('#login').change();
                                $('#password').val($($(tr).find('td')[2]).text());
                                $('#password').change();
                                $('#password1').val($($(tr).find('td')[2]).text());
                                $('#password1').change();

                                $.each($('.roleOption'), function () {
                                    $(this).removeAttr('selected');
                                });

                                $.each($scope.roles, function () {
                                    var role = this;
                                    if ($($(tr).find('td')[3]).text() == role['value']) {
                                        $.each($('.roleOption'), function () {
                                            if ($(this).val() == role['key']) {
                                                $scope.user.role = role['key'];
                                                $(this).attr('selected', '');
                                            }
                                        });
                                    }
                                });

                            }
                        });
                    }
                });
            },
            "json"
        );
    }

    var app = angular.module('usersApp', []);
    app.controller('usersCtrl', function ($scope) {

        $scope.user = {};
        $scope.roles = [];

        $scope.clearData = function () {
            $scope.user.id = '';
            $scope.user.login = '';
            $scope.user.password = '';
            $scope.user.password1 = '';
            $scope.user.role = '';
        };

        $scope.submit = function () {
            var params = $scope.csrfData();
            params['user'] = $scope.user;
            $.post(
                "../api/user/saveUser",
                params
                , function (json) {
                    alert('Успешно');
                    $scope.clearData();
                    $('#myModal').modal('toggle');
                    loadUsersTable($scope);
                },
                "json"
            );
        };

        $scope.csrfData = function () {
            var csrfName = $('#csrfParameter').attr('name');
            var csrfValue = $('#csrfParameter').attr('value');
            var param = {};
            param[csrfName] = csrfValue;
            return param;
        };

        $scope.init = function () {
            $.post(
                "../api/user/loadUserRoles",
                $scope.csrfData()
                , function (json) {
                    $scope.roles = json.data;
                },
                "json"
            );
            loadUsersTable($scope);
        };

    });
</script>


</body>
</html>
