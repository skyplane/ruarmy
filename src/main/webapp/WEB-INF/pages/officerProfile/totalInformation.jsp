<%@ page contentType="text/html;charset=UTF-8" language="java" %>


<div class="panel panel2 container-fluid" id="totalInformationShow" align="left">




    <div class="row">
        <div class="col-md-3">

        </div>
        <div class="col-md-9">
            <div class="row">
                <div class="col-md-9">
                    <label class="infoB">{{cadet.totalInformation.surname}}&nbsp
                        {{cadet.totalInformation.name}}&nbsp;{{cadet.totalInformation.patronymic}}</label>
                </div>
                <div class="col-md-3">
                    <button class="btn btn-link infoC" ng-click="editTotalInformation()">Редактировать</button>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6">
                    <div class="row info">{{cadet.totalInformation.dateOfBirth}}</div>
                    <div class="row"><label class="signature">дата рождения</label></div>
                    <div class="row info">{{cadet.totalInformation.nationality}}</div>
                    <div class="row"><label class="signature">национальность</label></div>
                    <div class="row info">{{cadet.totalInformation.religion.name}}</div>
                    <div class="row"><label class="signature">вероисповедание</label></div>
                    <div class="row info">{{cadet.totalInformation.militaryIdNumber}}</div>
                    <div class="row"><label class="signature">военный билет</label></div>
                    <div class="row info">{{cadet.totalInformation.passportNumber}}</div>
                    <div class="row"><label class="signature">паспорт</label></div>
                    <div class="row info">{{cadet.totalInformation.phone}}</div>
                    <div class="row"><label class="signature">телефон</label></div>
                </div>
                <div class="col-md-6">
                    <div class="row info">{{cadet.totalInformation.militaryRank.name}}</div>
                    <div class="row"><label class="signature">воинское звание</label></div>
                    <div class="row info">{{cadet.totalInformation.post}}</div>
                    <div class="row"><label class="signature">должность</label></div>
                    <div class="row info">{{cadet.totalInformation.division.name}}</div>
                    <div class="row"><label class="signature">подразделение</label></div>
                    <div class="row info">{{cadet.totalInformation.faculty}}</div>
                    <div class="row"><label class="signature">факультет</label></div>
                    <div class="row info">{{cadet.totalInformation.speciality}}</div>
                    <div class="row"><label class="signature">специальность</label></div>
                    <div class="row info">{{cadet.totalInformation.yearOfAdmission}}</div>
                    <div class="row"><label class="signature">год поступления</label></div>
                </div>
            </div>
        </div>
    </div>
</div>


<div class="panel panel2 container-fluid" id="totalInformationEdit" style="display: none">


    <div class="row">
        <div class="col-md-9" align="left">
            <label class="caption">Общие данные</label>
        </div>
    </div>
    <hr>

    <jsp:include page="../editForms/totalInformationEdit.jsp"/>

    <br>
    <hr>
    <br>

    <button class="btn btn-success" ng-click="saveAndLoadTotalInformation()">Сохранить</button>

</div>

