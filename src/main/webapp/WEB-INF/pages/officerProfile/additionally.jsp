<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<div class="panel panel2 container-fluid" id="additionallyShow">

    <div class="row">
        <div class="col-md-9 caption" align="left">
            Дополнительно
        </div>
        <div class="col-md-3">
            <button class="btn btn-link" ng-click="editAdditionally()">Редактировать</button>
        </div>
    </div>
<br>
    <div class="row">
        <div class="col-sm-2 info" align="right" style="padding-right: 6px;">
            Шрамы
        </div>
        <div class="col-sm-10 info2" align="left" style="padding-left: 6px;">
            {{cadet.additionally.scars}}
        </div>
    </div>
    <div class="row">
        <div class="col-sm-2 info" align="right" style="padding-right: 6px;">
            Татуировки
        </div>
        <div class="col-sm-10 info2" align="left" style="padding-left: 6px;">
            {{cadet.additionally.tattoo}}
        </div>
    </div>
    <div class="row">
        <div class="col-sm-2 info" align="right" style="padding-right: 6px;">
            Выезды за границу
        </div>
        <div class="col-sm-10 info2" align="left" style="padding-left: 6px;">
            {{cadet.additionally.abroad}}
        </div>
    </div>
    <br>
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

