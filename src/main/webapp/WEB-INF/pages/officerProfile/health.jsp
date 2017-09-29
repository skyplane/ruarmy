<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<div class="panel panel2 container-fluid" id="healthShow">

    <div class="row">
        <div class="col-md-9">
           Здоровье
        </div>
        <div class="col-md-3">
            <button class="btn btn-link" ng-click="editHealth()">Редактировать</button>
        </div>
    </div>

    <div class="row">
        <div class="col-md-12">
            {{basicHealthText()}}
        </div>
    </div>

    <div class="row">
        <div class="col-md-12">
            {{textByAlcohol()+", "+
            textByDrugUse()}}
        </div>
    </div>

    <div class="row">
        <div class="col-md-6">
            Хронические заболевания:{{cadet.health.chronicDiseases}}
        </div>
        <div class="col-md-6">
            Категория годности:{{cadet.health.validityCategory}}
        </div>
    </div>

</div>


<div class="panel panel2 container-fluid" id="healthEdit" style="display: none">

    <div class="row">
        <label class="col-sm-4 control-label">сотрясений головного мозга не
            было?</label>
        <div class="col-sm-3"></div>
        <div class="col-sm-2">
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
        <label class="col-sm-4 control-label">черепно-мозговых травм не
            было?</label>
        <div class="col-sm-3"></div>
        <div class="col-sm-2">
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
        <label class="col-sm-4 control-label">на учёте у нарколога не
            состоял?</label>
        <div class="col-sm-3"></div>
        <div class="col-sm-2">
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
        <label class="col-sm-4 control-label">на учёте у психиатра не
            состоял?</label>
        <div class="col-sm-3"></div>
        <div class="col-sm-2">
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
        <label class="col-sm-4 control-label">Употребление алкоголя</label>
        <div class="col-sm-8">
            <select name="alcohol" id="alcohol"
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
        <label class="col-sm-4 control-label">Употребление наркотиков</label>
        <div class="col-sm-8">
            <select name="drugUse" id="drugUse"
                    ng-model="cadet.health.drugUse">
                <option value="1">не употреблял</option>
                <option value="2">употреблял однократно</option>
                <option value="3">употреблял систематически</option>
            </select>
        </div>
    </div>
    <br>
    <div class="row">
        <label class="col-sm-4 control-label">Хронические заболевания</label>
        <div class="col-sm-8">
            <input type="text" class="form-control" name="chronicDiseases"
                   id="chronicDiseases" ng-model="cadet.health.chronicDiseases">
        </div>
    </div>
    <br>
    <div class="row">
        <label class="col-sm-4 control-label">Категория годности</label>
        <div class="col-sm-8">
            <input type="text" class="form-control" name="validityCategory"
                   id="validityCategory" ng-model="cadet.health.validityCategory">
        </div>
    </div>

    <button class="btn btn-success" ng-click="saveAndLoadHealth()">Сохранить</button>

</div>

