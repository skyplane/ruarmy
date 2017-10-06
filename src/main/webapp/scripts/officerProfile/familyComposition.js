/**
 * Created by skyplane on 20.09.17.
 */


var fm;

function initFamilyComposition($scope) {

    $scope.familyMember = {};

    $scope.compositionOfFamily = function () {
        if (Number($scope.cadet.familyComposition.compositionOfFamily) == 1) {
            $('#withoutFatherId').attr('style', 'display: none');
            $('#withoutMotherId').attr('style', 'display: none');
            $('#hasInformationAboutParentsId').attr('style', 'display: none');
        }
        if (Number($scope.cadet.familyComposition.compositionOfFamily) == 2) {
            $('#withoutMotherId').attr('style', 'display: none');
            $('#withoutFatherId').attr('style', '');

            if (Number($scope.cadet.familyComposition.withoutFather) < 3) {
                $('#fatherExistId').attr('style', '');
                $scope.setFatherExist($scope.cadet.familyComposition.fatherExist);
            } else {
                $('#fatherExistId').attr('style', 'display:none');
            }
            $('#hasInformationAboutParentsId').attr('style', 'display: none');

        }
        if (Number($scope.cadet.familyComposition.compositionOfFamily) == 3) {
            $('#withoutFatherId').attr('style', 'display: none');
            $('#withoutMotherId').attr('style', '');

            if (Number($scope.cadet.familyComposition.withoutMother) < 3) {
                $('#motherExistId').attr('style', '');
                $scope.setMotherExist($scope.cadet.familyComposition.motherExist);
            } else {
                $('#motherExistId').attr('style', 'display:none');
            }
            $('#hasInformationAboutParentsId').attr('style', 'display: none');
        }
        if (Number($scope.cadet.familyComposition.compositionOfFamily) == 4) {
            $('#withoutFatherId').attr('style', 'display: none');
            $('#withoutMotherId').attr('style', 'display: none');
            $('#hasInformationAboutParentsId').attr('style', '');
        }
    };

    $scope.textByCompositionOfFamily = function () {
        var str = '';

        if (Number($scope.cadet.familyComposition.compositionOfFamily) == 1) {
            str = "полная";
        }
        if (Number($scope.cadet.familyComposition.compositionOfFamily) == 2) {
            str = "без отца";

            if (Number($scope.cadet.familyComposition.withoutFather) == 1) {
                str += ', родители в разводе';
                if ($scope.cadet.familyComposition.fatherExist) {
                    str += ', поддерживает отношения';
                } else {
                    str += ', отношения не поддерживает';
                }
            } else if (Number($scope.cadet.familyComposition.withoutFather) == 2) {
                str += ', отец ушел из семьи';
                if ($scope.cadet.familyComposition.fatherExist) {
                    str += ', поддерживает отношения';
                } else {
                    str += ', отношения не поддерживает';
                }
            } else {
                str += ', отец умер';
            }

        }
        if (Number($scope.cadet.familyComposition.compositionOfFamily) == 3) {
            str = "без матери";

            if (Number($scope.cadet.familyComposition.withoutMother) == 1) {
                str += ', родители в разводе';
                if ($scope.cadet.familyComposition.motherExist) {
                    str += ', поддерживает отношения';
                } else {
                    str += ', отношения не поддерживает';
                }
            } else if (Number($scope.cadet.familyComposition.withoutMother) == 2) {
                str += ', мать ушла из семьи';
                if ($scope.cadet.familyComposition.motherExist) {
                    str += ', поддерживает отношения';
                } else {
                    str += ', отношения не поддерживает';
                }
            } else {
                str += ', мать умерла';
            }
        }
        if (Number($scope.cadet.familyComposition.compositionOfFamily) == 4) {
            str = "сирота";
            if ($scope.cadet.familyComposition.hasInformationAboutParents) {
                str += ', имеет сведения о родителях';
            } else {
                str += ', сведений о родителях не имеет';
            }
        }

        return str;
    };

    $scope.textByMarried = function () {

        var str = '';

        if (Number($scope.cadet.familyComposition.married) == 1) {
            str = "холост";
        } else if (Number($scope.cadet.familyComposition.married) == 2) {
            str = "женат";
        } else if (Number($scope.cadet.familyComposition.married) == 3) {
            str = "в гражданском браке";
        } else if (Number($scope.cadet.familyComposition.married) == 4) {
            str = "состоит в отношениях";
        } else if (Number($scope.cadet.familyComposition.married) == 5) {
            str = "вдовец";
        }

        if (Number($scope.cadet.familyComposition.marrieds) == 1) {
            str += ", в браке не состоял";
        } else if (Number($scope.cadet.familyComposition.marrieds) == 2) {
            str += ", один брак";
        } else if (Number($scope.cadet.familyComposition.marrieds) == 3) {
            str += ", два брака";
        } else if (Number($scope.cadet.familyComposition.marrieds) == 4) {
            str += ", три брака";
        } else if (Number($scope.cadet.familyComposition.marrieds) == 5) {
            str += ", четыре и более брака";
        }

        return str;
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
        $scope.cadet.familyComposition.familyMembers.push({
            familyMemberType: 1,
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
            isBroughtUpSeparately: null,
            hasACriminalRecordDetails: '',
            hasAMentalIllnessName: '',
            hasDiedYear: '',
            hasDiedCause: '',
            hasDiedPlace: ''
        });
        $scope.familyMemberIndex = $scope.cadet.familyComposition.familyMembers.length - 1;
        $scope.familyMember = $scope.cadet.familyComposition.familyMembers[$scope.cadet.familyComposition.familyMembers.length - 1];
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
        $scope.familyMember = $scope.cadet.familyComposition.familyMembers[index];

        if ($scope.familyMember.wasTreatedForAlcoholism == "false")
            $scope.familyMember.wasTreatedForAlcoholism = false;
        else if ($scope.familyMember.wasTreatedForAlcoholism == "true")
            $scope.familyMember.wasTreatedForAlcoholism = true;
        if ($scope.familyMember.wasTreatedForAddiction == "false")
            $scope.familyMember.wasTreatedForAddiction = false;
        else if ($scope.familyMember.wasTreatedForAddiction == "true")
            $scope.familyMember.wasTreatedForAddiction = true;
        if ($scope.familyMember.hasACriminalRecord == "false")
            $scope.familyMember.hasACriminalRecord = false;
        else if ($scope.familyMember.hasACriminalRecord == "true")
            $scope.familyMember.hasACriminalRecord = true;
        if ($scope.familyMember.hasAMentalIllness == "false")
            $scope.familyMember.hasAMentalIllness = false;
        else if ($scope.familyMember.hasAMentalIllness == "true")
            $scope.familyMember.hasAMentalIllness = true;
        if ($scope.familyMember.hasSuicideAttempts == "false")
            $scope.familyMember.hasSuicideAttempts = false;
        else if ($scope.familyMember.hasSuicideAttempts == "true")
            $scope.familyMember.hasSuicideAttempts = true;
        if ($scope.familyMember.hasADisability == "false")
            $scope.familyMember.hasADisability = false;
        else if ($scope.familyMember.hasADisability == "true")
            $scope.familyMember.hasADisability = true;
        if ($scope.familyMember.hasDied == "false")
            $scope.familyMember.hasDied = false;
        else if ($scope.familyMember.hasDied == "true")
            $scope.familyMember.hasDied = true;

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
        fm = $scope.familyMember;
        $scope.cadet.familyComposition.familyMembers[$scope.familyMemberIndex] = $scope.familyMember;
        $('#familyMemberModal').modal('hide');
    };
    $scope.removeFamilyMember = function (index) {
        $scope.cadet.familyComposition.familyMembers.splice(index, 1);
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


    $scope.setFamilyMemberWasTreatedForAlcoholism = function (val) {
        $scope.toggleWithCustomItem('FamilyMemberWasTreatedForAlcoholism', val);
        $scope.familyMember.wasTreatedForAlcoholism = val;
    };

    $scope.setFamilyMemberWasTreatedForAddiction = function (val) {
        $scope.toggleWithCustomItem('FamilyMemberWasTreatedForAddiction', val);
        $scope.familyMember.wasTreatedForAddiction = val;
    };

    $scope.setFamilyMemberHasACriminalRecord = function (val) {
        $scope.toggleWithCustomItem('FamilyMemberHasACriminalRecord', val);
        $scope.familyMember.hasACriminalRecord = val;
        $scope.toggleHasACriminalRecord();
    };

    $scope.setFamilyMemberHasAMentalIllness = function (val) {
        $scope.toggleWithCustomItem('FamilyMemberHasAMentalIllness', val);
        $scope.familyMember.hasAMentalIllness = val;
        $scope.toggleHasAMentalIllnessClass();
    };

    $scope.setFamilyMemberHasSuicideAttempts = function (val) {
        $scope.toggleWithCustomItem('FamilyMemberHasSuicideAttempts', val);
        $scope.familyMember.hasSuicideAttempts = val;
    };

    $scope.setFamilyMemberHasADisability = function (val) {
        $scope.toggleWithCustomItem('FamilyMemberHasADisability', val);
        $scope.familyMember.hasADisability = val;
    };

    $scope.setFamilyMemberHasDied = function (val) {
        $scope.toggleWithCustomItem('FamilyMemberHasDied', val);
        $scope.familyMember.hasDied = val;
        $scope.toggleHasDied();
    };

    $scope.setFamilyMemberIsBroughtUpSeparately = function (val) {
        $scope.toggleWithCustomItem('FamilyMemberIsBroughtUpSeparately', val);
        $scope.familyMember.isBroughtUpSeparately = val;
    };

    $scope.setFatherExist = function (val) {
        $scope.toggleWithCustomItem('FatherExist', val);
        $scope.cadet.familyComposition.fatherExist = val;
    };

    $scope.setMotherExist = function (val) {
        $scope.toggleWithCustomItem('MotherExist', val);
        $scope.cadet.familyComposition.motherExist = val;
    };

    $scope.setHasInformationAboutParents = function (val) {
        $scope.toggleWithCustomItem('HasInformationAboutParents', val);
        $scope.cadet.familyComposition.hasInformationAboutParents = val;
    };


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


    $scope.editFamilyComposition = function () {
        $('#familyCompositionShow').toggle();
        $('#familyCompositionEdit').toggle();
    };

    $scope.saveAndLoadFamilyComposition = function () {

        var familyComposition = jQuery.extend(true, {}, $scope.cadet.familyComposition);

        familyComposition.id = $scope.cadet.id;


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
        $.each(familyComposition.familyMembers, function () {
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
        familyComposition['familyMembers_type'] = familyMembers_type;
        familyComposition['familyMembers_firstName'] = familyMembers_firstName;
        familyComposition['familyMembers_lastName'] = familyMembers_lastName;
        familyComposition['familyMembers_patronymic'] = familyMembers_patronymic;
        familyComposition['familyMembers_dateOfBirth'] = familyMembers_dateOfBirth;
        familyComposition['familyMembers_occupation'] = familyMembers_occupation;
        familyComposition['familyMembers_phone'] = familyMembers_phone;
        familyComposition['familyMembers_wasTreatedForAlcoholism'] = familyMembers_wasTreatedForAlcoholism;
        familyComposition['familyMembers_wasTreatedForAddiction'] = familyMembers_wasTreatedForAddiction;
        familyComposition['familyMembers_hasACriminalRecord'] = familyMembers_hasACriminalRecord;
        familyComposition['familyMembers_hasAMentalIllness'] = familyMembers_hasAMentalIllness;
        familyComposition['familyMembers_hasSuicideAttempts'] = familyMembers_hasSuicideAttempts;
        familyComposition['familyMembers_hasADisability'] = familyMembers_hasADisability;
        familyComposition['familyMembers_hasDied'] = familyMembers_hasDied;
        familyComposition['familyMembers_isBroughtUpSeparately'] = familyMembers_isBroughtUpSeparately;
        familyComposition['familyMembers_hasDiedCause'] = familyMembers_hasDiedCause;
        familyComposition['familyMembers_hasDiedPlace'] = familyMembers_hasDiedPlace;
        familyComposition['familyMembers_hasDiedYear'] = familyMembers_hasDiedYear;
        familyComposition['familyMembers_hasAMentalIllnessName'] = familyMembers_hasAMentalIllnessName;
        familyComposition['familyMembers_hasACriminalRecordDetails'] = familyMembers_hasACriminalRecordDetails;
        familyComposition.familyMembers = [];


        $.post(
            "../api/cadet/saveAndLoadFamilyComposition",
            withCsrfData(familyComposition)
            , function (data) {
                if (data.success == 0) {
                    $scope.$apply(function () {
                        $scope.cadet.familyComposition = data.familyComposition;
                        $('#familyCompositionShow').toggle();
                        $('#familyCompositionEdit').toggle();
                    });
                    $scope.compositionOfFamily();
                    alert("Обновлено");
                }
            },
            "json"
        );


    };

    $scope.compositionOfFamily();


}
