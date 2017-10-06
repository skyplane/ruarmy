
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="row">
    <div class="col-sm-3 info" align="right">Шрамы</div>
    <div class="col-sm-9" align="left">
        <input type="text" class="form-control" name="scars" id="scars"
               ng-model="cadet.additionally.scars">
    </div>
</div>
<br>
<div class="row">
    <div class="col-sm-3 info" align="right">Татуировки</div>
    <div class="col-sm-9" align="left">
        <input type="text" class="form-control" name="tattoo" id="tattoo"
               ng-model="cadet.additionally.tattoo">
    </div>
</div>
<br>
<div class="row">
    <div class="col-sm-3 info" align="right">Выезды за границу</div>
    <div class="col-sm-9" align="left">
        <input type="text" class="form-control" name="abroad" id="abroad"
               ng-model="cadet.additionally.abroad">
    </div>
</div>