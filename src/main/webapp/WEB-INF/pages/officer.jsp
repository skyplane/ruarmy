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

    <script src="../bower_components/datatables/dataTables.buttons.min.js"></script>
    <script src="../bower_components/datatables/buttons.bootstrap.min.js"></script>
    <script src="../bower_components/datatables/jszip.min.js"></script>
    <script src="../bower_components/datatables/pdfmake.min.js"></script>
    <script src="../bower_components/datatables/vfs_fonts.js"></script>
    <script src="../bower_components/datatables/buttons.html5.min.js"></script>
    <script src="../bower_components/datatables/buttons.print.min.js"></script>
    <script src="../bower_components/datatables/buttons.colVis.min.js"></script>

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



<div class="container-fluid">
    <nav class="navbar navbar-default" role="navigation" style="background: #4285f4;">
        <div class="container-fluid">
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li class="active "><a href="#">ТАБЛИЦА КУРСАНТОВ</a></li>
                    <li class=""><a href="/logout" style="color:white">ВЫХОД</a></li>
                </ul>
            </div><!-- /.navbar-collapse -->
        </div><!-- /.container-fluid -->
    </nav>
</div>





<div class="container-fluid" ng-app="cursantsApp" data-ng-controller="officerCtrl" data-ng-init="init()">
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
    <div class="panel panel-default">
        <div class="panel-heading">
            <h3 class="panel-title">Курсанты</h3>
        </div>
        <div class="panel-body">
            <div class="panel panel-default">
                <div class="panel-body">
                    <div class="container-fluid">
                        <div class="row">
                            <table class="table table-bordered bordered table-striped table-condensed datatable
  display responsive nowrap"
                                   id="cursantsTable" width="100%">
                                <thead>
                                <tr>
                                    <th style='font-size:12px;'>
                                        ФИО
                                    </th>
                                    <th style='font-size:12px;'>
                                        звание
                                    </th>
                                    <th style='font-size:12px;'>
                                        должность
                                    </th>
                                    <th style='font-size:12px;'>
                                        подразделение
                                    </th>
                                    <th style='font-size:12px;'>
                                        курс
                                    </th>
                                    <th style='font-size:12px;'>
                                        специальность
                                    </th>
                                    <th style='font-size:12px;'>
                                        национальность
                                    </th>
                                    <th style='font-size:12px;'>
                                        вeроисповeдание
                                    </th>
                                    <th style='font-size:12px;'>
                                        состав семьи
                                    </th>
                                    <th style='font-size:12px;'>
                                        категория здоровья
                                    </th>
                                    <th style='font-size:12px;'>
                                        адрес фактический
                                    </th>
                                    <th style='font-size:12px;'>
                                        адрес прописки
                                    </th>
                                    <th style='font-size:12px;'>
                                        место рождения
                                    </th>
                                    <th style='font-size:12px;'>
                                        дата рождения
                                    </th>
                                </tr>
                                </thead>
                                <tfoot>
                                <tr>
                                    <th style='font-size:12px;'>
                                        ФИО
                                    </th>
                                    <th style='font-size:12px;'>
                                        звание
                                    </th>
                                    <th style='font-size:12px;'>
                                        должность
                                    </th>
                                    <th style='font-size:12px;'>
                                        подразделение
                                    </th>
                                    <th style='font-size:12px;'>
                                        курс
                                    </th>
                                    <th style='font-size:12px;'>
                                        специальность
                                    </th>
                                    <th style='font-size:12px;'>
                                        национальность
                                    </th>
                                    <th style='font-size:12px;'>
                                        вeроисповeдание
                                    </th>
                                    <th style='font-size:12px;'>
                                        состав семьи
                                    </th>
                                    <th style='font-size:12px;'>
                                        категория здоровья
                                    </th>
                                    <th style='font-size:12px;'>
                                        адрес фактический
                                    </th>
                                    <th style='font-size:12px;'>
                                        адрес прописки
                                    </th>
                                    <th style='font-size:12px;'>
                                        место рождения
                                    </th>
                                    <th style='font-size:12px;'>
                                        дата рождения
                                    </th>
                                </tr>
                                </tfoot>
                            </table>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<input type="hidden"
       name="${_csrf.parameterName}" id="csrfParameter"
       value="${_csrf.token}"/>

<script src="../scripts/officer.js"></script>

</body>
</html>
