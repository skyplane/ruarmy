
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!-- Modal -->
<div class="modal fade" id="tripsAbroadModal" tabindex="-1" role="dialog"
     aria-labelledby="skillsModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content" style="width:900">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="tripsAbroadModalLabel"></h4>
            </div>
            <div class="modal-body">
                <div class="container-fluid">
                    <div class="row">
                        <div class="col-sm-3 info" align="right">Кем приходится</div>
                        <div class="col-sm-9" align="left">
                            <input type="text" class="form-control" name="tripsAbroadWho"
                                   id="tripsAbroadWho"
                                   ng-model="tripsAbroad.who">
                        </div>
                    </div>
                    <hr>
                    <div class="row">
                        <div class="col-sm-3 info" align="right">Фамилия</div>
                        <div class="col-sm-9" align="left">
                            <input type="text" class="form-control" name="tripsAbroadLastName"
                                   id="tripsAbroadLastName"
                                   ng-model="tripsAbroad.lastName">
                        </div>
                    </div>
                    <hr>
                    <div class="row">
                        <div class="col-sm-3 info" align="right">Имя</div>
                        <div class="col-sm-9" align="left">
                            <input type="text" class="form-control" name="tripsAbroadFirstName"
                                   id="tripsAbroadFirstName"
                                   ng-model="tripsAbroad.firstName">
                        </div>
                    </div>
                    <hr>
                    <div class="row">
                        <div class="col-sm-3 info" align="right">Отчество</div>
                        <div class="col-sm-9" align="left">
                            <input type="text" class="form-control" name="tripsAbroadPatronymic"
                                   id="tripsAbroadPatronymic"
                                   ng-model="tripsAbroad.patronymic">
                        </div>
                    </div>
                    <hr>
                    <div class="row">
                        <div class="col-sm-3 info" align="right">Страна проживания</div>
                        <div class="col-sm-9" align="left">
                            <input type="text" class="form-control" name="tripsAbroadCountry"
                                   id="tripsAbroadCountry"
                                   ng-model="tripsAbroad.country">
                        </div>
                    </div>
                    <hr>
                    <div class="row">
                        <div class="col-sm-3 info" align="right">Поддерживает отношения?</div>
                        <div class="col-sm-3" align="left">
                            <div class="btn-group btn-group-justified" role="group">
                                <div class="btn-group" role="group">
                                    <button type="button"
                                            class="btn btn-default  trueDoMaintainARelationShip"
                                            ng-click="setDoMaintainARelationShip(true)">Да
                                    </button>
                                </div>
                                <div class="btn-group" role="group">
                                    <button type="button"
                                            class="btn btn-default  falseDoMaintainARelationShip"
                                            ng-click="setDoMaintainARelationShip(false)">Нет
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-primary" ng-click="saveTripsAbroadItem()">Сохранить</button>
                <button type="button" class="btn btn-default" data-dismiss="modal">Отмена</button>
            </div>
        </div>
    </div>
</div>