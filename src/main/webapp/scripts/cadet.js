function loadSubjectsByIdAndType(subjectId, objectId, type) {
    $('#' + subjectId).autocomplete({
        serviceUrl: '/api/autocomplete/subjectByTerm?type=' + type,
        onSelect: function (subjectSuggestion) {
            $('#' + subjectId).change().keyup();
            $('#' + objectId).autocomplete({
                serviceUrl: '/api/autocomplete/cityByTerm?subjectId=' + subjectSuggestion.data,
                onSelect: function (suggestion) {
                    $('#' + objectId).change().keyup();
                }
            });
        }
    });
}

var k;
var kd;


var app = angular.module('cadetApp', ["checklist-model"]);


app.directive('uiPassport', function () {
    return {
        require: '?ngModel',
        link: function ($scope, element, attrs, controller) {
            element.mask("0000 000000");
        }
    };
});

app.directive('uiYear', function () {
    return {
        require: '?ngModel',
        link: function ($scope, element, attrs, controller) {
            element.mask("0000");
        }
    };
});

app.directive('uiIndex', function () {
    return {
        require: '?ngModel',
        link: function ($scope, element, attrs, controller) {
            element.mask("000000");
        }
    };
});

app.directive('uiMilitaryTicket', function () {
    return {
        require: '?ngModel',
        link: function ($scope, element, attrs, controller) {
            element.mask(
                'MM 0000000', {
                    translation: {
                        'M': {
                            pattern: /[А-Я]/, optional: false
                        }
                    },
                    placeholder: "** *******"
                });
        }
    };
});
app.directive('uiPhone', function () {
    return {
        require: '?ngModel',
        link: function ($scope, element, attrs, controller) {
            element.mask("+7(Z00)000-0000", {
                translation: {
                    'Z': {
                        pattern: /[9]/
                    }
                }
            });
        }
    };
});


app.controller('cadetCtrl', function ($scope, $filter) {


    $scope.cadet = {};
    $scope.options = {};

    $scope.cadet.totalInformation = {};
    $scope.cadet.addressData = {};
    $scope.cadet.addressData.birthData = {};
    $scope.cadet.addressData.registeredData = {};
    $scope.cadet.addressData.actualData = {};

    $scope.cadet.educationAndSkills = {};
    $scope.cadet.educationAndSkills.skills = [];
    $scope.cadet.educationAndSkills.educations = [];
    $scope.cadet.educationAndSkills.foreignLanguages = [];
    $scope.cadet.educationAndSkills.driversLicenses = [];

    $scope.cadet.familyComposition = {};
    $scope.cadet.familyComposition.familyMembers = [];

    $scope.cadet.behavior = {};
    $scope.cadet.health = {};

    $scope.cadet.tripsAbroad = [];


    initTotalInformation($scope);
    initEducationAndSkills($scope, $filter);
    initAddressData($scope);

    $scope.cadet.addressData.birthData.subjectOfPlaceOfBirthType="1";
    $scope.cadet.addressData.birthData.cityOfPlaceOfBirthType="1";
    loadSubjectsByIdAndType('subjectOfPlaceOfBirth', 'cityOfPlaceOfBirth', 1);

    $scope.cadet.addressData.registeredData.subjectOfRegisteredAddressType="1";
    loadSubjectsByIdAndType('subjectOfRegisteredAddress', 'cityOfRegisteredAddress', 1);
    $scope.cadet.addressData.registeredData.cityOfRegisteredAddressType="1";
    $scope.cadet.addressData.registeredData.streetOfRegisteredAddressType="1";

    $scope.cadet.addressData.actualData.subjectOfActualAddressType="1";
    loadSubjectsByIdAndType('subjectOfActualAddress', 'cityOfActualAddress', 1);;
    $scope.cadet.addressData.actualData.cityOfActualAddressType="1";
    $scope.cadet.addressData.actualData.streetOfActualAddressType="1";

    initFamilyComposition($scope, $filter);
    initHealth($scope);
    initBehavior($scope);
    initTripsAbroad($scope);
    initAdditionally($scope);


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
                        if ($scope.cadet.totalInformation.religion == "10") {
                            if ($scope.cadet.totalInformation.customReligion.length == "") {
                                $('#customReligionLabel').text("Укажите религию");
                                return false;
                            } else {
                                $('#customReligionLabel').text("");
                            }
                        }

                    }

                }
                if ($('#tab5').hasClass('active')) {
                    var $valid = angular.element('#cadetForm').valid(),
                        $validator;
                    if (!$valid) {
                        alert('Проверьте данные формы');
                        return false;
                    } else {

                    }
                }
                if ($('#tab6').hasClass('active')) {
                    var $valid = angular.element('#cadetForm').valid(),
                        $validator;
                    if (!$valid) {
                        alert('Проверьте данные формы');
                        return false;
                    } else {

                    }
                }
                if ($('#tab7').hasClass('active')) {


                    if ($scope.cadet.familyComposition.compositionOfFamily == undefined) {
                        alert('Проверьте данные формы');
                        return false;
                    }
                    if ($scope.cadet.familyComposition.married == undefined) {
                        alert('Проверьте данные формы');
                        return false;
                    }
                    if ($scope.cadet.familyComposition.marrieds == undefined) {
                        alert('Проверьте данные формы');
                        return false;
                    }


                    if ($scope.cadet.familyComposition.compositionOfFamily == 2 && $scope.cadet.familyComposition.withoutFather == undefined) {
                        alert('Проверьте данные формы');
                        return false;
                    }
                    if ($scope.cadet.familyComposition.compositionOfFamily == 3 && $scope.cadet.familyComposition.withoutMother == undefined) {
                        alert('Проверьте данные формы');
                        return false;
                    }


                    if ($scope.cadet.familyComposition.compositionOfFamily == 2 || $scope.cadet.familyComposition.compositionOfFamily == 3) {
                        if (($scope.cadet.familyComposition.withoutFather == 1 || $scope.cadet.familyComposition.withoutFather == 2)
                            && $scope.cadet.familyComposition.fatherExist == null) {
                            alert('Проверьте данные формы');
                            return false;
                        }
                        if (($scope.cadet.familyComposition.withoutMother == 1 || $scope.cadet.familyComposition.withoutMother == 2)
                            && $scope.cadet.familyComposition.motherExist == null) {
                            alert('Проверьте данные формы');
                            return false;
                        }
                    }

                }
                if ($('#tab8').hasClass('active')) {
                    var $valid = angular.element('#cadetForm').valid(),
                        $validator;
                    if (!$valid) {
                        alert('Проверьте данные формы');
                        return false;
                    } else {
                        $('.finish').attr('style', '');
                    }

                    if ($scope.cadet.health.concussionsWereNot == null) {
                        alert('Проверьте данные формы');
                        return false;
                    }
                    if ($scope.cadet.health.traumaticBrainInjuryWasNot == null) {
                        alert('Проверьте данные формы');
                        return false;
                    }
                    if ($scope.cadet.health.theNarcologWasNot == null) {
                        alert('Проверьте данные формы');
                        return false;
                    }
                    if ($scope.cadet.health.thePsychiatristWasNot == null) {
                        alert('Проверьте данные формы');
                        return false;
                    }
                    if ($scope.cadet.health.validityCategory == null) {
                        alert('Проверьте данные формы');
                        return false;
                    }

                }
                if ($('#tab9').hasClass('active')) {

                    if ($scope.cadet.behavior.thoughtsOfSuicideDoesNotHave == null) {
                        alert('Проверьте данные формы');
                        return false;
                    }
                    if ($scope.cadet.behavior.suicideAttemptsDidNotCommit == null) {
                        alert('Проверьте данные формы');
                        return false;
                    }
                    if ($scope.cadet.behavior.administrativeOffenseDidNotCommit == null) {
                        alert('Проверьте данные формы');
                        return false;
                    }
                    if ($scope.cadet.behavior.policeRecordDoesNotHave == null) {
                        alert('Проверьте данные формы');
                        return false;
                    }
                    if ($scope.cadet.behavior.criminalLiabilityWasNotInvolved == null) {
                        alert('Проверьте данные формы');
                        return false;
                    }

                }
            }
        });

        $('.next').removeClass("disabled").removeClass('hidden');

        $('#dateOfBirth').datepicker({
            language: 'ru'
        });





        $("#cadetForm").validate({
            rules: {
                faculty: {
                    required: true,
                    minlength: 3
                },
                speciality: {
                    required: true,
                    minlength: 3
                },
                yearOfAdmission: {
                    required: true,
                    year: true
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
                    passportNumber: true
                },
                militaryIdNumber: {
                    required: true,
                    militaryId: true,
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
                division: {
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
                indexOfRegisteredAddress: {
                    required: false,
                    postIndex: true
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
                indexOfActualAddress: {
                    required: false,
                    postIndex: true
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
                }
            }
        });

    };

/*

    $scope.textByFamilyMemberType = function (type) {
        if (type == "1")
            return "мать";
        if (type == "2")
            return "отец";
        if (type == "3")
            return "мачеха";
        if (type == "4")
            return "отчим";
        if (type == "5")
            return "опекун";
        if (type == "6")
            return "брат";
        if (type == "7")
            return "сестра";
        if (type == "8")
            return "жена";
        if (type == "9")
            return "сын";
        if (type == "10")
            return "дочь";
    };


    $scope.compositionOfFamily = function () {
        if (Number($scope.cadet.compositionOfFamily) == 1) {
            $('#withoutFatherId').attr('style', 'display: none');
            $('#withoutMotherId').attr('style', 'display: none');
            $('#hasInformationAboutParentsId').attr('style', 'display: none');
        }
        if (Number($scope.cadet.compositionOfFamily) == 2) {
            $('#withoutMotherId').attr('style', 'display: none');
            $('#withoutFatherId').attr('style', '');


            $('#hasInformationAboutParentsId').attr('style', 'display: none');
        }
        if (Number($scope.cadet.compositionOfFamily) == 3) {
            $('#withoutFatherId').attr('style', 'display: none');
            $('#withoutMotherId').attr('style', '');
            $('#hasInformationAboutParentsId').attr('style', 'display: none');
        }
        if (Number($scope.cadet.compositionOfFamily) == 4) {
            $('#withoutFatherId').attr('style', 'display: none');
            $('#withoutMotherId').attr('style', 'display: none');
            $('#hasInformationAboutParentsId').attr('style', '');
        }
    };

    $scope.clearData = function () {
        // $scope.company = {};
        // $scope.company.id = '';
        // $scope.company.companyName = '';
    };

*/

    $scope.submit = function () {
        /*var $valid = angular.element('#cadetForm').valid(),
         $validator;
         if (!$valid) {
         alert('Проверьте данные формы');
         } else {*/

        var cadetOri = jQuery.extend(true, {}, $scope.cadet);
        var cadet = withCsrfData(cadetOri);
        cadet['driversLicenses'] = cadetOri.educationAndSkills.driversLicenses;
        cadet['validityCategory'] = cadetOri.health.validityCategory;
        cadet['division'] = cadetOri.totalInformation.division;
        cadet['skills'] = cadetOri.educationAndSkills.skills;


        var tripsAbroads_who = [];
        var tripsAbroads_firstName = [];
        var tripsAbroads_lastName = [];
        var tripsAbroads_patronymic = [];
        var tripsAbroads_country = [];
        var tripsAbroads_doMaintainARelationship = [];
        $.each(cadet.tripsAbroad, function () {
            tripsAbroads_who.push(this.who);
            tripsAbroads_firstName.push(this.firstName);
            tripsAbroads_lastName.push(this.lastName);
            tripsAbroads_patronymic.push(this.patronymic);
            tripsAbroads_country.push(this.country);
            tripsAbroads_doMaintainARelationship.push(this.doMaintainARelationship);
        });
        cadet['tripsAbroads_who'] = tripsAbroads_who;
        cadet['tripsAbroads_firstName'] = tripsAbroads_firstName;
        cadet['tripsAbroads_lastName'] = tripsAbroads_lastName;
        cadet['tripsAbroads_patronymic'] = tripsAbroads_patronymic;
        cadet['tripsAbroads_country'] = tripsAbroads_country;
        cadet['tripsAbroads_doMaintainARelationship'] = tripsAbroads_doMaintainARelationship;
        cadet.tripsAbroad = [];

        var familyMembers_type = [];
        var familyMembers_firstName = [];
        var familyMembers_lastName = [];
        var familyMembers_patronymic = [];
        var familyMembers_dateOfBirth = [];
        var familyMembers_occupation = [];
        var familyMembers_phone = [];
        var familyMembers_wasTreatedForAlcoholism = [];
        var familyMembers_wasTreatedForAddiction = [];
        var familyMembers_hasACriminalRecord = [];
        var familyMembers_hasAMentalIllness = [];
        var familyMembers_hasSuicideAttempts = [];
        var familyMembers_hasADisability = [];
        var familyMembers_hasDied = [];
        var familyMembers_isBroughtUpSeparately = [];
        var familyMembers_hasDiedCause = [];
        var familyMembers_hasDiedPlace = [];
        var familyMembers_hasDiedYear = [];
        var familyMembers_hasAMentalIllnessName = [];
        var familyMembers_hasACriminalRecordDetails = [];
        $.each(cadet.familyComposition.familyMembers, function () {
            familyMembers_type.push(this.familyMemberType);
            familyMembers_firstName.push(this.firstName);
            familyMembers_lastName.push(this.lastName);
            familyMembers_patronymic.push(this.patronymic);
            familyMembers_dateOfBirth.push(this.dateOfBirth);
            familyMembers_occupation.push(this.occupation);
            familyMembers_phone.push(this.phone);
            familyMembers_wasTreatedForAlcoholism.push(this.wasTreatedForAlcoholism);
            familyMembers_wasTreatedForAddiction.push(this.wasTreatedForAddiction);
            familyMembers_hasACriminalRecord.push(this.hasACriminalRecord);
            familyMembers_hasAMentalIllness.push(this.hasAMentalIllness);
            familyMembers_hasSuicideAttempts.push(this.hasSuicideAttempts);
            familyMembers_hasADisability.push(this.hasADisability);
            familyMembers_hasDied.push(this.hasDied);

            if (this.isBroughtUpSeparately == null) {
                familyMembers_isBroughtUpSeparately.push(false);
            } else {
                familyMembers_isBroughtUpSeparately.push(this.isBroughtUpSeparately);
            }
            if (this.hasDiedCause == null || this.hasDiedPlace == '') {
                familyMembers_hasDiedCause.push(' ');
            } else {
                familyMembers_hasDiedCause.push(this.hasDiedCause);
            }

            if (this.hasDiedPlace == null || this.hasDiedPlace == '') {
                familyMembers_hasDiedPlace.push(' ');
            } else {
                familyMembers_hasDiedPlace.push(this.hasDiedPlace);
            }
            if (this.hasDiedYear == null || this.hasDiedYear == '') {
                familyMembers_hasDiedYear.push(' ');
            } else {
                familyMembers_hasDiedYear.push(this.hasDiedYear);
            }
            if (this.hasAMentalIllnessName == null  || this.hasAMentalIllnessName == '') {
                familyMembers_hasAMentalIllnessName.push(' ');
            } else {
                familyMembers_hasAMentalIllnessName.push(this.hasAMentalIllnessName);
            }
            if (this.hasACriminalRecordDetails == null || this.hasACriminalRecordDetails == '') {
                familyMembers_hasACriminalRecordDetails.push(' ');
            } else {
                familyMembers_hasACriminalRecordDetails.push(this.hasACriminalRecordDetails);
            }
        });
        cadet['familyMembers_type'] = familyMembers_type;
        cadet['familyMembers_firstName'] = familyMembers_firstName;
        cadet['familyMembers_lastName'] = familyMembers_lastName;
        cadet['familyMembers_patronymic'] = familyMembers_patronymic;
        cadet['familyMembers_dateOfBirth'] = familyMembers_dateOfBirth;
        cadet['familyMembers_occupation'] = familyMembers_occupation;
        cadet['familyMembers_phone'] = familyMembers_phone;
        cadet['familyMembers_wasTreatedForAlcoholism'] = familyMembers_wasTreatedForAlcoholism;
        cadet['familyMembers_wasTreatedForAddiction'] = familyMembers_wasTreatedForAddiction;
        cadet['familyMembers_hasACriminalRecord'] = familyMembers_hasACriminalRecord;
        cadet['familyMembers_hasAMentalIllness'] = familyMembers_hasAMentalIllness;
        cadet['familyMembers_hasSuicideAttempts'] = familyMembers_hasSuicideAttempts;
        cadet['familyMembers_hasADisability'] = familyMembers_hasADisability;
        cadet['familyMembers_hasDied'] = familyMembers_hasDied;
        cadet['familyMembers_isBroughtUpSeparately'] = familyMembers_isBroughtUpSeparately;
        cadet['familyMembers_hasDiedCause'] = familyMembers_hasDiedCause;
        cadet['familyMembers_hasDiedPlace'] = familyMembers_hasDiedPlace;
        cadet['familyMembers_hasDiedYear'] = familyMembers_hasDiedYear;
        cadet['familyMembers_hasAMentalIllnessName'] = familyMembers_hasAMentalIllnessName;
        cadet['familyMembers_hasACriminalRecordDetails'] = familyMembers_hasACriminalRecordDetails;
        cadet.familyComposition.familyMembers = [];

        var educations_institutionType = [];
        var educations_institutionName = [];
        var educations_speciality = [];
        var educations_yearOfEnding = [];
        var educations_unfinished = [];
        var educations_highAchiever = [];
        var educations_redDiploma = [];
        $.each(cadet.educationAndSkills.educations, function () {
            educations_institutionType.push(this.institutionType);
            if (this.institutionName == null) {
                educations_institutionName.push('');
            } else {
                educations_institutionName.push(this.institutionName);
            }
            if (this.speciality == null) {
                educations_speciality.push('');
            } else {
                educations_speciality.push(this.speciality.replace(',', '||comma||'));
            }
            if (this.yearOfEnding == null) {
                educations_yearOfEnding.push(0);
            } else {
                educations_yearOfEnding.push(this.yearOfEnding);
            }
            if (this.unfinished == null) {
                educations_unfinished.push(false);
            } else {
                educations_unfinished.push(this.unfinished);
            }
            if (this.highAchiever == null) {
                educations_highAchiever.push(false);
            } else {
                educations_highAchiever.push(this.highAchiever);
            }
            if (this.redDiploma == null) {
                educations_redDiploma.push(false);
            } else {
                educations_redDiploma.push(this.redDiploma);
            }
        });
        cadet['educations_institutionType'] = educations_institutionType;
        cadet['educations_institutionName'] = educations_institutionName;
        cadet['educations_speciality'] = educations_speciality;
        cadet['educations_yearOfEnding'] = educations_yearOfEnding;
        cadet['educations_unfinished'] = educations_unfinished;
        cadet['educations_highAchiever'] = educations_highAchiever;
        cadet['educations_redDiploma'] = educations_redDiploma;
        cadet.educationAndSkills.educations = [];


        var foreignLanguages_language = [];
        var foreignLanguages_level = [];
        $.each(cadet.educationAndSkills.foreignLanguages, function () {
            foreignLanguages_language.push(this.language);
            foreignLanguages_level.push(this.level);
        });
        cadet['foreignLanguages_language'] = foreignLanguages_language;
        cadet['foreignLanguages_level'] = foreignLanguages_level;
        cadet.educationAndSkills.foreignLanguages = [];

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
        //}
    };

});


function withCsrfData(param) {
    var csrfName = $('#csrfParameter').attr('name');
    var csrfValue = $('#csrfParameter').attr('value');
    param[csrfName] = csrfValue;
    return param;
};