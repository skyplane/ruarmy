
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="row">
    <div class="col-md-1 info" align="right">Состав семьи</div>
    <div class="col-md-2" align="left">
        <select name="compositionOfFamily" class="form-control"
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
        <div class="col-md-4 info" align="right">имеет ли сведения о родителях?</div>
        <div class="col-md-2" align="left">
            <div class="btn-group btn-group-justified" role="group">
                <div class="btn-group" role="group">
                    <button type="button"
                            class="btn btn-default trueHasInformationAboutParents"
                            ng-click="setHasInformationAboutParents(true)">Да
                    </button>
                </div>
                <div class="btn-group" role="group">
                    <button type="button"
                            class="btn btn-default falseHasInformationAboutParents"
                            ng-click="setHasInformationAboutParents(false)">Нет
                    </button>
                </div>
            </div>
        </div>
    </div>
    <div id="withoutFatherId" style="display: none">
        <div class="col-md-2 info" align="right">Укажите причину</div>
        <div class="col-md-3" align="left">
            <select name="withoutFather" class="form-control"
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
            <div class="col-md-2 info" align="right">поддерживает ли
                отношения?</div>
            <div class="col-md-2" align="left">
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
        <div class="col-md-2 info" align="right">Укажите причину</div>
        <div class="col-md-3" align="left">
            <select name="withoutMother" class="form-control"
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
            <div class="col-md-2 info" align="right">поддерживает ли
                отношения?</div>
            <div class="col-md-2" align="left">
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
    <div class="col-md-4 info" align="right">Семейное положение</div>
    <div class="col-md-2" align="left">
        <select name="married" class="form-control"
                id="married" ng-model="cadet.familyComposition.married">
            <option value="1">холост</option>
            <option value="2">женат</option>
            <option value="3">в гражданском браке</option>
            <option value="4">состоит в отношениях</option>
            <option value="5">вдовец</option>
        </select>
    </div>
    <div class="col-md-4 info" align="right">Сколько браков заключал</div>
    <div class="col-md-2" align="left">
        <select name="married" class="form-control"
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
<div ng-repeat="familyMember in cadet.familyComposition.familyMembers track by $index">
    <div class="row">
        <div class="col-sm-2 info2">
            {{textByFamilyMemberType(familyMember.familyMemberType)}}
        </div>
        <div class="col-sm-8 info2">
            {{familyMember.lastName+' '+familyMember.firstName+'
            '+familyMember.patronymic}}
        </div>
        <div class="col-sm-2">
            <div class="row">
                <button class="btn btn-xs btn-info" ng-click="editFamilyMember($index)">Редактировать</button>
            </div>
            <div class="row">
                <button class="btn btn-xs btn-danger" ng-click="removeFamilyMember($index)">Удалить</button>
            </div>
        </div>
    </div>
    <hr>
</div>