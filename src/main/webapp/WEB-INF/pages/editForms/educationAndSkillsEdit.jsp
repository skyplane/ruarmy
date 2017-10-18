<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="row">
    <div class="col-md-6 infoCB" align="left">
        Образование
    </div>
    <div class="col-md-6" align="right">
        <button class="btn btn-default btn-xs" ng-click="addEducation()">Добавить образование</button>
    </div>
</div>
<br>

<div ng-repeat="education in cadet.educationAndSkills.educations track by $index">
    <div class="row">
        <div class="col-sm-10 info2">
            {{textByInstitutionType(education.institutionType)+
            (education.institutionType<5?(', '+education.institutionName+', '+education.speciality+', '+
            education.yearOfEnding+educationSubData(education)):'')}}
        </div>
        <div class="col-sm-2">
            <div class="row">
                <button class="btn btn-xs btn-info" ng-click="editEducation($index)">Редактировать</button>
            </div>
            <div class="row">
                <button class="btn btn-xs btn-danger" ng-click="removeEducation($index)">Удалить</button>
            </div>
        </div>
    </div>
    <br>
</div>
<hr>

<div class="row" align="left">
    <div class="col-md-6 infoCB" align="left">
        Иностранные языки
    </div>
    <div class="col-md-6" align="right">
        <button ng-click="addForeignLanguage()" class="btn btn-default btn-xs">Добавить язык</button>
    </div>
    <div class="col-md-12 infoCB"></div>
</div>
<div ng-repeat="foreignLanguage in cadet.educationAndSkills.foreignLanguages track by $index">
    <br>
    <div class="row">
        <div class="col-lg-1"></div>
        <div class="col-lg-3" align="right">
            <select ng-model="foreignLanguage.language" class="form-control">
                <option value="1" selected="selected">английский</option>
                <option value="2">немецкий</option>
                <option value="3">французский</option>
                <option value="4">итальянский</option>
                <option value="5">испанский</option>
            </select>
        </div>
        <div class="col-lg-3">
            <select ng-model="foreignLanguage.level" class="form-control"
                    ng-options="template.value as template.name for template in options.levels">
            </select>
        </div>
        <div class="col-lg-3" align="left">
            <button ng-click="removeForeignLanguage($index)" class="btn btn-danger btn-xs">Удалить</button>
        </div>
        <div class="col-lg-1"></div>
    </div>
</div>
<hr>
<div class="row" align="left">
    <div class="col-md-4 infoCB">Категории водительских прав</div>
    <div class="col-md-8">
        <label ng-repeat="driverLicense in options.educationAndSkills.driversLicensesAll">
            <input type="checkbox" checklist-model="cadet.educationAndSkills.driversLicenses"
                   checklist-value="driverLicense"> {{driverLicense}}&nbsp;
        </label>
    </div>
</div>
<hr>
<div class="row" align="left">
    <div class="col-md-12 infoCB">Навыки</div>
</div>
<br>
<div class="row">
    <div class="col-sm-3" align="left">
        <div class="container-fluid" style="padding-left: 15px;">
            <div class="row info">Компьютеры</div>
            <div class="row">
                <button class="btn btn-info btn-xs" ng-click="skillsByFieldOfActivity(1)">Редактировать
                </button>
            </div>
            <div ng-repeat="skill in skillsTextByFoa1" class="row info2">
                {{skill}}
            </div>
        </div>
    </div>
    <div class="col-sm-3" align="left">
        <div class="row info">Спорт</div>
        <div class="row">
            <button class="btn btn-info btn-xs" ng-click="skillsByFieldOfActivity(2)">Редактировать
            </button>
        </div>
        <div ng-repeat="skill in skillsTextByFoa2" class="row info2">
            {{skill}}
        </div>
    </div>
    <div class="col-sm-3" align="left">
        <div class="row info">Искусство</div>
        <div class="row">
            <button class="btn btn-info btn-xs" ng-click="skillsByFieldOfActivity(3)">Редактировать
            </button>
        </div>
        <div ng-repeat="skill in skillsTextByFoa3" class="row info2">
            {{skill}}
        </div>
    </div>
    <div class="col-sm-3" align="left">
        <div class="container-fluid" style="padding-right: 15px;">
            <div class="row info">Технические навыки</div>
            <div class="row">
                <button class="btn btn-info btn-xs" ng-click="skillsByFieldOfActivity(4)">Редактировать
                </button>
            </div>
            <div ng-repeat="skill in skillsTextByFoa4" class="row info2">
                {{skill}}
            </div>
        </div>
    </div>
</div>

