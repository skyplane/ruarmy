<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<div class="panel panel2 container-fluid" id="educationAndSkillsShow">

    <div class="row">
        <div class="col-md-9 caption" align="left">
            Образование
        </div>
        <div class="col-md-3">
            <button class="btn btn-link" ng-click="editEducationAndSkills()">Редактировать</button>
        </div>
    </div>
    <br>
    <hr>
    <div ng-repeat="education in cadet.educationAndSkills.educations track by $index">
        <div class="row">
            <div class="col-sm-12 info2">
                {{textByInstitutionType(education.institutionType)+
                (education.institutionType<5?(', '+education.institutionName+', '+education.speciality+', '+
                education.yearOfEnding+educationSubData(education)):'')}}
            </div>
        </div>
        <hr>
    </div>
<br>
    <div class="row">
        <div class="col-md-12 caption" align="left">
            Навыки
        </div>
    </div>
    <br>


    <div class="row">
        <div class="col-sm-3 info" align="right" style="padding-right: 6px;">
            компьютеры
        </div>
        <div class="col-sm-9 info2" align="left" style="padding-left: 6px;">
            {{skillsTextByFoa1}}
        </div>
    </div>
    <hr>
    <div class="row">
        <div class="col-sm-3 info" align="right" style="padding-right: 6px;">
            профессиональный спорт
        </div>
        <div class="col-sm-9 info2" align="left" style="padding-left: 6px;">
            {{skillsTextByFoa2}}
        </div>
    </div>
    <hr>
    <div class="row">
        <div class="col-sm-3 info" align="right" style="padding-right: 6px;">
            искусство
        </div>
        <div class="col-sm-9 info2" align="left" style="padding-left: 6px;">
            {{skillsTextByFoa3}}
        </div>
    </div>
    <hr>
    <div class="row">
        <div class="col-sm-3 info" align="right" style="padding-right: 6px;">
            технические навыки
        </div>
        <div class="col-sm-9 info2" align="left" style="padding-left: 6px;">
            {{skillsTextByFoa4}}
        </div>
    </div>

    <hr>
    <br>

    <div class="row">
        <div class="col-sm-4 infoC" align="left" style="padding-right: 6px;">
            Категории водительских прав
        </div>
        <div class="col-sm-8 " align="left" style="padding-left: 6px;">
            <label ng-repeat="driverLicense in cadet.educationAndSkills.driversLicenses" class="info2">
                {{driverLicense}}&nbsp;
            </label>
        </div>
    </div>
    <br>
    <div class="row">
        <div class="col-sm-4 infoC" align="left" style="padding-right: 6px;">
            Иностранные языки
        </div>
        <div class="col-sm-8 info2" align="left" style="padding-left: 6px;">
            {{getForeignLanguagesString()}}
        </div>
    </div>
    <br>


</div>


<div class="panel panel2 container-fluid" id="educationAndSkillsEdit" style="display: none">

    <div class="row" align="center">
        <label class="caption">Образование и навыки</label>
    </div>

    <br>

    <div class="row" align="center">
        <button ng-click="addEducation()">Добавить образование</button>
    </div>
    <br>
    <div class="row" ng-repeat="education in cadet.educationAndSkills.educations track by $index">
        <div class="col-sm-8">
            {{textByInstitutionType(education.institutionType)+
            (education.institutionType<5?(', '+education.institutionName+', '+education.speciality+', '+
            education.yearOfEnding+educationSubData(education)):'')}}
        </div>
        <div class="col-sm-4">
            <button ng-click="editEducation($index)">Редактировать</button>
            <button ng-click="removeEducation($index)">Удалить</button>
        </div>
    </div>
    <hr>

    <div class="row" align="center">
        <label class="control-label">Навыки</label>
    </div>
    <div class="row">
        <div class="col-sm-6">
            <label class=" control-label">компьютеры</label>
        </div>
        <div class="col-sm-6">
            <label class=" control-label">профессиональный спорт (при наличии
                разряда)</label>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-4">
            {{skillsTextByFoa1}}
        </div>
        <div class="col-sm-2">
            <button class="btn btn-default btn-xs"
                    ng-click="skillsByFieldOfActivity(1)">Редактировать
            </button>
        </div>
        <div class="col-sm-4">
            {{skillsTextByFoa2}}
        </div>
        <div class="col-sm-2">
            <button class="btn btn-default btn-xs"
                    ng-click="skillsByFieldOfActivity(2)">Редактировать
            </button>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-6">
            <label class=" control-label">искусство</label>
        </div>
        <div class="col-sm-6">
            <label class=" control-label">технические навыки</label>
        </div>
    </div>
    <div class="row">
        <div class="col-sm-4">
            {{skillsTextByFoa3}}
        </div>
        <div class="col-sm-2">
            <button class="btn btn-default btn-xs"
                    ng-click="skillsByFieldOfActivity(3)">Редактировать
            </button>
        </div>
        <div class="col-sm-4">
            {{skillsTextByFoa4}}
        </div>
        <div class="col-sm-2">
            <button class="btn btn-default btn-xs"
                    ng-click="skillsByFieldOfActivity(4)">Редактировать
            </button>
        </div>
    </div>

    <hr>
    <div class="row" align="center">
        <label class="control-label">Категории водительских прав</label>
    </div>
    <div class="row" align="center">
        <label ng-repeat="driverLicense in options.educationAndSkills.driversLicensesAll">
            <input type="checkbox" checklist-model="cadet.educationAndSkills.driversLicenses"
                   checklist-value="driverLicense"> {{driverLicense}}&nbsp;
        </label>
    </div>

    <hr>

    <div class="row" align="center">
        <label class=" control-label">Иностранные языки</label>
    </div>
    <div class="row" align="center">
        <button ng-click="addForeignLanguage()">Добавить язык</button>
    </div>
    <br>
    <div class="row"
         ng-repeat="foreignLanguage in cadet.educationAndSkills.foreignLanguages track by $index">
        <div class="col-lg-4">
            <select ng-model="foreignLanguage.language">
                <option value="1">английский</option>
                <option value="2">немецкий</option>
                <option value="3">французский</option>
                <option value="4">итальянский</option>
                <option value="5">испанский</option>
            </select>
        </div>
        <div class="col-lg-4">
            <select ng-model="foreignLanguage.level">
                <option value="1">свободно владеет</option>
                <option value="2">средний уровень</option>
                <option value="3">базовый уровень</option>
            </select>
        </div>

        <div class="col-lg-2">
            <button ng-click="removeForeignLanguage($index)">Удалить</button>
        </div>
    </div>

    <button class="btn btn-success" ng-click="saveAndLoadEducationAndSkills()">Сохранить</button>

</div>

<!-- Modal -->
<div class="modal fade" id="educationModal" tabindex="-1" role="dialog"
     aria-labelledby="educationModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content" style="width:900">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="educationModalLabel">Образование</h4>
            </div>
            <div class="modal-body">
                <div class="container-fluid">

                    <div class="row">
                        <div class="col-sm-8">
                            <div class="row">
                                <label class="col-sm-4 control-label">Тип Образования</label>
                                <div class="col-sm-8">
                                    <select name="institutionType"
                                            ng-model="options.educationAndSkills.education.institutionType"
                                            ng-change="changeInstitutionType()">
                                        <option value="1">
                                            Высшее профессиональное (магистр)
                                        </option>
                                        <option value="2">
                                            Высшее профессиональное
                                        </option>
                                        <option value="3">
                                            Среднее профессиональное
                                        </option>
                                        <option value="4">
                                            Начальное профессиональное
                                        </option>
                                        <option value="5">
                                            Среднее полное (11 классов)
                                        </option>
                                        <option value="6">
                                            Среднее общее (9 классов)
                                        </option>
                                        <option value="7">
                                            Среднее начальное (4 класса)
                                        </option>
                                    </select>
                                </div>
                            </div>
                            <div id="notSchoolEducationDiv">
                                <br>
                                <div class="row">
                                    <label class="col-sm-4 control-label">Учебное заведение</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" name="institutionName"
                                               id="institutionName"
                                               ng-model="options.educationAndSkills.education.institutionName">
                                    </div>
                                </div>
                                <br>
                                <div class="row">
                                    <label class="col-sm-4 control-label">Специальность</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" name="educationSpeciality"
                                               id="educationSpeciality"
                                               ng-model="options.educationAndSkills.education.speciality">
                                    </div>
                                </div>
                                <br>
                                <div class="row">
                                    <label class="col-sm-4 control-label">Год окончания</label>
                                    <div class="col-sm-8">
                                        <input type="text" class="form-control" name="yearOfEnding"
                                               id="yearOfEnding"
                                               ng-model="options.educationAndSkills.education.yearOfEnding">
                                    </div>

                                </div>
                            </div>

                        </div>
                        <div class="col-sm-4">

                            <div class="row" id="unfinishedDiv">
                                <label class="col-sm-6 control-label">Неоконченное</label>
                                <div class="col-sm-6">
                                    <div class="btn-group btn-group-justified" role="group">
                                        <div class="btn-group" role="group">
                                            <button type="button"
                                                    class="btn btn-default btn-xs trueEducationUnfinished"
                                                    ng-click="setEducationUnfinished(true)">Да
                                            </button>
                                        </div>
                                        <div class="btn-group" role="group">
                                            <button type="button"
                                                    class="btn btn-default btn-xs falseEducationUnfinished"
                                                    ng-click="setEducationUnfinished(false)">Нет
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div id="highAchieverDiv" style="display: none">
                                <br>
                                <div class="row">

                                    <label class="col-sm-6 control-label">Отличник</label>
                                    <div class="col-sm-6">
                                        <div class="btn-group btn-group-justified" role="group">
                                            <div class="btn-group" role="group">
                                                <button type="button"
                                                        class="btn btn-default btn-xs trueEducationHighAchiever"
                                                        ng-click="setEducationHighAchiever(true)">Да
                                                </button>
                                            </div>
                                            <div class="btn-group" role="group">
                                                <button type="button"
                                                        class="btn btn-default btn-xs falseEducationHighAchiever"
                                                        ng-click="setEducationHighAchiever(false)">Нет
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div id="redDiplomaDiv">
                                <br>
                                <div class="row">
                                    <label class="col-sm-6 control-label">Красный диплом</label>
                                    <div class="col-sm-6">
                                        <div class="btn-group btn-group-justified" role="group">
                                            <div class="btn-group" role="group">
                                                <button type="button"
                                                        class="btn btn-default btn-xs trueEducationRedDiploma"
                                                        ng-click="setEducationRedDiploma(true)">Да
                                                </button>
                                            </div>
                                            <div class="btn-group" role="group">
                                                <button type="button"
                                                        class="btn btn-default btn-xs falseEducationRedDiploma"
                                                        ng-click="setEducationRedDiploma(false)">Нет
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Закрыть</button>
                <button type="button" class="btn btn-primary" ng-click="saveEducation()">Сохранить</button>
            </div>
        </div>
    </div>
</div>


<!-- Modal -->
<div class="modal fade" id="skillsModal" tabindex="-1" role="dialog"
     aria-labelledby="skillsModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content" style="width:900">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="skillsModalLabel">Навыки</h4>
            </div>
            <div class="modal-body">
                <div class="container-fluid">
                    <div class="row" ng-repeat="skill in options.educationAndSkills.actualSkills">
                        <div class="col-lg-12">
                            <input type="checkbox" checklist-model="cadet.educationAndSkills.skills"
                                   checklist-value="skill.id">
                            {{skill.name}}
                        </div>
                    </div>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal"
                        ng-click="loadSkillsByFoa();">Закрыть
                </button>
            </div>
        </div>
    </div>
</div>
