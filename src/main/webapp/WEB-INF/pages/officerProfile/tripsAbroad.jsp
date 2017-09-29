<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<div class="panel panel2 container-fluid" id="tripsAbroadShow">

    <div class="row">
        <div class="col-md-9">
            Выезды за границу
        </div>
        <div class="col-md-3">
            <button class="btn btn-link" ng-click="editTripsAbroad()">Редактировать</button>
        </div>
    </div>


    <div class="row"
         ng-repeat="tripsAbroadItem in cadet.tripsAbroad track by $index">
        <div class="col-lg-2">
            <label>{{tripsAbroadItem.who}}</label>
        </div>
        <div class="col-lg-3">
            <label>{{tripsAbroadItem.firstName+' '+tripsAbroadItem.lastName+'
                '+tripsAbroadItem.patronymic}}</label>
        </div>
        <div class="col-lg-3">
            <label>{{tripsAbroadItem.country}}</label>
        </div>
        <div class="col-lg-2">
            <label>
                {{(tripsAbroadItem.doMaintainARelationship==true||tripsAbroadItem.doMaintainARelationship=="true")?'Поддерживает
                отношения':''}}
                {{(tripsAbroadItem.doMaintainARelationship==false||tripsAbroadItem.doMaintainARelationship=="false")?'Не поддерживает
                отношения':''}}
            </label>
        </div>
    </div>



</div>


<div class="panel panel2 container-fluid" id="tripsAbroadEdit" style="display: none">

    <div class="row" align="center">
        <label class=" control-label">Родственники, друзья проживающие за
            границей</label>
    </div>
    <div class="row" align="center">
        <button ng-click="addTripsAbroadItem()">Добавить</button>
    </div>
    <br>
    <div class="row"
         ng-repeat="tripsAbroadItem in cadet.tripsAbroad track by $index">
        <div class="col-lg-2">
            <label>{{tripsAbroadItem.who}}</label>
        </div>
        <div class="col-lg-3">
            <label>{{tripsAbroadItem.firstName+' '+tripsAbroadItem.lastName+'
                '+tripsAbroadItem.patronymic}}</label>
        </div>
        <div class="col-lg-3">
            <label>{{tripsAbroadItem.country}}</label>
        </div>
        <div class="col-lg-2">
            <label>
                {{(tripsAbroadItem.doMaintainARelationship==true||tripsAbroadItem.doMaintainARelationship=="true")?'Поддерживает
                отношения':''}}
                {{(tripsAbroadItem.doMaintainARelationship==false||tripsAbroadItem.doMaintainARelationship=="false")?'Не поддерживает
                отношения':''}}
            </label>
        </div>
        <div class="col-lg-2">
            <button ng-click="editTripsAbroadItem($index)">Редактировать</button>
            <button ng-click="removeTripsAbroadItem($index)">Удалить</button>
        </div>
    </div>

    <button class="btn btn-success" ng-click="saveAndLoadTripsAbroad()">Сохранить</button>

</div>


<!-- Modal -->
<div class="modal fade" id="tripsAbroadModal" tabindex="-1" role="dialog"
     aria-labelledby="skillsModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content" style="width:900">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="tripsAbroadModalLabel">Навыки</h4>
            </div>
            <div class="modal-body">
                <div class="container-fluid">
                    <div class="row">
                        <label class="col-sm-4 control-label">Кем приходится</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" name="tripsAbroadWho"
                                   id="tripsAbroadWho"
                                   ng-model="tripsAbroad.who">
                        </div>
                    </div>
                    <div class="row">
                        <label class="col-sm-4 control-label">Фамилия</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" name="tripsAbroadLastName"
                                   id="tripsAbroadLastName"
                                   ng-model="tripsAbroad.lastName">
                        </div>
                    </div>
                    <div class="row">
                        <label class="col-sm-4 control-label">Имя</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" name="tripsAbroadFirstName"
                                   id="tripsAbroadFirstName"
                                   ng-model="tripsAbroad.firstName">
                        </div>
                    </div>
                    <div class="row">
                        <label class="col-sm-4 control-label">Отчество</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" name="tripsAbroadPatronymic"
                                   id="tripsAbroadPatronymic"
                                   ng-model="tripsAbroad.patronymic">
                        </div>
                    </div>

                    <div class="row">
                        <label class="col-sm-4 control-label">Страна проживания</label>
                        <div class="col-sm-8">
                            <input type="text" class="form-control" name="tripsAbroadCountry"
                                   id="tripsAbroadCountry"
                                   ng-model="tripsAbroad.country">
                        </div>
                    </div>
                    <label class="col-sm-4 control-label">Поддерживает отношения?</label>
                    <div class="col-sm-8">
                        <div class="btn-group btn-group-justified" role="group">
                            <div class="btn-group" role="group">
                                <button type="button"
                                        class="btn btn-default btn-xs trueDoMaintainARelationShip"
                                        ng-click="setDoMaintainARelationShip(true)">Да
                                </button>
                            </div>
                            <div class="btn-group" role="group">
                                <button type="button"
                                        class="btn btn-default btn-xs falseDoMaintainARelationShip"
                                        ng-click="setDoMaintainARelationShip(false)">Нет
                                </button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Закрыть</button>
                <button type="button" class="btn btn-primary" ng-click="saveTripsAbroadItem()">Сохранить</button>
            </div>
        </div>
    </div>
</div>