<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<div class="panel panel2 container-fluid" id="behaviorShow">
    <div class="row">
        <div class="col-md-9 caption" align="left">
            Поведение
        </div>
        <div class="col-md-3">
            <button class="btn btn-link infoC" ng-click="editBehavior()">Редактировать</button>
        </div>
    </div>
    <hr>
    <div class="row">
        <div class="col-md-12 info2">
            {{basicBehaviorText()}}
        </div>
    </div>
    <br>
</div>


<div class="panel panel2 container-fluid" id="behaviorEdit" style="display: none">
    <div class="row">
        <div class="col-md-9 caption" align="left">
            Поведение
        </div>
    </div>
    <hr>


    <jsp:include page="../editForms/behaviorEdit.jsp"/>


    <br>
    <hr>
    <br>

    <button class="btn btn-success" ng-click="saveAndLoadBehavior()">Сохранить</button>

</div>

