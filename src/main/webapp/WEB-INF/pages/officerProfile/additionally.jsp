<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<div class="panel panel2 container-fluid" id="additionallyShow">

    <div class="row">
        <div class="col-md-9">
            Дополнительно
        </div>
        <div class="col-md-3">
            <button class="btn btn-link" ng-click="editAdditionally()">Редактировать</button>
        </div>
    </div>

    <div class="row">
        <label class="col-sm-4 control-label">Шрамы:{{cadet.additionally.scars}}</label>
        <label class="col-sm-4 control-label">Татуировки:{{cadet.additionally.tattoo}}</label>
        <label class="col-sm-4 control-label">Выезды за границу:{{cadet.additionally.abroad}}</label>
    </div>

</div>


<div class="panel panel2 container-fluid" id="additionallyEdit" style="display: none">

    <div class="row">
        <label class="col-sm-4 control-label">Шрамы</label>

        <div class="col-sm-8">
            <input type="text" class="form-control" name="scars" id="scars"
                   ng-model="cadet.additionally.scars">
        </div>
    </div>
    <br>
    <div class="row">
        <label class="col-sm-4 control-label">Татуировки</label>

        <div class="col-sm-8">
            <input type="text" class="form-control" name="tattoo" id="tattoo"
                   ng-model="cadet.additionally.tattoo">
        </div>
    </div>
    <br>
    <div class="row">
        <label class="col-sm-4 control-label">Выезды за границу</label>

        <div class="col-sm-8">
            <input type="text" class="form-control" name="abroad" id="abroad"
                   ng-model="cadet.additionally.abroad">
        </div>
    </div>
    <hr>

    <button class="btn btn-success" ng-click="saveAndLoadAdditionally()">Сохранить</button>

</div>

