<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<div class="panel panel2 container-fluid" id="familyCompositionShow">


    <div class="row">
        <div class="col-md-9 caption" align="left">
            Данные о семье
        </div>
        <div class="col-md-3">
            <button class="btn btn-link" ng-click="editFamilyComposition()">Редактировать</button>
        </div>
    </div>
    <br>
    <div class="row">
        <div class="col-sm-2 info" align="right" style="padding-right: 6px;">
            Семейное положение
        </div>
        <div class="col-sm-10 info2" align="left" style="padding-left: 6px;">
            {{textByCompositionOfFamily()}}
        </div>
    </div>
    <br>
    <div class="row">
        <div class="col-sm-2 info" align="right" style="padding-right: 6px;">
            Состав семьи
        </div>
        <div class="col-sm-10 info2" align="left" style="padding-left: 6px;">
            {{textByMarried()}}
        </div>
    </div>

    <br>
    <div class="row">
        <div class="col-md-12 caption" align="left">
            Члены семьи
        </div>
    </div>

    <hr>
    <div ng-repeat="familyMember in cadet.familyComposition.familyMembers track by $index">
        <div class="row">
            <div class="col-sm-12">
                <div class="col-sm-1 info2">
                    {{textByFamilyMemberType(familyMember.familyMemberType)}}
                </div>

                <div class="col-sm-5 info2">
                    <div class="row">
                        <div class="col-sm-12">
                            {{familyMember.lastName+' '+familyMember.firstName+'
                            '+familyMember.patronymic}}
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12">

                        </div>
                    </div>
                </div>

                <div class="col-sm-2 info2">
                    {{familyMember.dateOfBirth}}
                </div>
                <div class="col-sm-3 info2">
                    {{familyMember.phone}}
                </div>
            </div>
        </div>
        <hr>
    </div>

</div>


<div class="panel panel2 container-fluid" id="familyCompositionEdit" style="display: none">

    <div class="row">
        <label class="col-sm-1 control-label">Состав семьи</label>
        <div class="col-sm-2">
            <select name="compositionOfFamily"
                    id="compositionOfFamily" ng-model="cadet.familyComposition.compositionOfFamily"
                    ng-change="compositionOfFamily()">
                <option value="1">
                    полная
                </option>
                <option value="2">
                    без отца
                </option>
                <option value="3">
                    без матери
                </option>
                <option value="4">
                    сирота
                </option>
            </select>
        </div>
        <div id="hasInformationAboutParentsId" style="display:none">
            <label class="col-sm-4 control-label">имеет ли сведения о родителях?</label>
            <div class="col-sm-2">
                <div class="btn-group btn-group-justified" role="group">
                    <div class="btn-group" role="group">
                        <button type="button"
                                class="btn btn-default btn-xs trueHasInformationAboutParents"
                                ng-click="setHasInformationAboutParents(true)">Да
                        </button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="button"
                                class="btn btn-default btn-xs falseHasInformationAboutParents"
                                ng-click="setHasInformationAboutParents(false)">Нет
                        </button>
                    </div>
                </div>
            </div>
        </div>
        <div id="withoutFatherId" style="display: none">
            <label class="col-sm-2 control-label">Укажите причину</label>
            <div class="col-sm-2">
                <select name="withoutFather"
                        id="withoutFather" ng-model="cadet.familyComposition.withoutFather">
                    <option value="1" onclick="$('#fatherExistId').attr('style','');">
                        родители в разводе
                    </option>
                    <option value="2" onclick="$('#fatherExistId').attr('style','');">
                        отец ушел из семьи
                    </option>
                    <option value="3"
                            onclick="$('#fatherExistId').attr('style','display:none');">
                        отец умер
                    </option>
                </select>
            </div>
            <div id="fatherExistId" style="display: none">
                <label class="col-sm-3 control-label">поддерживает ли
                    отношения?</label>
                <div class="col-sm-2">
                    <div class="btn-group btn-group-justified" role="group">
                        <div class="btn-group" role="group">
                            <button type="button"
                                    class="btn btn-default trueFatherExist"
                                    ng-click="setFatherExist(true)">Да
                            </button>
                        </div>
                        <div class="btn-group" role="group">
                            <button type="button"
                                    class="btn btn-default falseFatherExist"
                                    ng-click="setFatherExist(false)">Нет
                            </button>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <div id="withoutMotherId" style="display: none">
            <label class="col-sm-2 control-label">Укажите причину</label>
            <div class="col-sm-2">
                <select name="withoutMother"
                        id="withoutMother" ng-model="cadet.familyComposition.withoutMother">
                    <option value="1" onclick="$('#motherExistId').attr('style','');">
                        родители в разводе
                    </option>
                    <option value="2" onclick="$('#motherExistId').attr('style','');">
                        мать ушла из семьи
                    </option>
                    <option value="3"
                            onclick="$('#motherExistId').attr('style','display:none');">
                        мать умерла
                    </option>
                </select>
            </div>
            <div id="motherExistId" style="display: none">
                <label class="col-sm-3 control-label">поддерживает ли
                    отношения?</label>
                <div class="col-sm-2">
                    <div class="btn-group btn-group-justified" role="group">
                        <div class="btn-group" role="group">
                            <button type="button"
                                    class="btn btn-default trueMotherExist"
                                    ng-click="setMotherExist(true)">Да
                            </button>
                        </div>
                        <div class="btn-group" role="group">
                            <button type="button"
                                    class="btn btn-default falseMotherExist"
                                    ng-click="setMotherExist(false)">Нет
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <hr>
    <div class="row">
        <label class="col-sm-4 control-label">Семейное положение</label>
        <div class="col-sm-2">
            <select name="married"
                    id="married" ng-model="cadet.familyComposition.married">
                <option value="1">холост</option>
                <option value="2">женат</option>
                <option value="3">в гражданском браке</option>
                <option value="4">состоит в отношениях</option>
                <option value="5">вдовец</option>
            </select>
        </div>
        <label class="col-sm-4 control-label">Сколько браков заключал</label>
        <div class="col-sm-2">
            <select name="married"
                    id="marrieds" ng-model="cadet.familyComposition.marrieds">
                <option value="1">ни одного</option>
                <option value="2">один</option>
                <option value="3">два</option>
                <option value="4">три</option>
                <option value="5">четыре и более</option>
            </select>
        </div>
    </div>

    <hr>
    <div class="row" align="center">
        <button ng-click="addFamilyMember()">Добавить члена семьи</button>
    </div>
    <hr>
    <div class="row"
         ng-repeat="familyMember in cadet.familyComposition.familyMembers track by $index">
        <div class="col-sm-2">
            {{textByFamilyMemberType(familyMember.familyMemberType)}}
        </div>

        <div class="col-sm-4">
            {{familyMember.lastName+' '+familyMember.firstName+'
            '+familyMember.patronymic}}
        </div>

        <div class="col-sm-4">
            <button ng-click="editFamilyMember($index)">Редактировать</button>
            <button ng-click="removeFamilyMember($index)">Удалить</button>
        </div>
    </div>
    <br>

    <button class="btn btn-success" ng-click="saveAndLoadFamilyComposition()">Сохранить</button>

</div>


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
                        <label class="col-sm-3 control-label">Родственная связь</label>
                        <div class="col-sm-2">
                            <select name="familyMemberType" ng-model="familyMember.familyMemberType">
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
                            <label class="col-sm-4 control-label">воспитывается отдельно?</label>
                            <div class="col-sm-2">
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
                                   id="familyMemberPhone"
                                   ng-model="familyMember.phone">
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
                                       ng-model="familyMember.familyMemberHasDiedYear">
                            </div>
                        </div>
                    </div>

                    <div class="hasDiedClass">
                        <div class="row" align="right">
                            <label class="col-sm-2 control-label">Причина смерти</label>
                            <div class="col-sm-4">
                                <input type="text" class="form-control" name="familyMemberHasDiedCause"
                                       id="familyMemberHasDiedCause"
                                       ng-model="familyMember.familyMemberHasDiedCause">

                            </div>

                            <label class="col-sm-2 control-label">Место захоронения</label>
                            <div class="col-sm-4">
                                <input type="text" class="form-control" name="familyMemberHasDiedPlace"
                                       id="familyMemberHasDiedPlace"
                                       ng-model="familyMember.familyMemberHasDiedPlace">
                            </div>
                        </div>
                    </div>

                    <hr>
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Закрыть</button>
                <button type="button" class="btn btn-primary" ng-click="saveFamilyMember()">Сохранить</button>
            </div>
        </div>
    </div>
</div>



