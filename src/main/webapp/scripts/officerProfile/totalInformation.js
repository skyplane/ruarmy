/**
 * Created by skyplane on 19.09.17.
 */



function initTotalInformation($scope){



    $scope.showCustomReligion = function () {
        $('#customReligion').attr('style', '');
        $scope.cadet.totalInformation.customReligion = '';
    };

    $scope.hideCustomReligion = function () {
        $('#customReligion').attr('style', 'display: none');
        $scope.cadet.totalInformation.customReligion = '';
    };


    $scope.divisions = [];
    $.post(
        "../api/division/loadDivisions",
        withCsrfData({})
        , function (json) {
            $scope.$apply(function () {
                $scope.divisions = json.data;
            });
        },
        "json"
    );


    $('#dateOfBirth').datepicker({
        language: 'ru'
    });


    $.validator.addMethod("date", function (value, element) {
        return this.optional(element) || /^\d{1,2}\.\d{1,2}\.\d{4}$/.test(value);
    }, "Пожалуйста, введите дату в формате DD.MM.YYYY");

    $.validator.addMethod("phone", function (value, element) {
        return this.optional(element) || /^\+7\(9\d{2}\)\d{3}-\d{4}$/.test(value);
    }, "Пожалуйста, введите номер телефона в формате +7(9**)***-****");

    $.validator.addMethod("passportNumber", function (value, element) {
        return this.optional(element) || /^\d{4}\s\d{6}$/.test(value);
    }, "Пожалуйста, введите номер паспорта в формате 1234 123456");

    $.validator.addMethod("militaryId", function (value, element) {
        return this.optional(element) || /^[А-Я][А-Я]\s\d{7}$/.test(value);
    }, "Пожалуйста, введите номер военного билета в формате  AA 1234567");

    $scope.editTotalInformation = function (){
        $('#totalInformationShow').toggle();
        $('#totalInformationEdit').toggle();
    };

    $scope.saveAndLoadTotalInformation = function (){

        var totalInformation = jQuery.extend(true, {}, $scope.cadet.totalInformation);

        totalInformation.id = $scope.cadet.id;
        $.post(
            "../api/cadet/saveAndLoadTotalInformation",
            withCsrfData(totalInformation)
            , function (data) {
                if (data.success == 0) {
                    $scope.$apply(function () {
                        $scope.cadet.totalInformation = data.totalInformation;
                        $('#totalInformationShow').toggle();
                        $('#totalInformationEdit').toggle();
                    });
                    alert("Обновлено");
                }
            },
            "json"
        );


    }



}
