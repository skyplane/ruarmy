<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<div class="panel panel2 container-fluid" id="familyCompositionShow">


    <div class="row">
        <div class="col-md-9 caption" align="left">
            Данные о семье
        </div>
        <div class="col-md-3">
            <button class="btn btn-link infoC" ng-click="editFamilyComposition()">Редактировать</button>
        </div>
    </div>
    <hr>
    <div class="row container">
        <div class="col-sm-7" align="left">
            <div class="row info">{{textByCompositionOfFamily()}}</div>
            <div class="row"><label class="signature">состав семьи</label></div>
        </div>
        <div class="col-sm-5" align="left">
            <div class="row info">{{textByMarried()}}</div>
            <div class="row"><label class="signature">семейное положение</label></div>
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
                <div class="col-sm-1 info">
                    {{textByFamilyMemberType(familyMember.familyMemberType)}}
                </div>

                <div class="col-sm-5 info2" align="left">
                    <div class="row info">{{familyMember.lastName+' '+familyMember.firstName+'
                        '+familyMember.patronymic}}
                    </div>
                    <div class="row"><label class="signature">{{familyMember.occupation}}</label></div>
                </div>

                <div class="col-sm-2 info">
                    {{familyMember.dateOfBirth}}
                </div>
                <div class="col-sm-3 info">
                    {{familyMember.phone}}
                </div>
            </div>
        </div>
        <hr>
    </div>

</div>


<div class="panel panel2 container-fluid" id="familyCompositionEdit" style="display: none">
    <div class="row">
        <div class="col-md-9 caption" align="left">
            Данные о семье
        </div>
    </div>
    <hr>
    <jsp:include page="../editForms/familyCompositionEdit.jsp"/>
    <br>
    <button class="btn btn-success" ng-click="saveAndLoadFamilyComposition()">Сохранить</button>

</div>


<jsp:include page="../editForms/familyCompositionModal.jsp"/>


