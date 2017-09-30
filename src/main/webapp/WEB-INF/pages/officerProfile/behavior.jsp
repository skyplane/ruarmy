<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<div class="panel panel2 container-fluid" id="behaviorShow">
    <div class="row">
        <div class="col-md-9 caption" align="left">
            Поведение
        </div>
        <div class="col-md-3">
            <button class="btn btn-link" ng-click="editBehavior()">Редактировать</button>
        </div>
    </div>
    <br>
    <div class="row">
        <div class="col-md-12 info2">
            {{basicBehaviorText()}}
        </div>
    </div>
    <br>
</div>


<div class="panel panel2 container-fluid" id="behaviorEdit" style="display: none">

    <div class="row">
        <label class="col-sm-4 control-label">мыслей о суициде не имеет?</label>
        <div class="col-sm-3"></div>
        <div class="col-sm-2">
            <div class="btn-group btn-group-justified" role="group">
                <div class="btn-group" role="group">
                    <button type="button"
                            class="btn btn-default trueThoughtsOfSuicideDoesNotHave"
                            ng-click="setThoughtsOfSuicideDoesNotHave(true)">Да
                    </button>
                </div>
                <div class="btn-group" role="group">
                    <button type="button"
                            class="btn btn-default falseThoughtsOfSuicideDoesNotHave"
                            ng-click="setThoughtsOfSuicideDoesNotHave(false)">Нет
                    </button>
                </div>
            </div>
        </div>
    </div>
    <br>
    <div class="row">
        <label class="col-sm-4 control-label">попыток суицида не совершал?</label>
        <div class="col-sm-3"></div>
        <div class="col-sm-2">
            <div class="btn-group btn-group-justified" role="group">
                <div class="btn-group" role="group">
                    <button type="button"
                            class="btn btn-default trueSuicideAttemptsDidNotCommit"
                            ng-click="setSuicideAttemptsDidNotCommit(true)">Да
                    </button>
                </div>
                <div class="btn-group" role="group">
                    <button type="button"
                            class="btn btn-default falseSuicideAttemptsDidNotCommit"
                            ng-click="setSuicideAttemptsDidNotCommit(false)">Нет
                    </button>
                </div>
            </div>
        </div>
    </div>
    <br>
    <div class="row">
        <label class="col-sm-4 control-label">административные правонарушения не
            совершал?</label>
        <div class="col-sm-3"></div>
        <div class="col-sm-2">
            <div class="btn-group btn-group-justified" role="group">
                <div class="btn-group" role="group">
                    <button type="button"
                            class="btn btn-default trueAdministrativeOffenseDidNotCommit"
                            ng-click="setAdministrativeOffenseDidNotCommit(true)">Да
                    </button>
                </div>
                <div class="btn-group" role="group">
                    <button type="button"
                            class="btn btn-default falseAdministrativeOffenseDidNotCommit"
                            ng-click="setAdministrativeOffenseDidNotCommit(false)">
                        Нет
                    </button>
                </div>
            </div>
        </div>
    </div>
    <br>
    <div class="row">
        <label class="col-sm-4 control-label">приводов в полицию не имеет?</label>
        <div class="col-sm-3"></div>
        <div class="col-sm-2">
            <div class="btn-group btn-group-justified" role="group">
                <div class="btn-group" role="group">
                    <button type="button"
                            class="btn btn-default truePoliceRecordDoesNotHave"
                            ng-click="setPoliceRecordDoesNotHave(true)">Да
                    </button>
                </div>
                <div class="btn-group" role="group">
                    <button type="button"
                            class="btn btn-default falsePoliceRecordDoesNotHave"
                            ng-click="setPoliceRecordDoesNotHave(false)">Нет
                    </button>
                </div>
            </div>
        </div>
    </div>
    <br>
    <div class="row">
        <label class="col-sm-4 control-label">к уголовной ответственности не
            привлекался?</label>
        <div class="col-sm-3"></div>
        <div class="col-sm-2">
            <div class="btn-group btn-group-justified" role="group">
                <div class="btn-group" role="group">
                    <button type="button"
                            class="btn btn-default trueCriminalLiabilityWasNotInvolved"
                            ng-click="setCriminalLiabilityWasNotInvolved(true)">Да
                    </button>
                </div>
                <div class="btn-group" role="group">
                    <button type="button"
                            class="btn btn-default falseCriminalLiabilityWasNotInvolved"
                            ng-click="setCriminalLiabilityWasNotInvolved(false)">Нет
                    </button>
                </div>
            </div>
        </div>
    </div>
    <br>

    <button class="btn btn-success" ng-click="saveAndLoadBehavior()">Сохранить</button>

</div>

