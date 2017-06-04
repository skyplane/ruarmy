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

var app = angular.module('cadetApp', ["checklist-model"]);

app.directive('uiPassport', function () {
    return {
        require: '?ngModel',
        link: function ($scope, element, attrs, controller) {
            element.mask("0000 000000");
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


app.controller('cadetCtrl', function ($scope) {


    $scope.cadet = {};
    $scope.options = {};


    $scope.driversLicensesAll = ['M', 'A', 'B', 'C', 'D', 'A1', 'B1', 'C1', 'D1', 'BE', 'CE', 'DE', 'C1E', 'D1E'];
    $scope.driversLicenses = [];


    $scope.division = {};
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


    $('#tripsAbroadCountry').autocomplete({
        serviceUrl: '/api/autocomplete/countries',
        onSelect: function (countrySuggestion) {
            $('#tripsAbroadCountry').change().keyup();
        }
    });


    $scope.tripsAbroad = {
        who: '',
        firstName: '',
        lastName: '',
        patronymic: '',
        country: '',
        doMaintainARelationship: null
    };
    $scope.cadet.tripsAbroads = [];

    $scope.tripsAbroadIndex = 0;
    $scope.addTripsAbroad = function () {
        $scope.cadet.tripsAbroads.push({
            who: '',
            firstName: '',
            lastName: '',
            patronymic: '',
            country: '',
            doMaintainARelationship: null
        });
        $scope.tripsAbroadIndex = $scope.cadet.tripsAbroads.length - 1;
        $scope.tripsAbroad = $scope.cadet.tripsAbroads[$scope.cadet.tripsAbroads.length - 1];
        $scope.setDoMaintainARelationShip($scope.tripsAbroad.doMaintainARelationship);
        $('#tripsAbroadModal').modal('show');
    };

    $scope.editTripsAbroad = function (index) {
        $scope.tripsAbroadIndex = index;
        $scope.tripsAbroad = $scope.cadet.tripsAbroads[index];
        $scope.setDoMaintainARelationShip($scope.tripsAbroad.doMaintainARelationship);
        $('#tripsAbroadModal').modal('show');
    };
    $scope.removeTripsAbroad = function (index) {
        $scope.cadet.tripsAbroads.splice(index, 1);
    };
    $scope.saveTripsAbroad = function () {
        k = $scope.tripsAbroad.country;
        $scope.cadet.tripsAbroads[$scope.tripsAbroadIndex] = $scope.tripsAbroad;
        $('#tripsAbroadModal').modal('hide');
    };

    $scope.systemSkills = [];
    $scope.skills = [];
    $scope.actualSkills = [];


    $scope.cadet.addressData = {};

    $scope.selectedFieldOfActivityCategory = 1;

    $scope.skillsTextByFoa1 = '';
    $scope.skillsTextByFoa2 = '';
    $scope.skillsTextByFoa3 = '';
    $scope.skillsTextByFoa4 = '';

    $scope.getSkillsTextByFoa = function (val) {
        var str = '';

        k = $scope.systemSkills;

        $.each($scope.skills, function () {
            var skVal = this;
            $.each($scope.systemSkills, function () {
                if (this.foa == val && this.id == skVal) {
                    str += this.name + ', ';
                }
            });
        });
        if (str == '') {
            return 'не определён';
        } else {
            return str.substr(0, str.length - 2);
        }
    };

    $scope.loadSkillsByFoaTimer = function () {
        setTimeout(function () {
            $scope.loadSkillsByFoa();
            $scope.loadSkillsByFoaTimer();
        }, 5000);
    };
    $scope.loadSkillsByFoa = function () {
        $scope.skillsTextByFoa1 = $scope.getSkillsTextByFoa(1);
        $scope.skillsTextByFoa2 = $scope.getSkillsTextByFoa(2);
        $scope.skillsTextByFoa3 = $scope.getSkillsTextByFoa(3);
        $scope.skillsTextByFoa4 = $scope.getSkillsTextByFoa(4);
    };

    $scope.loadSkillsByFoa();
    $scope.loadSkillsByFoaTimer();

    $scope.skillsRunByFieldOfActivity = function (val) {
        $.get(
            "../api/skill/loadByFieldOfActivity?fieldOfActivity=" + val
            , function (json) {
                $scope.$apply(function () {
                    $.each(json.data, function () {
                        $scope.systemSkills.push({id: this.id, name: this.name, foa: val});
                    });
                });
            },
            "json"
        );
    };

    $scope.skillsRunByFieldOfActivity(1);
    $scope.skillsRunByFieldOfActivity(2);
    $scope.skillsRunByFieldOfActivity(3);
    $scope.skillsRunByFieldOfActivity(4);

    $scope.skillsByFieldOfActivity = function (val) {
        $('#skillsModal').modal('show');
        $scope.selectedFieldOfActivityCategory = val;
        $.get(
            "../api/skill/loadByFieldOfActivity?fieldOfActivity=" + $scope.selectedFieldOfActivityCategory
            , function (json) {
                $scope.$apply(function () {
                    $scope.actualSkills = [];
                    $.each(json.data, function () {
                        $scope.actualSkills.push({id: this.id, name: this.name, foa: val});
                    });
                });
            },
            "json"
        );
    };


    $scope.familyMember = {};
    $scope.cadet.familyMembers = [];

    $scope.education = {};
    $scope.cadet.educations = [];

    $scope.cadet.foreignLanguages = [];

    $scope.cadet.addressData.subjectOfRegisteredAddressType = '1';
    $scope.cadet.addressData.subjectOfActualAddressType = '1';
    $scope.cadet.addressData.houseOfRegisteredAddress = '';
    $scope.cadet.addressData.buildingOfRegisteredAddress = '';
    $scope.cadet.addressData.apartmentOfRegisteredAddress = '';
    $scope.cadet.addressData.indexOfRegisteredAddress = '';


    $scope.updateActualAddressByRegistered = function () {
        $scope.cadet.addressData.subjectOfActualdAddressType = $scope.cadet.addressData.subjectOfRegisteredAddressType;
        $scope.cadet.addressData.subjectOfActualAddress = $('#subjectOfRegisteredAddress').val();
        $scope.cadet.addressData.cityOfActualAddressType = $scope.cadet.addressData.cityOfRegisteredAddressType;
        $scope.cadet.addressData.cityOfActualAddress = $('#cityOfRegisteredAddress').val();
        $scope.cadet.addressData.streetOfActualAddressType = $scope.cadet.addressData.streetOfRegisteredAddressType;
        $scope.cadet.addressData.streetOfActualAddress = $scope.cadet.addressData.streetOfRegisteredAddress;
        $scope.cadet.addressData.houseOfActualAddress = $scope.cadet.addressData.houseOfRegisteredAddress;
        $scope.cadet.addressData.buildingOfActualAddress = $scope.cadet.addressData.buildingOfRegisteredAddress;
        $scope.cadet.addressData.apartmentOfActualAddress = $scope.cadet.addressData.apartmentOfRegisteredAddress;
        $scope.cadet.addressData.indexOfActualAddress = $scope.cadet.addressData.indexOfRegisteredAddress;
    };


    $scope.clearFamilyMember = function () {
        $scope.familyMember = {
            firstName: '',
            lastName: '',
            patronymic: '',
            dateOfBirth: '',
            occupation: '',
            phone: '',
            wasTreatedForAlcoholism: null,
            wasTreatedForAddiction: null,
            hasACriminalRecord: null,
            hasAMentalIllness: null,
            hasSuicideAttempts: null,
            hasADisability: null,
            hasDied: null,
            isBroughtUpSeparately: null
        };
    };

    $scope.clearFamilyMember();

    $scope.familyMemberIndex = 0;
    $scope.addFamilyMember = function () {
        $scope.cadet.familyMembers.push({
            firstName: '',
            lastName: '',
            patronymic: '',
            dateOfBirth: '',
            occupation: '',
            phone: '',
            wasTreatedForAlcoholism: null,
            wasTreatedForAddiction: null,
            hasACriminalRecord: null,
            hasAMentalIllness: null,
            hasSuicideAttempts: null,
            hasADisability: null,
            hasDied: null,
            isBroughtUpSeparately: null
        });
        $scope.familyMemberIndex = $scope.cadet.familyMembers.length - 1;
        $scope.familyMember = $scope.cadet.familyMembers[$scope.cadet.familyMembers.length - 1];
        $scope.setFamilyMemberWasTreatedForAlcoholism($scope.familyMember.wasTreatedForAlcoholism);
        $scope.setFamilyMemberWasTreatedForAddiction($scope.familyMember.wasTreatedForAddiction);
        $scope.setFamilyMemberHasACriminalRecord($scope.familyMember.hasACriminalRecord);
        $scope.setFamilyMemberHasAMentalIllness($scope.familyMember.hasAMentalIllness);
        $scope.setFamilyMemberHasSuicideAttempts($scope.familyMember.hasSuicideAttempts);
        $scope.setFamilyMemberHasADisability($scope.familyMember.hasADisability);
        $scope.setFamilyMemberHasDied($scope.familyMember.hasDied);
        $scope.setFamilyMemberIsBroughtUpSeparately($scope.familyMember.isBroughtUpSeparately);
        $('#familyMemberModal').modal('show');
        $('#familyMemberDateOfBirth').datepicker({
            language: 'ru'
        });
    };
    $scope.editFamilyMember = function (index) {
        $scope.familyMemberIndex = index;
        $scope.familyMember = $scope.cadet.familyMembers[index];
        $scope.setFamilyMemberWasTreatedForAlcoholism($scope.familyMember.wasTreatedForAlcoholism);
        $scope.setFamilyMemberWasTreatedForAddiction($scope.familyMember.wasTreatedForAddiction);
        $scope.setFamilyMemberHasACriminalRecord($scope.familyMember.hasACriminalRecord);
        $scope.setFamilyMemberHasAMentalIllness($scope.familyMember.hasAMentalIllness);
        $scope.setFamilyMemberHasSuicideAttempts($scope.familyMember.hasSuicideAttempts);
        $scope.setFamilyMemberHasADisability($scope.familyMember.hasADisability);
        $scope.setFamilyMemberHasDied($scope.familyMember.hasDied);
        $('#familyMemberModal').modal('show');
        $('#familyMemberDateOfBirth').datepicker({
            language: 'ru'
        });
    };
    $scope.saveFamilyMember = function () {
        $scope.cadet.familyMembers[$scope.familyMemberIndex] = $scope.familyMember;
        $('#familyMemberModal').modal('hide');
    };
    $scope.removeFamilyMember = function (index) {
        $scope.cadet.familyMembers.splice(index, 1);
    };


    $scope.educationIndex = 0;
    $scope.addEducation = function () {
        $scope.cadet.educations.push({
            institutionType: '',
            institutionName: '',
            specialty: '',
            yearOfEnding: '',
            unfinished: null,
            highAchiever: null,
            redDiploma: null
        });
        $scope.educationIndex = $scope.cadet.educations.length - 1;
        $scope.education = $scope.cadet.educations[$scope.cadet.educations.length - 1];
        $scope.setEducationUnfinished($scope.education.unfinished);
        $scope.setEducationHighAchiever($scope.education.highAchiever);
        $scope.setEducationRedDiploma($scope.education.redDiploma);
        $('#educationModal').modal('show');
    };
    $scope.editEducation = function (index) {
        $scope.educationIndex = index;
        $scope.education = $scope.cadet.educations[index];
        $scope.setEducationUnfinished($scope.education.unfinished);
        $scope.setEducationHighAchiever($scope.education.highAchiever);
        $scope.setEducationRedDiploma($scope.education.redDiploma);
        $('#educationModal').modal('show');
    };
    $scope.removeEducation = function (index) {
        $scope.cadet.educations.splice(index, 1);
    };
    $scope.saveEducation = function () {
        $scope.cadet.educations[$scope.educationIndex] = $scope.education;
        $('#educationModal').modal('hide');
    };

    $scope.addForeignLanguage = function () {
        $scope.cadet.foreignLanguages.push({
            language: 1,
            level: 1
        });
    };
    $scope.removeForeignLanguage = function (index) {
        $scope.cadet.foreignLanguages.splice(index, 1);
    };

    $scope.changeInstitutionType = function () {
        if (Number($scope.education.institutionType) < 5) {
            $('#highAchieverDiv').attr('style', 'display:none');
            $('#redDiplomaDiv').attr('style', '');
            $('#unfinishedDiv').attr('style', '');
            $('#notSchoolEducationDiv').attr('style', '');
            $scope.setEducationHighAchiever(null);
        } else {
            $('#redDiplomaDiv').attr('style', 'display:none');
            $('#highAchieverDiv').attr('style', 'display:none');
            $('#unfinishedDiv').attr('style', 'display:none');
            $('#notSchoolEducationDiv').attr('style', 'display:none');
            $scope.setEducationRedDiploma(null);
        }
    };

    $scope.toggleHasACriminalRecord = function () {
        if ($scope.familyMember.hasACriminalRecord) {
            $('.hasACriminalRecordClass').attr('style', '');
        } else {
            $('.hasACriminalRecordClass').attr('style', 'display:none');
        }
    };

    $scope.toggleHasAMentalIllnessClass = function () {
        if ($scope.familyMember.hasAMentalIllness) {
            $('.hasAMentalIllnessClass').attr('style', '');
        } else {
            $('.hasAMentalIllnessClass').attr('style', 'display:none');
        }
    };

    $scope.toggleHasDied = function () {
        if ($scope.familyMember.hasDied) {
            $('.hasDiedClass').attr('style', '');
        } else {
            $('.hasDiedClass').attr('style', 'display:none');
        }
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

    $scope.toggleWithCustomItem = function (item, val) {
        if (val == null) {
            $('.' + false + item).removeClass('active').removeClass('btn-primary').removeClass('btn-default')
                .addClass('btn-default');
            $('.' + true + item).removeClass('active').removeClass('btn-primary').removeClass('btn-default')
                .addClass('btn-default');
        } else {
            $('.' + !val + item).removeClass('active').removeClass('btn-primary').removeClass('btn-default')
                .addClass('btn-default');
            $('.' + val + item).removeClass('active').removeClass('btn-primary').removeClass('btn-default').addClass('active').addClass('btn-primary');
        }
    };

    $scope.cadet.concussionsWereNot = null;
    $scope.setConcussionsWereNot = function (val) {
        $scope.toggleWithCustomItem('ConcussionsWereNot', val);
        $scope.cadet.concussionsWereNot = val;
    };

    $scope.cadet.traumaticBrainInjuryWasNot = null;
    $scope.setTraumaticBrainInjuryWasNot = function (val) {
        $scope.toggleWithCustomItem('TraumaticBrainInjuryWasNot', val);
        $scope.cadet.traumaticBrainInjuryWasNot = val;
    };

    $scope.cadet.theNarcologWasNot = null;
    $scope.setTheNarcologWasNot = function (val) {
        $scope.toggleWithCustomItem('TheNarcologWasNot', val);
        $scope.cadet.theNarcologWasNot = val;
    };

    $scope.cadet.thePsychiatristWasNot = null;
    $scope.setThePsychiatristWasNot = function (val) {
        $scope.toggleWithCustomItem('ThePsychiatristWasNot', val);
        $scope.cadet.thePsychiatristWasNot = val;
    };

    $scope.cadet.thoughtsOfSuicideDoesNotHave = null;
    $scope.setThoughtsOfSuicideDoesNotHave = function (val) {
        $scope.toggleWithCustomItem('ThoughtsOfSuicideDoesNotHave', val);
        $scope.cadet.thoughtsOfSuicideDoesNotHave = val;
    };

    $scope.cadet.suicideAttemptsDidNotCommit = null;
    $scope.setSuicideAttemptsDidNotCommit = function (val) {
        $scope.toggleWithCustomItem('SuicideAttemptsDidNotCommit', val);
        $scope.cadet.suicideAttemptsDidNotCommit = val;
    };

    $scope.cadet.administrativeOffenseDidNotCommit = null;
    $scope.setAdministrativeOffenseDidNotCommit = function (val) {
        $scope.toggleWithCustomItem('AdministrativeOffenseDidNotCommit', val);
        $scope.cadet.administrativeOffenseDidNotCommit = val;
    };

    $scope.cadet.policeRecordDoesNotHave = null;
    $scope.setPoliceRecordDoesNotHave = function (val) {
        $scope.toggleWithCustomItem('PoliceRecordDoesNotHave', val);
        $scope.cadet.policeRecordDoesNotHave = val;
    };

    $scope.cadet.criminalLiabilityWasNotInvolved = null;
    $scope.setCriminalLiabilityWasNotInvolved = function (val) {
        $scope.toggleWithCustomItem('CriminalLiabilityWasNotInvolved', val);
        $scope.cadet.criminalLiabilityWasNotInvolved = val;
    };

    $scope.cadet.relativesAndFriendsAbroad = null;
    $scope.setRelativesAndFriendsAbroad = function (val) {
        $scope.toggleWithCustomItem('RelativesAndFriendsAbroad', val);
        $scope.cadet.relativesAndFriendsAbroad = val;
    };


    $scope.familyMember.wasTreatedForAlcoholism = null;
    $scope.setFamilyMemberWasTreatedForAlcoholism = function (val) {
        $scope.toggleWithCustomItem('FamilyMemberWasTreatedForAlcoholism', val);
        $scope.familyMember.wasTreatedForAlcoholism = val;
    };

    $scope.familyMember.wasTreatedForAddiction = null;
    $scope.setFamilyMemberWasTreatedForAddiction = function (val) {
        $scope.toggleWithCustomItem('FamilyMemberWasTreatedForAddiction', val);
        $scope.familyMember.wasTreatedForAddiction = val;
    };

    $scope.familyMember.hasACriminalRecord = null;
    $scope.setFamilyMemberHasACriminalRecord = function (val) {
        $scope.toggleWithCustomItem('FamilyMemberHasACriminalRecord', val);
        $scope.familyMember.hasACriminalRecord = val;
        $scope.toggleHasACriminalRecord();
    };

    $scope.familyMember.hasAMentalIllness = null;
    $scope.setFamilyMemberHasAMentalIllness = function (val) {
        $scope.toggleWithCustomItem('FamilyMemberHasAMentalIllness', val);
        $scope.familyMember.hasAMentalIllness = val;
        $scope.toggleHasAMentalIllnessClass();
    };

    $scope.familyMember.hasSuicideAttempts = null;
    $scope.setFamilyMemberHasSuicideAttempts = function (val) {
        $scope.toggleWithCustomItem('FamilyMemberHasSuicideAttempts', val);
        $scope.familyMember.hasSuicideAttempts = val;
    };

    $scope.familyMember.hasADisability = null;
    $scope.setFamilyMemberHasADisability = function (val) {
        $scope.toggleWithCustomItem('FamilyMemberHasADisability', val);
        $scope.familyMember.hasADisability = val;
    };

    $scope.familyMember.hasDied = null;
    $scope.setFamilyMemberHasDied = function (val) {
        $scope.toggleWithCustomItem('FamilyMemberHasDied', val);
        $scope.familyMember.hasDied = val;
        $scope.toggleHasDied();
    };

    $scope.familyMember.isBroughtUpSeparately = null;
    $scope.setFamilyMemberIsBroughtUpSeparately = function (val) {
        $scope.toggleWithCustomItem('FamilyMemberIsBroughtUpSeparately', val);
        $scope.familyMember.isBroughtUpSeparately = val;
    };

    $scope.cadet.fatherExist = null;
    $scope.setFatherExist = function (val) {
        $scope.toggleWithCustomItem('FatherExist', val);
        $scope.cadet.fatherExist = val;
    };

    $scope.cadet.motherExist = null;
    $scope.setMotherExist = function (val) {
        $scope.toggleWithCustomItem('MotherExist', val);
        $scope.cadet.motherExist = val;
    };

    $scope.cadet.hasInformationAboutParents = null;
    $scope.setHasInformationAboutParents = function (val) {
        $scope.toggleWithCustomItem('HasInformationAboutParents', val);
        $scope.cadet.hasInformationAboutParents = val;
    };

    $scope.education.unfinished = null;
    $scope.setEducationUnfinished = function (val) {
        $scope.toggleWithCustomItem('EducationUnfinished', val);
        $scope.education.unfinished = val;
    };
    $scope.education.highAchiever = null;
    $scope.setEducationHighAchiever = function (val) {
        $scope.toggleWithCustomItem('EducationHighAchiever', val);
        $scope.education.highAchiever = val;
    };
    $scope.education.redDiploma = null;
    $scope.setEducationRedDiploma = function (val) {
        $scope.toggleWithCustomItem('EducationRedDiploma', val);
        $scope.education.redDiploma = val;
    };


    $scope.tripsAbroad.doMaintainARelationship = null;
    $scope.setDoMaintainARelationShip = function (val) {
        $scope.toggleWithCustomItem('DoMaintainARelationShip', val);
        $scope.tripsAbroad.doMaintainARelationship = val;
    };


    $scope.familyMemberDetails = function () {
        var first = true;
        var str = '';

        if ($scope.familyMember.wasTreatedForAlcoholism) {
            if (!first)
                str += ', ';
            first = false;
            str += 'проходил/а лечение от алкоголизма';
        }
        if ($scope.familyMember.wasTreatedForAddiction) {
            if (!first)
                str += ', ';
            first = false;
            str += 'проходил/а лечение от наркомании';
        }
        if ($scope.familyMember.hasACriminalRecord) {
            if (!first)
                str += ', ';
            first = false;
            str += 'имеет судимость';
        }
        if ($scope.familyMember.hasAMentalIllness) {
            if (!first)
                str += ', ';
            first = false;
            str += 'имеет психическое заболевание';
        }
        if ($scope.familyMember.hasSuicideAttempts) {
            if (!first)
                str += ', ';
            first = false;
            str += 'имеет попытки суицида';
        }
        if ($scope.familyMember.hasADisability) {
            if (!first)
                str += ', ';
            first = false;
            str += 'имеет инвалидность';
        }
        if ($scope.familyMember.hasDied) {
            if (!first)
                str += ', ';
            str += 'умер/умерла';
        }

        return str;
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
                        if ($scope.cadet.religion == "10") {
                            if ($scope.cadet.customReligion.length == "") {
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
                        $('.finish').attr('style', '');
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
            return this.optional(element) || /^\+7(9\d{2})\d{3}-\d{3}$/.test(value);
        }, "Пожалуйста, введите номер телефона в формате +7(9**)***-****");

        $.validator.addMethod("passportNumber", function (value, element) {
            return this.optional(element) || /^\d{4}\s\d{6}$/.test(value);
        }, "Пожалуйста, введите номер паспорта в формате 1234 123456");

        $.validator.addMethod("militaryId", function (value, element) {
            return this.optional(element) || /^[А-Я][А-Я]\s\d{7}$/.test(value);
        }, "Пожалуйста, введите номер военного билета в формате  AA 1234567");


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
                    passportNumber: true,
                    minlength: 3
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

    $scope.textByInstitutionType = function (type) {
        if (type == "1")
            return "Высшее профессиональное (магистр)";
        if (type == "2")
            return "Высшее профессиональное";
        if (type == "3")
            return "Среднее профессиональное";
        if (type == "4")
            return "Начальное профессиональное";
        if (type == "5")
            return "Среднее полное (11 классов)";
        if (type == "6")
            return "Среднее общее (9 классов)";
        if (type == "7")
            return "Среднее начальное (4 класса)";
    };

    $scope.educationSubData = function (education) {
        var str = '';
        if (education.unfinished) {
            str += ', неоконченное';
        }
        if (education.highAchiever) {
            str += ', отличник';
        }
        if (education.redDiploma) {
            str += ', красный диплом';
        }
        return str;
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


    $scope.submit = function () {
        var $valid = angular.element('#cadetForm').valid(),
            $validator;
        if (!$valid) {
            alert('Проверьте данные формы');
        } else {
            var cadetOri = $scope.cadet;
            var cadet = withCsrfData(cadetOri);
            k = cadet;
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