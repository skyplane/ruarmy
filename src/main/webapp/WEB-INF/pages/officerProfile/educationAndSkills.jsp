<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<div class="panel panel2 container-fluid" id="educationAndSkillsShow">

    <div class="row">
        <div class="col-md-9 caption" align="left">
            Образование
        </div>
        <div class="col-md-3">
            <button class="btn btn-link infoC" ng-click="editEducationAndSkills()">Редактировать</button>
        </div>
    </div>
    <hr>
    <div ng-repeat="education in cadet.educationAndSkills.educations track by $index">
        <div class="row" align="left">
            <div class="col-sm-12 info">
                {{textByInstitutionType(education.institutionType)+(education.institutionType<5?(',
                '+education.speciality):'')}}
            </div>
        </div>
        <div class="row" align="left">
            <div class="col-sm-12 info2">
                {{education.institutionType<5?(education.institutionName+', '+
                education.yearOfEnding+educationSubData(education)):''}}
            </div>
        </div>
        <hr>
    </div>
    <br>

    <div class="row">
        <div class="col-sm-12 infoB" align="left" style="padding-right: 6px;">
            Иностранные языки:&nbsp;{{getForeignLanguagesString()}}
        </div>
    </div>
    <br>

    <div class="row">
        <div class="col-sm-12 infoB" align="left" style="padding-right: 6px;">
            Имеет водительские права категории:&nbsp;
            <label ng-repeat="driverLicense in cadet.educationAndSkills.driversLicenses" class="infoB">
                {{$index==0?'':', '}}{{driverLicense}}
            </label>
        </div>
    </div>
    <br>


    <div class="row">
        <div class="col-md-12 caption" align="left">
            Навыки
        </div>
    </div>
    <br>


    <div class="row">
        <div class="col-sm-3" align="left">
            <div class="container-fluid" style="padding-left: 15px;">
                <label class="row info">Компьютеры</label>
                <div ng-repeat="skill in skillsTextByFoa1" class="row info2">
                    {{skill}}
                </div>
            </div>
        </div>
        <div class="col-sm-3" align="left">
            <label class="row info">Спорт</label>
            <div ng-repeat="skill in skillsTextByFoa2" class="row info2">
                {{skill}}
            </div>
        </div>
        <div class="col-sm-3" align="left">
            <label class="row info">Искусство</label>
            <div ng-repeat="skill in skillsTextByFoa3" class="row info2">
                {{skill}}
            </div>
        </div>
        <div class="col-sm-3" align="left">
            <div class="container-fluid" style="padding-right: 15px;">
                <label class="row info">Технические навыки</label>
                <div ng-repeat="skill in skillsTextByFoa4" class="row info2">
                    {{skill}}
                </div>
            </div>
        </div>
    </div>

    <br>


</div>


<div class="panel panel2 container-fluid" id="educationAndSkillsEdit" style="display: none">
    <jsp:include page="../editForms/educationAndSkillsEdit.jsp"/>
    <br>
    <hr>
    <br>
    <button class="btn btn-success" ng-click="saveAndLoadEducationAndSkills()">Сохранить</button>

</div>
<jsp:include page="../editForms/educationAndSkillsModals.jsp"/>