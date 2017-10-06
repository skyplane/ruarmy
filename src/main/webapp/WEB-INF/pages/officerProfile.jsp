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

        .vcenter {
            display: inline-block;
            vertical-align: middle;
            float: none;
        }

        .caption {
            font-family:  Roboto, Arial, Helvetica, sans-serif;
            font-size: 20pt; /* Размер шрифта в пунктах */
            font-weight: bold;
            color:  #4285f4;
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
                    <li class=""><a href="/home" style="color:white">ТАБЛИЦА КУРСАНТОВ</a></li>
                    <li class="active "><a href="#">ПРОФИЛЬ КУРСАНТА</a></li>
                    <li class=""><a href="/logout" style="color:white">ВЫХОД</a></li>
                </ul>
            </div><!-- /.navbar-collapse -->
        </div><!-- /.container-fluid -->
    </nav>
</div>

<div class="container-fluid" ng-app="cursantsApp" data-ng-controller="officerProfileCtrl" data-ng-init="init()"
     align="center">
    <br>
    <jsp:include page="officerProfile/totalInformation.jsp"/>
    <br>
    <jsp:include page="officerProfile/educationAndSkills.jsp"/>
    <br>
    <jsp:include page="officerProfile/addressData.jsp"/>
    <br>
    <jsp:include page="officerProfile/familyComposition.jsp"/>
    <br>
    <jsp:include page="officerProfile/health.jsp"/>
    <br>
    <jsp:include page="officerProfile/behavior.jsp"/>
    <br>
    <jsp:include page="officerProfile/tripsAbroad.jsp"/>
    <br>
    <jsp:include page="officerProfile/additionally.jsp"/>
    <br>
</div>

<input type="hidden"
       name="cursantId" id="cursantId"
       value="${cursantId}"/>

<input type="hidden"
       name="${_csrf.parameterName}" id="csrfParameter"
       value="${_csrf.token}"/>


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


<script src="../scripts/officerProfile/totalInformation.js"></script>
<script src="../scripts/officerProfile/educationAndSkills.js"></script>
<script src="../scripts/officerProfile/addressData.js"></script>
<script src="../scripts/officerProfile/familyComposition.js"></script>
<script src="../scripts/officerProfile/health.js"></script>
<script src="../scripts/officerProfile/behavior.js"></script>
<script src="../scripts/officerProfile/tripsAbroad.js"></script>
<script src="../scripts/officerProfile/additionally.js"></script>
<script src="../scripts/officerProfile.js"></script>

</body>
</html>


