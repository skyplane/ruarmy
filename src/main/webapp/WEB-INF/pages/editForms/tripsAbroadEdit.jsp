
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="row" align="left">
    <div class="col-md-6 infoCB" align="left">
        Родственники, друзья проживающие за границей
    </div>
    <div class="col-md-6" align="right">
        <button ng-click="addTripsAbroadItem()" class="btn btn-default btn-xs">Добавить</button>
    </div>
</div>
<br>
<div class="row"
     ng-repeat="tripsAbroadItem in cadet.tripsAbroad track by $index">
    <div class="col-lg-2">
        <div class="info2">{{tripsAbroadItem.who}}</div>
    </div>
    <div class="col-lg-3">
        <div class="info2">{{tripsAbroadItem.firstName+' '+tripsAbroadItem.lastName+'
            '+tripsAbroadItem.patronymic}}</div>
    </div>
    <div class="col-lg-3">
        <div class="info2">{{tripsAbroadItem.country}}</div>
    </div>
    <div class="col-lg-2">
        <div class="info2">
            {{(tripsAbroadItem.doMaintainARelationship==true||tripsAbroadItem.doMaintainARelationship=="true")?'Поддерживает
            отношения':''}}
            {{(tripsAbroadItem.doMaintainARelationship==false||tripsAbroadItem.doMaintainARelationship=="false")?'Не
            поддерживает
            отношения':''}}
        </div>
    </div>
    <div class="col-lg-2">
        <div class="row"><button class="btn btn-xs btn-info" ng-click="editTripsAbroadItem($index)">Редактировать</button></div>
        <div class="row"><button class="btn btn-xs btn-danger" ng-click="removeTripsAbroadItem($index)">Удалить</button></div>
    </div>
</div>