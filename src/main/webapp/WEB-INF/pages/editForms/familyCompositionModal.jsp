
<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<!-- Modal -->
<div class="modal fade" id="familyMemberModal" tabindex="-1" role="dialog"
     aria-labelledby="familyMemberModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content" style="width:1000px" align="center">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                        aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="familyMemberModalLabel">Член семьи</h4>
            </div>
            <div class="modal-body">
                <div class="container-fluid">
                    <div class="row">
                        <label class="col-sm-3 control-label" align="right">Родственная связь</label>
                        <div class="col-sm-2" align="left">
                            <select name="familyMemberType" ng-model="familyMember.familyMemberType" class="form-control">
                                <option value="1"
                                        onclick="$('#isBroughtUpSeparatelyId').attr('style','display:none');">
                                    мать
                                </option>
                                <option value="2"
                                        onclick="$('#isBroughtUpSeparatelyId').attr('style','display:none');">
                                    отец
                                </option>
                                <option value="3"
                                        onclick="$('#isBroughtUpSeparatelyId').attr('style','display:none');">
                                    мачеха
                                </option>
                                <option value="4"
                                        onclick="$('#isBroughtUpSeparatelyId').attr('style','display:none');">
                                    отчим
                                </option>
                                <option value="5"
                                        onclick="$('#isBroughtUpSeparatelyId').attr('style','display:none');">
                                    опекун
                                </option>
                                <option value="6"
                                        onclick="$('#isBroughtUpSeparatelyId').attr('style','display:none');">
                                    брат
                                </option>
                                <option value="7"
                                        onclick="$('#isBroughtUpSeparatelyId').attr('style','display:none');">
                                    сестра
                                </option>
                                <option value="8"
                                        onclick="$('#isBroughtUpSeparatelyId').attr('style','display:none');">
                                    жена
                                </option>
                                <option value="9" onclick="$('#isBroughtUpSeparatelyId').attr('style','');">
                                    сын
                                </option>
                                <option value="10" onclick="$('#isBroughtUpSeparatelyId').attr('style','');">
                                    дочь
                                </option>
                            </select>
                        </div>
                        <div id="isBroughtUpSeparatelyId" style="display:none">
                            <label class="col-sm-4 control-label" align="right">воспитывается отдельно?</label>
                            <div class="col-sm-2" align="left">
                                <div class="btn-group btn-group-justified" role="group">
                                    <div class="btn-group" role="group">
                                        <button type="button"
                                                class="btn btn-default btn-xs trueFamilyMemberIsBroughtUpSeparately"
                                                ng-click="setFamilyMemberIsBroughtUpSeparately(true)">Да
                                        </button>
                                    </div>
                                    <div class="btn-group" role="group">
                                        <button type="button"
                                                class="btn btn-default btn-xs falseFamilyMemberIsBroughtUpSeparately"
                                                ng-click="setFamilyMemberIsBroughtUpSeparately(false)">Нет
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                    <br>
                    <div class="row">
                        <label class="col-sm-1 control-label">Фамилия</label>
                        <div class="col-sm-3">
                            <input type="text" class="form-control" name="familyMemberLastName"
                                   id="familyMemberLastName"
                                   ng-model="familyMember.lastName">
                        </div>
                        <label class="col-sm-1 control-label">Имя</label>
                        <div class="col-sm-3">
                            <input type="text" class="form-control" name="familyMemberFirstName"
                                   id="familyMemberFirstName"
                                   ng-model="familyMember.firstName">
                        </div>
                        <label class="col-sm-1 control-label">Отчество</label>
                        <div class="col-sm-3">
                            <input type="text" class="form-control" name="familyMemberPatronymic"
                                   id="familyMemberPatronymic"
                                   ng-model="familyMember.patronymic">
                        </div>
                    </div>
                    <br>
                    <div class="row">
                        <label class="col-sm-1 control-label">Дата рождения</label>
                        <div class="col-sm-2">
                            <input type="text" class="form-control" name="familyMemberDateOfBirth"
                                   id="familyMemberDateOfBirth"
                                   ng-model="familyMember.dateOfBirth">
                        </div>
                        <label class="col-sm-2 control-label">Род деятельности</label>
                        <div class="col-sm-3">
                            <input type="text" class="form-control" name="familyMemberOccupation"
                                   id="familyMemberOccupation"
                                   ng-model="familyMember.occupation">
                        </div>
                        <label class="col-sm-2 control-label">Номер телефона</label>
                        <div class="col-sm-2">
                            <input type="text" class="form-control" name="familyMemberPhone"
                                   id="familyMemberPhone"  placeholder="+7(***)***-****"
                                   ng-model="familyMember.phone" ui-phone>
                        </div>
                    </div>
                    <br>
                    <div class="row" align="right">
                        <label class="col-sm-4 control-label">проходил/а лечение от алкоголизма?</label>
                        <div class="col-sm-2">
                            <div class="btn-group btn-group-justified" role="group">
                                <div class="btn-group" role="group">
                                    <button type="button"
                                            class="btn btn-default btn-xs trueFamilyMemberWasTreatedForAlcoholism"
                                            ng-click="setFamilyMemberWasTreatedForAlcoholism(true)">Да
                                    </button>
                                </div>
                                <div class="btn-group" role="group">
                                    <button type="button"
                                            class="btn btn-default btn-xs falseFamilyMemberWasTreatedForAlcoholism"
                                            ng-click="setFamilyMemberWasTreatedForAlcoholism(false)">Нет
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row" align="right">
                        <label class="col-sm-4 control-label">проходил/а лечение от наркомании?</label>
                        <div class="col-sm-2">
                            <div class="btn-group btn-group-justified" role="group">
                                <div class="btn-group" role="group">
                                    <button type="button"
                                            class="btn btn-default btn-xs trueFamilyMemberWasTreatedForAddiction"
                                            ng-click="setFamilyMemberWasTreatedForAddiction(true)">Да
                                    </button>
                                </div>
                                <div class="btn-group" role="group">
                                    <button type="button"
                                            class="btn btn-default btn-xs falseFamilyMemberWasTreatedForAddiction"
                                            ng-click="setFamilyMemberWasTreatedForAddiction(false)">Нет
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row" align="right">
                        <label class="col-sm-4 control-label">имеет судимость?</label>
                        <div class="col-sm-2">
                            <div class="btn-group btn-group-justified" role="group">
                                <div class="btn-group" role="group">
                                    <button type="button"
                                            class="btn btn-default btn-xs trueFamilyMemberHasACriminalRecord"
                                            ng-click="setFamilyMemberHasACriminalRecord(true)">Да
                                    </button>
                                </div>
                                <div class="btn-group" role="group">
                                    <button type="button"
                                            class="btn btn-default btn-xs falseFamilyMemberHasACriminalRecord"
                                            ng-click="setFamilyMemberHasACriminalRecord(false)">Нет
                                    </button>
                                </div>
                            </div>
                        </div>
                        <div class="hasACriminalRecordClass">
                            <label class="col-sm-2 control-label">Укажите статью и период</label>
                            <div class="col-sm-4">
                                <input type="text" class="form-control" name="hasACriminalRecordDetails"
                                       id="hasACriminalRecordDetails"
                                       ng-model="familyMember.hasACriminalRecordDetails">
                            </div>
                        </div>
                    </div>
                    <div class="row" align="right">
                        <label class="col-sm-4 control-label">имеет психическое заболевание?</label>
                        <div class="col-sm-2">
                            <div class="btn-group btn-group-justified" role="group">
                                <div class="btn-group" role="group">
                                    <button type="button"
                                            class="btn btn-default btn-xs trueFamilyMemberHasAMentalIllness"
                                            ng-click="setFamilyMemberHasAMentalIllness(true)">Да
                                    </button>
                                </div>
                                <div class="btn-group" role="group">
                                    <button type="button"
                                            class="btn btn-default btn-xs falseFamilyMemberHasAMentalIllness"
                                            ng-click="setFamilyMemberHasAMentalIllness(false)">Нет
                                    </button>
                                </div>
                            </div>
                        </div>
                        <div class="hasAMentalIllnessClass">
                            <label class="col-sm-2 control-label">Укажите какое</label>
                            <div class="col-sm-4">
                                <input type="text" class="form-control" name="hasAMentalIllnessName"
                                       id="hasAMentalIllnessName"
                                       ng-model="familyMember.hasAMentalIllnessName">
                            </div>
                        </div>
                    </div>
                    <div class="row" align="right">
                        <label class="col-sm-4 control-label">имеет попытки суицида?</label>
                        <div class="col-sm-2">
                            <div class="btn-group btn-group-justified" role="group">
                                <div class="btn-group" role="group">
                                    <button type="button"
                                            class="btn btn-default btn-xs trueFamilyMemberHasSuicideAttempts"
                                            ng-click="setFamilyMemberHasSuicideAttempts(true)">Да
                                    </button>
                                </div>
                                <div class="btn-group" role="group">
                                    <button type="button"
                                            class="btn btn-default btn-xs falseFamilyMemberHasSuicideAttempts"
                                            ng-click="setFamilyMemberHasSuicideAttempts(false)">Нет
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row" align="right">
                        <label class="col-sm-4 control-label">имеет инвалидность?</label>
                        <div class="col-sm-2">
                            <div class="btn-group btn-group-justified" role="group">
                                <div class="btn-group" role="group">
                                    <button type="button"
                                            class="btn btn-default btn-xs trueFamilyMemberHasADisability"
                                            ng-click="setFamilyMemberHasADisability(true)">Да
                                    </button>
                                </div>
                                <div class="btn-group" role="group">
                                    <button type="button"
                                            class="btn btn-default btn-xs falseFamilyMemberHasADisability"
                                            ng-click="setFamilyMemberHasADisability(false)">Нет
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row" align="right">
                        <label class="col-sm-4 control-label">умер/умерла?</label>
                        <div class="col-sm-2">
                            <div class="btn-group btn-group-justified" role="group">
                                <div class="btn-group" role="group">
                                    <button type="button"
                                            class="btn btn-default btn-xs trueFamilyMemberHasDied"
                                            ng-click="setFamilyMemberHasDied(true)">Да
                                    </button>
                                </div>
                                <div class="btn-group" role="group">
                                    <button type="button"
                                            class="btn btn-default btn-xs falseFamilyMemberHasDied"
                                            ng-click="setFamilyMemberHasDied(false)">Нет
                                    </button>
                                </div>
                            </div>
                        </div>
                        <div class="hasDiedClass">
                            <label class="col-sm-2 control-label">В каком году?</label>
                            <div class="col-sm-4">
                                <input type="text" class="form-control" name="familyMemberHasDiedYear"
                                       id="familyMemberHasDiedYear"
                                       ng-model="familyMember.hasDiedYear"
                                       placeholder="****" ui-year>
                            </div>
                        </div>
                    </div>

                    <div class="hasDiedClass">
                        <div class="row" align="right">
                            <label class="col-sm-2 control-label">Причина смерти</label>
                            <div class="col-sm-4">
                                <input type="text" class="form-control" name="familyMemberHasDiedCause"
                                       id="familyMemberHasDiedCause"
                                       ng-model="familyMember.hasDiedCause">

                            </div>

                            <label class="col-sm-2 control-label">Место захоронения</label>
                            <div class="col-sm-4">
                                <input type="text" class="form-control" name="familyMemberHasDiedPlace"
                                       id="familyMemberHasDiedPlace"
                                       ng-model="familyMember.hasDiedPlace">
                            </div>
                        </div>
                    </div>

                    <hr>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal" ng-click="restoreFamilyMember()">Отмена</button>
                <button type="button" class="btn btn-primary" ng-click="saveFamilyMember()">Сохранить</button>
            </div>
        </div>
    </div>
</div>