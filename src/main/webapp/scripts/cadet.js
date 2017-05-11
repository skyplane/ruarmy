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

var app = angular.module('cadetApp', []);

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
                if ($('#tab1').hasClass('active')) {
                    var $valid = angular.element('#cadetForm').valid(),
                        $validator;
                    if (!$valid) {
                        alert('Проверьте данные формы');
                        return false;
                    } else {
                        if ($scope.cadet.religion == "10"){
                            if ($scope.cadet.customReligion.length==""){
                                $('#customReligionLabel').text("Укажите религию");
                                return false;
                            } else {
                                $('#customReligionLabel').text("");
                            }
                        }

                    }
                }
                if ($('#tab2').hasClass('active')) {
                    var $valid = angular.element('#cadetForm').valid(),
                        $validator;
                    if (!$valid) {
                        alert('Проверьте данные формы');
                        return false;
                    } else {

                    }
                }
                if ($('#tab3').hasClass('active')) {
                    var $valid = angular.element('#cadetForm').valid(),
                        $validator;
                    if (!$valid) {
                        alert('Проверьте данные формы');
                        return false;
                    } else {

                    }
                }
                if ($('#tab4').hasClass('active')) {
                    var $valid = angular.element('#cadetForm').valid(),
                        $validator;
                    if (!$valid) {
                        alert('Проверьте данные формы');
                        return false;
                    } else {

                    }
                }
                if ($('#tab5').hasClass('active')) {
                    var $valid = angular.element('#cadetForm').valid(),
                        $validator;
                    if (!$valid) {
                        alert('Проверьте данные формы');
                        return false;
                    } else {
                        $('.finish').attr('style','');
                    }
                }

            }
        });

        $('.next').removeClass("disabled").removeClass('hidden');

        loadSubjectsByIdAndType('subjectOfPlaceOfBirth', 'cityOfPlaceOfBirth', 1);
        loadSubjectsByIdAndType('subjectOfRegisteredAddress', 'cityOfRegisteredAddress', 1);
        loadSubjectsByIdAndType('subjectOfActualAddress', 'cityOfActualAddress', 1);

        $('#dateOfBirth').datepicker({
            language: 'ru'
        });


        $.validator.addMethod("date", function (value, element) {
            return this.optional(element) || /^\d{1,2}\.\d{1,2}\.\d{4}$/.test(value);
        }, "Пожалуйста, введите дату в формате DD.MM.YYYY");

        $.validator.addMethod("phone", function (value, element) {
            return this.optional(element) || /^[0-9\-\(\)\s]+$/.test(value);
        }, "Номер телефона должен быть корректен.");

        $.validator.addMethod("valueNotEquals", function (value, element, arg) {
            return arg != value;
        }, "Выберите нужное значение");


        $("#cadetForm").validate({
            rules: {
                faculty: {
                    required: true,
                    minlength: 3
                },
                specialty: {
                    required: true,
                    minlength: 3
                },
                yearOfAdmission: {
                    required: true,
                    number: true,
                    minlength: 4,
                    maxlength: 4
                },
                militaryRank: {
                    valueNotEquals: "? undefined:undefined ?"
                },
                surname: {
                    required: true,
                    minlength: 3
                },
                name: {
                    required: true,
                    minlength: 3
                },
                patronymic: {
                    required: true,
                    minlength: 3
                },
                dateOfBirth: {
                    required: true,
                    date: true
                },
                passportNumber: {
                    required: true,
                    minlength: 3
                },
                militaryIdNumber: {
                    required: true,
                    minlength: 3
                },
                nationality: {
                    required: true,
                    minlength: 3
                },
                religion: {
                        valueNotEquals: "? undefined:undefined ?"
                },
                phone: {
                    required: true,
                    phone: true
                },
                unit: {
                    required: true
                },
                post: {
                    required: true,
                    minlength: 3
                },
                education: {
                    required: true,
                    minlength: 3
                },
                skills: {
                    required: true,
                    minlength: 3
                },
                drivingLicense: {
                    required: true,
                    minlength: 3
                },
                subjectOfPlaceOfBirth: {
                    required: true,
                    minlength: 3
                },
                cityOfPlaceOfBirth: {
                    required: true,
                    minlength: 3
                },
                subjectOfRegisteredAddress: {
                    required: true,
                    minlength: 3
                },
                cityOfRegisteredAddress: {
                    required: true,
                    minlength: 3
                },
                streetOfRegisteredAddress: {
                    required: true,
                    minlength: 3
                },
                subjectOfActualAddress: {
                    required: true,
                    minlength: 3
                },
                cityOfActualAddress: {
                    required: true,
                    minlength: 3
                },
                streetOfActualAddress: {
                    required: true,
                    minlength: 3
                },


                compositionOfFamily: {
                    valueNotEquals: "? undefined:undefined ?"
                },
                alcohol: {
                    valueNotEquals: "? undefined:undefined ?"
                },
                drugUse: {
                    valueNotEquals: "? undefined:undefined ?"
                },
                chronicDiseases: {
                    required: true,
                    minlength: 3
                },
                validityCategory: {
                    required: true,
                    minlength: 3
                }
            }
        });

    };



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
            var cadetOri = $scope.cadet;
            var cadet = withCsrfData(cadetOri);
            k=cadet;
            $.post(
                "../api/cadet/saveCadet",
                $.param(cadet)
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

var k;

function withCsrfData(param) {
    var csrfName = $('#csrfParameter').attr('name');
    var csrfValue = $('#csrfParameter').attr('value');
    param[csrfName] = csrfValue;
    return param;
};