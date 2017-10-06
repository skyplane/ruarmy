<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<div class="panel panel2 container-fluid" id="tripsAbroadShow">


    <div class="row">
        <div class="col-md-9 caption" align="left">
            Выезды за границу
        </div>
        <div class="col-md-3">
            <button class="btn btn-link infoC" ng-click="editTripsAbroad()">Редактировать</button>
        </div>
    </div>
    <hr>
    <div ng-repeat="tripsAbroadItem in cadet.tripsAbroad track by $index">
        <div class="row">
            <div class="col-lg-2 info2">
                {{tripsAbroadItem.who}}
            </div>
            <div class="col-lg-3 info2">
                {{tripsAbroadItem.firstName+' '+tripsAbroadItem.lastName+' '+tripsAbroadItem.patronymic}}
            </div>
            <div class="col-lg-3 info2">
                {{tripsAbroadItem.country}}
            </div>
            <div class="col-lg-2 info2">
                {{(tripsAbroadItem.doMaintainARelationship==true||tripsAbroadItem.doMaintainARelationship=="true")?'Поддерживает
                отношения':''}}
                {{(tripsAbroadItem.doMaintainARelationship==false||tripsAbroadItem.doMaintainARelationship=="false")?'Не
                поддерживает
                отношения':''}}
            </div>
        </div>
        <hr>
    </div>


</div>


<div class="panel panel2 container-fluid" id="tripsAbroadEdit" style="display: none">
    <div class="row">
        <div class="col-md-9 caption" align="left">
            Выезды за границу
        </div>
    </div>
    <hr>

    <jsp:include page="../editForms/tripsAbroadEdit.jsp"/>

    <br>
    <hr>
    <br>
    <button class="btn btn-success" ng-click="saveAndLoadTripsAbroad()">Сохранить</button>

</div>

<jsp:include page="../editForms/tripsAbroadModal.jsp"/>