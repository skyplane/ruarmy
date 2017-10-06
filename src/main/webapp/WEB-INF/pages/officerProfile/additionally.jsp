<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<div class="panel panel2 container-fluid" id="additionallyShow">

    <div class="row">
        <div class="col-md-9 caption" align="left">
            Дополнительно
        </div>
        <div class="col-md-3">
            <button class="btn btn-link infoC" ng-click="editAdditionally()">Редактировать</button>
        </div>
    </div>
    <hr>
    <div class="row">
        <div class="col-sm-3 info" align="right" style="padding-right: 6px;">
            Шрамы
        </div>
        <div class="col-sm-9 info2" align="left" style="padding-left: 6px;">
            {{cadet.additionally.scars}}
        </div>
    </div>
    <hr>
    <div class="row">
        <div class="col-sm-3 info" align="right" style="padding-right: 6px;">
            Татуировки
        </div>
        <div class="col-sm-9 info2" align="left" style="padding-left: 6px;">
            {{cadet.additionally.tattoo}}
        </div>
    </div>
    <hr>
    <div class="row">
        <div class="col-sm-3 info" align="right" style="padding-right: 6px;">
            Выезды за границу
        </div>
        <div class="col-sm-9 info2" align="left" style="padding-left: 6px;">
            {{cadet.additionally.abroad}}
        </div>
    </div>
    <br>
</div>


<div class="panel panel2 container-fluid" id="additionallyEdit" style="display: none">

    <div class="row">
        <div class="col-md-9 caption" align="left">
            Дополнительно
        </div>
    </div>
    <hr>

    <jsp:include page="../editForms/additionallyEdit.jsp"/>

    <br>
    <hr>
    <br>
    <button class="btn btn-success" ng-click="saveAndLoadAdditionally()">Сохранить</button>

</div>

