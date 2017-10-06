<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<div class="panel panel2 container-fluid" id="healthShow">

    <div class="row">
        <div class="col-md-9 caption" align="left">
            Здоровье
        </div>
        <div class="col-md-3">
            <button class="btn btn-link infoC" ng-click="editHealth()">Редактировать</button>
        </div>
    </div>
    <hr>
    <div class="row">
        <div class="col-md-12 info2">
            {{basicHealthText()}}
        </div>
    </div>
    <br>
    <div class="row">
        <div class="col-md-12 info2">
            {{textByAlcohol()+", "+
            textByDrugUse()}}
        </div>
    </div>
<hr>
    <div class="row">
        <div class="col-sm-3 info" align="right" style="padding-right: 6px;">
            Хронические заболевания
        </div>
        <div class="col-sm-9 info2" align="left" style="padding-left: 6px;">
            {{cadet.health.chronicDiseases}}
        </div>
    </div>
    <hr>
    <div class="row">
        <div class="col-sm-3 info" align="right" style="padding-right: 6px;">
            Категория годности
        </div>
        <div class="col-sm-9 info2" align="left" style="padding-left: 6px;">
            {{cadet.health.validityCategory}}
        </div>
    </div>
<br>
</div>


<div class="panel panel2 container-fluid" id="healthEdit" style="display: none">
    <div class="row">
        <div class="col-md-9 caption" align="left">
            Здоровье
        </div>
    </div>
    <hr>

    <jsp:include page="../editForms/healthEdit.jsp"/>


    <br>
    <hr>
    <br>
    <button class="btn btn-success" ng-click="saveAndLoadHealth()">Сохранить</button>

</div>

