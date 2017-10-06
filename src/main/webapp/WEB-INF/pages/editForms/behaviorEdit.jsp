
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="row">
    <div class="col-sm-6 info" align="right">мыслей о суициде не имеет?</div>
    <div class="col-sm-3" align="left">
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
    <div class="col-sm-6 info" align="right">попыток суицида не совершал?</div>
    <div class="col-sm-3" align="left">
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
    <div class="col-sm-6 info" align="right">административные правонарушения не
        совершал?</div>
    <div class="col-sm-3" align="left">
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
    <div class="col-sm-6 info" align="right">приводов в полицию не имеет?</div>
    <div class="col-sm-3" align="left">
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
    <div class="col-sm-6 info" align="right">к уголовной ответственности не
        привлекался?</div>
    <div class="col-sm-3" align="left">
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