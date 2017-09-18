

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




<div class="container-fluid" ng-app="cursantsApp" data-ng-controller="officerProfileCtrl" data-ng-init="init()">

    <jsp:include page="officerProfile/totalInformation.jsp"/>

    <input type="text" ng-model="cursantId">

</div>

<input type="hidden"
       name="cursantId" id="cursantId"
       value="${cursantId}"/>

<input type="hidden"
       name="${_csrf.parameterName}" id="csrfParameter"
       value="${_csrf.token}"/>

<script src="../scripts/officerProfile.js"></script>

</body>
</html>


