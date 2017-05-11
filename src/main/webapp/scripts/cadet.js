function loadSubjectsByIdAndType(subjectId, objectId, type) {
    $('#' + subjectId).autocomplete({
        serviceUrl: '/api/autocomplete/subjectByTerm?type=' + type,
        onSelect: function (subjectSuggestion) {
            $('#' + objectId).autocomplete({
                serviceUrl: '/api/autocomplete/cityByTerm?subjectId=' + subjectSuggestion.data,
                onSelect: function (suggestion) {

                }
            });
        }
    });
}

var app = angular.module('cadetApp');

app.controller('cadetCtrl', function ($scope) {

    $scope.cadet = {};
    $scope.options = {};
    $scope.cadet.addressData = {};

    $scope.cadet.brothers = [];
    $scope.cadet.sisters = [];

    $scope.addBrother = function () {
        $scope.cadet.brothers.push("");
    };

    $scope.removeBrother = function (index) {
        $scope.cadet.brothers.splice(index, 1);
    };

    $scope.addSister = function () {
        $scope.cadet.sisters.push("");
    };

    $scope.removeSister = function (index) {
        $scope.cadet.sisters.splice(index, 1);
    };

    $scope.options.cityTypes = [
        {'name': 'город', 'value': '1'}, {'name': 'ПГТ', 'value': '2'}, {'name': 'поселок', 'value': '3'},
        {'name': 'село', 'value': '4'}, {'name': 'деревня', 'value': '5'}, {'name': 'станица', 'value': '6'},
        {'name': 'хутор', 'value': '7'}
    ];

    $scope.options.streetTypes = [
        {'name': 'улица', 'value': '1'}, {'name': 'переулок', 'value': '2'}, {'name': 'проспект', 'value': '3'},
        {'name': 'микрорайон', 'value': '4'}, {'name': 'шоссе', 'value': '5'}, {'name': 'площадь', 'value': '6'},
        {'name': 'бульвар', 'value': '7'}, {'name': 'проезд', 'value': '8'}, {'name': 'в\\ч', 'value': '9'}
    ];


    $scope.cadet.addressData.cityOfPlaceOfBirthType = $scope.options.cityTypes[0].value;
    $scope.cadet.addressData.cityOfRegisteredAddressType = $scope.options.cityTypes[0].value;
    $scope.cadet.addressData.cityOfActualAddressType = $scope.options.cityTypes[0].value;


    $scope.cadet.addressData.streetOfRegisteredAddressType = $scope.options.streetTypes[0].value;
    $scope.cadet.addressData.streetOfActualAddressType = $scope.options.streetTypes[0].value;


    $scope.cadet.concussionsWereNot = false;
    $scope.setConcussionsWereNot = function (val) {
        $('.' + val + 'ConcussionsWereNot').removeClass('active');
        $('.' + !val + 'ConcussionsWereNot').removeClass('active');
        $('.' + val + 'ConcussionsWereNot').addClass('active');
        $scope.cadet.concussionsWereNot = val
    };

    $scope.cadet.traumaticBrainInjuryWasNot = false;
    $scope.setTraumaticBrainInjuryWasNot = function (val) {
        $('.' + val + 'TraumaticBrainInjuryWasNot').removeClass('active');
        $('.' + !val + 'TraumaticBrainInjuryWasNot').removeClass('active');
        $('.' + val + 'TraumaticBrainInjuryWasNot').addClass('active');
        $scope.cadet.traumaticBrainInjuryWasNot = val
    };

    $scope.cadet.theNarcologWasNot = false;
    $scope.setTheNarcologWasNot = function (val) {
        $('.' + val + 'TheNarcologWasNot').removeClass('active');
        $('.' + !val + 'TheNarcologWasNot').removeClass('active');
        $('.' + val + 'TheNarcologWasNot').addClass('active');
        $scope.cadet.theNarcologWasNot = val
    };

    $scope.cadet.thePsychiatristWasNot = false;
    $scope.setThePsychiatristWasNot = function (val) {
        $('.' + val + 'ThePsychiatristWasNot').removeClass('active');
        $('.' + !val + 'ThePsychiatristWasNot').removeClass('active');
        $('.' + val + 'ThePsychiatristWasNot').addClass('active');
        $scope.cadet.thePsychiatristWasNot = val
    };

    $scope.cadet.thoughtsOfSuicideDoesNotHave = false;
    $scope.setThoughtsOfSuicideDoesNotHave = function (val) {
        $('.' + val + 'ThoughtsOfSuicideDoesNotHave').removeClass('active');
        $('.' + !val + 'ThoughtsOfSuicideDoesNotHave').removeClass('active');
        $('.' + val + 'ThoughtsOfSuicideDoesNotHave').addClass('active');
        $scope.cadet.thoughtsOfSuicideDoesNotHave = val
    };

    $scope.cadet.suicideAttemptsDidNotCommit = false;
    $scope.setSuicideAttemptsDidNotCommit = function (val) {
        $('.' + val + 'SuicideAttemptsDidNotCommit').removeClass('active');
        $('.' + !val + 'SuicideAttemptsDidNotCommit').removeClass('active');
        $('.' + val + 'SuicideAttemptsDidNotCommit').addClass('active');
        $scope.cadet.suicideAttemptsDidNotCommit = val
    };

    $scope.cadet.administrativeOffenseDidNotCommit = false;
    $scope.setAdministrativeOffenseDidNotCommit = function (val) {
        $('.' + val + 'AdministrativeOffenseDidNotCommit').removeClass('active');
        $('.' + !val + 'AdministrativeOffenseDidNotCommit').removeClass('active');
        $('.' + val + 'AdministrativeOffenseDidNotCommit').addClass('active');
        $scope.cadet.administrativeOffenseDidNotCommit = val
    };

    $scope.cadet.policeRecordDoesNotHave = false;
    $scope.setPoliceRecordDoesNotHave = function (val) {
        $('.' + val + 'PoliceRecordDoesNotHave').removeClass('active');
        $('.' + !val + 'PoliceRecordDoesNotHave').removeClass('active');
        $('.' + val + 'PoliceRecordDoesNotHave').addClass('active');
        $scope.cadet.policeRecordDoesNotHave = val
    };

    $scope.cadet.criminalLiabilityWasNotInvolved = false;
    $scope.setCriminalLiabilityWasNotInvolved = function (val) {
        $('.' + val + 'CriminalLiabilityWasNotInvolved').removeClass('active');
        $('.' + !val + 'CriminalLiabilityWasNotInvolved').removeClass('active');
        $('.' + val + 'CriminalLiabilityWasNotInvolved').addClass('active');
        $scope.cadet.criminalLiabilityWasNotInvolved = val
    };

    $scope.cadet.relativesAndFriendsAbroad = false;
    $scope.setRelativesAndFriendsAbroad = function (val) {
        $('.' + val + 'RelativesAndFriendsAbroad').removeClass('active');
        $('.' + !val + 'RelativesAndFriendsAbroad').removeClass('active');
        $('.' + val + 'RelativesAndFriendsAbroad').addClass('active');
        $scope.cadet.relativesAndFriendsAbroad = val
    };

    $scope.showCustomReligion = function () {
        $('#customReligion').attr('style', '');
        $scope.cadet.customReligion = '';
    };

    $scope.hideCustomReligion = function () {
        $('#customReligion').attr('style', 'display: none');
        $scope.cadet.customReligion = '';
    };

    $scope.init = function () {

        $('#rootwizard').bootstrapWizard({
            tabClass: 'nav nav-pills',
            onNext: function (tab, navigation, index) {

            }
        });

        $('.next').removeClass("disabled").removeClass('hidden');

        loadSubjectsByIdAndType('subjectOfPlaceOfBirth', 'cityOfPlaceOfBirth', 1);
        loadSubjectsByIdAndType('subjectOfRegisteredAddress', 'cityOfRegisteredAddress', 1);
        loadSubjectsByIdAndType('subjectOfActualAddress', 'cityOfActualAddress', 1);

        $('#dateOfBirth').datepicker({
            language: 'ru'
        });
    };


/*    $scope.validationOpt = {
        rules: {
            faculty: {
                required: true,
                minlength: 3
            }
        }
    };*/


    $scope.clearData = function () {
        // $scope.company = {};
        // $scope.company.id = '';
        // $scope.company.companyName = '';
    };


    $scope.submit = function () {
        var $valid = angular.element('#cadetForm').valid(),
            $validator;
        if (!$valid) {
            alert('Проверьте данные формы');
        } else {
            $.post(
                "../json/saveProjectSettings",
                $.param($scope.cadet)
                , function (data) {
                    if (data.success == 0) {
                        alert("Обновлено");
                    }
                },
                "json"
            );
        }
    };

});