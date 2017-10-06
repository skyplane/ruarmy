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

    <style>
        .disabledTab {
            pointer-events: none;
        }
    </style>
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


    <style>
        body {
            background: #ededed;
        }

        .panel {
            display: inline-block;
            background: #ffffff;
            /*min-height: 100px;
            height: 100%;*/
            padding: 50px;
        }

        .panel2 {
            min-width: 1138px;
            width: 1138px;
        }

        .panel3 {
            min-width: 1238px;
            width: 1238px;
        }

        .caption {
            font-family: Roboto, Arial, Helvetica, sans-serif;
            font-size: 20pt; /* Размер шрифта в пунктах */
            font-weight: bold;
            color: #4285f4;
        }

        .info {
            font-family: Roboto regular, Arial, Helvetica, sans-serif;
            font-size: 12pt; /* Размер шрифта в пунктах */
            font-weight: bold;
            color: #333333;
        }

        .infoB {
            font-family: Roboto regular, Arial, Helvetica, sans-serif;
            font-size: 14pt; /* Размер шрифта в пунктах */
            font-weight: bold;
            color: #333333;
        }

        .info2 {
            font-family: Roboto regular, Arial, Helvetica, sans-serif;
            font-size: 12pt; /* Размер шрифта в пунктах */
            color: #777777;
        }

        .info3 {
            font-family: Roboto regular, Arial, Helvetica, sans-serif;
            font-size: 14pt; /* Размер шрифта в пунктах */
            color: #EFEFEF;
        }

        .infoC {
            font-family: Roboto regular, Arial, Helvetica, sans-serif;
            font-size: 14pt; /* Размер шрифта в пунктах */
            color: #4285f4;
        }

        .infoCB {
            font-family: Roboto regular, Arial, Helvetica, sans-serif;
            font-size: 14pt; /* Размер шрифта в пунктах */
            font-weight: bold;
            color: #4285f4;
        }

        .signature {
            font-family: Roboto regular, Arial, Helvetica, sans-serif;
            font-size: 10pt; /* Размер шрифта в пунктах */
            color: #777777;
        }

    </style>

</head>
<body>

<div class="container-fluid">
    <nav class="navbar navbar-default" role="navigation" style="background: #4285f4;">
        <div class="container-fluid">
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav">
                    <li class="active "><a href="#">АНКЕТА</a></li>
                    <li class=""><a href="/logout" style="color:white">ВЫХОД</a></li>
                </ul>
            </div><!-- /.navbar-collapse -->
        </div><!-- /.container-fluid -->
    </nav>
</div>


<div class="container-fluid" align="center">

    <div class="panel panel3 container-fluid" ng-app="cadetApp" data-ng-controller="cadetCtrl" data-ng-init="init()">


        <div class="row">
            <div class="col-md-12">

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
                                    <jsp:include page="editForms/totalInformationEdit.jsp"/>
                                </div>
                            </div>
                            <div class="tab-pane" id="tab5">
                                <div class="container-fluid">
                                    <jsp:include page="editForms/addressDataEdit.jsp"/>
                                </div>
                            </div>
                            <div class="tab-pane" id="tab6">
                                <div class="container-fluid">
                                    <jsp:include page="editForms/educationAndSkillsEdit.jsp"/>
                                </div>
                            </div>
                            <div class="tab-pane" id="tab7">
                                <div class="container-fluid">
                                    <jsp:include page="editForms/familyCompositionEdit.jsp"/>
                                    <hr>
                                </div>
                            </div>
                            <div class="tab-pane" id="tab8">
                                <div class="container-fluid">
                                    <jsp:include page="editForms/healthEdit.jsp"/>
                                </div>
                            </div>
                            <div class="tab-pane" id="tab9">
                                <div class="container-fluid">
                                    <jsp:include page="editForms/behaviorEdit.jsp"/>
                                    <br>
                                </div>
                            </div>

                            <div class="tab-pane" id="tab10">
                                <div class="container-fluid">
                                    <jsp:include page="editForms/tripsAbroadEdit.jsp"/>
                                </div>
                            </div>


                            <div class="tab-pane" id="tab11">
                                <div class="container-fluid">
                                    <jsp:include page="editForms/additionallyEdit.jsp"/>
                                    <hr>

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


        <jsp:include page="editForms/educationAndSkillsModals.jsp"/>
        <jsp:include page="editForms/familyCompositionModal.jsp"/>
        <jsp:include page="editForms/tripsAbroadModal.jsp"/>


    </div>
</div>

<script src="../scripts/officerProfile/totalInformation.js"></script>
<script src="../scripts/officerProfile/educationAndSkills.js"></script>
<script src="../scripts/officerProfile/addressData.js"></script>
<script src="../scripts/officerProfile/familyComposition.js"></script>
<script src="../scripts/officerProfile/health.js"></script>
<script src="../scripts/officerProfile/behavior.js"></script>
<script src="../scripts/officerProfile/tripsAbroad.js"></script>
<script src="../scripts/officerProfile/additionally.js"></script>


<script src="../scripts/cadet.js"></script>

</body>
</html>
