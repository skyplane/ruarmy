<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div class="row">
    <div class="col-sm-6 info" align="right">сотрясений головного мозга не
        было?</div>
    <div class="col-sm-3" align="left">
        <div class="btn-group btn-group-justified" role="group">
            <div class="btn-group" role="group">
                <button type="button"
                        class="btn btn-default trueConcussionsWereNot"
                        ng-click="setConcussionsWereNot(true)">Да
                </button>
            </div>
            <div class="btn-group" role="group">
                <button type="button"
                        class="btn btn-default falseConcussionsWereNot "
                        ng-click="setConcussionsWereNot(false)">Нет
                </button>
            </div>
        </div>
    </div>
</div>
<hr>
<div class="row">
    <div class="col-sm-6 info" align="right">черепно-мозговых травм не
        было?</div>
    <div class="col-sm-3" align="left">
        <div class="btn-group btn-group-justified" role="group">
            <div class="btn-group" role="group">
                <button type="button"
                        class="btn btn-default trueTraumaticBrainInjuryWasNot"
                        ng-click="setTraumaticBrainInjuryWasNot(true)">Да
                </button>
            </div>
            <div class="btn-group" role="group">
                <button type="button"
                        class="btn btn-default falseTraumaticBrainInjuryWasNot"
                        ng-click="setTraumaticBrainInjuryWasNot(false)">Нет
                </button>
            </div>
        </div>
    </div>
</div>
<hr>
<div class="row">
    <div class="col-sm-6 info" align="right">на учёте у нарколога не
        состоял?</div>
    <div class="col-sm-3" align="left">
        <div class="btn-group btn-group-justified" role="group">
            <div class="btn-group" role="group">
                <button type="button"
                        class="btn btn-default trueTheNarcologWasNot"
                        ng-click="setTheNarcologWasNot(true)">Да
                </button>
            </div>
            <div class="btn-group" role="group">
                <button type="button"
                        class="btn btn-default falseTheNarcologWasNot"
                        ng-click="setTheNarcologWasNot(false)">Нет
                </button>
            </div>
        </div>
    </div>
</div>
<hr>
<div class="row">
    <div class="col-sm-6 info" align="right">на учёте у психиатра не
        состоял?</div>
    <div class="col-sm-3" align="left">
        <div class="btn-group btn-group-justified" role="group">
            <div class="btn-group" role="group">
                <button type="button"
                        class="btn btn-default trueThePsychiatristWasNot"
                        ng-click="setThePsychiatristWasNot(true)">Да
                </button>
            </div>
            <div class="btn-group" role="group">
                <button type="button"
                        class="btn btn-default falseThePsychiatristWasNot"
                        ng-click="setThePsychiatristWasNot(false)">Нет
                </button>
            </div>
        </div>
    </div>
</div>
<hr>
<div class="row">
    <div class="col-sm-6 info" align="right">Употребление алкоголя</div>
    <div class="col-sm-6" align="left">
        <select name="alcohol" id="alcohol" class="form-control"
                ng-model="cadet.health.alcohol">
            <option value="1">не употребляет</option>
            <option value="2">по праздникам</option>
            <option value="3">1 раз в неделю или реже</option>
            <option value="4">1 - 3 раза в неделю</option>
            <option value="5">более 3-х раз в неделю</option>
        </select>
    </div>
</div>
<hr>
<div class="row">
    <div class="col-sm-6 info" align="right">Употребление наркотиков</div>
    <div class="col-sm-6" align="left">
        <select name="drugUse" id="drugUse" class="form-control"
                ng-model="cadet.health.drugUse">
            <option value="1">не употреблял</option>
            <option value="2">употреблял однократно</option>
            <option value="3">употреблял систематически</option>
        </select>
    </div>
</div>
<br>
<div class="row">
    <div class="col-sm-6 info" align="right">Хронические заболевания</div>
    <div class="col-sm-6" align="left">
        <input type="text" class="form-control" name="chronicDiseases"
               id="chronicDiseases" ng-model="cadet.health.chronicDiseases">
    </div>
</div>
<br>
<div class="row">
    <div class="col-sm-6 info" align="right">Категория годности</div>
    <div class="col-sm-6" align="center">
        <label ng-repeat="vc in options.health.validityCategoryAll  track by $index">
            {{vc}}&nbsp;<input type="radio" value="{{vc}}" ng-model="cadet.health.validityCategory" name="rating" class="radio">
            &nbsp;
        </label>
    </div>
</div>