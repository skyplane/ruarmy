<%@ page contentType="text/html;charset=UTF-8" language="java" %>

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
                                    <select name="institutionType" class="form-control"
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
                                               ng-model="options.educationAndSkills.education.yearOfEnding"
                                               placeholder="****" ui-year>
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
                <button type="button" class="btn btn-default" ng-click="restoreEducation()" data-dismiss="modal">Отмена</button>
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
                        <div class="col-md-5">
                            &nbsp;
                        </div>
                        <div class="col-md-7" align="left">
                            <label class="checkbox-label info2"><input type="checkbox" checklist-model="cadet.educationAndSkills.skills"
                                                                 checklist-value="skill.id">&nbsp;&nbsp;{{skill.name}}</label>
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
