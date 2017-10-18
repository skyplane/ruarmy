/**
 * Created by skyplane on 20.09.17.
 */

function initEducationAndSkills($scope, $filter) {

    $scope.options.educationAndSkills = {};
    $scope.options.educationAndSkills.driversLicensesAll = ['M', 'A', 'B', 'C', 'D', 'A1', 'B1', 'C1', 'D1', 'BE', 'CE', 'DE', 'C1E', 'D1E'];

    $scope.options.educationAndSkills.systemSkills = [];
    $scope.options.educationAndSkills.actualSkills = [];

    $scope.options.educationAndSkills.education = {};

    $scope.selectedFieldOfActivityCategory = 1;

    $scope.skillsTextByFoa1 = [];
    $scope.skillsTextByFoa2 = [];
    $scope.skillsTextByFoa3 = [];
    $scope.skillsTextByFoa4 = [];


    $scope.options.levels = [{'name': 'свободно владеет', 'value': '1'}, {'name': 'средний уровень', 'value': '2'},
        {'name': 'базовый уровень', 'value': '3'}];


    $scope.getSkillsTextByFoa = function (val) {
        var arr = [];

        $.each($scope.cadet.educationAndSkills.skills, function () {
            var skVal = this;
            $.each($scope.options.educationAndSkills.systemSkills, function () {
                if (this.foa == val && this.id == skVal) {
                    arr.push(this.name);
                }
            });
        });

        return arr;
    };


    $scope.loadSkillsByFoa = function () {
        $scope.skillsTextByFoa1 = $scope.getSkillsTextByFoa(1);
        $scope.skillsTextByFoa2 = $scope.getSkillsTextByFoa(2);
        $scope.skillsTextByFoa3 = $scope.getSkillsTextByFoa(3);
        $scope.skillsTextByFoa4 = $scope.getSkillsTextByFoa(4);
    };

    $scope.loadSkillsByFoa();

    $scope.skillsRunByFieldOfActivity = function (val) {
        $.get(
            "../api/skill/loadByFieldOfActivity?fieldOfActivity=" + val
            , function (json) {
                $.each(json.data, function () {
                    $scope.options.educationAndSkills.systemSkills.push({id: this.id, name: this.name, foa: val});
                });
                $scope.loadSkillsByFoa();
                $scope.$apply();
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
                    $scope.options.educationAndSkills.actualSkills = [];
                    $.each(json.data, function () {
                        $scope.options.educationAndSkills.actualSkills.push({id: this.id, name: this.name, foa: val});
                    });
                });
            },
            "json"
        );
    };


    $scope.options.educationAndSkills.educationIndex = 0;
    $scope.addEducation = function () {
        $scope.cadet.educationAndSkills.educations.push({
            institutionType: '',
            institutionName: '',
            speciality: '',
            yearOfEnding: '',
            unfinished: null,
            redDiploma: null,
            highAchiever: null
        });
        $scope.options.educationAndSkills.educationIndex = $scope.cadet.educationAndSkills.educations.length - 1;
        $scope.options.educationAndSkills.education =
            $scope.cadet.educationAndSkills.educations[$scope.cadet.educationAndSkills.educations.length - 1];
        $scope.cadet.educationAndSkills.educations.splice($scope.cadet.educationAndSkills.educations.length - 1, 1);
        $scope.setEducationUnfinished($scope.options.educationAndSkills.education.unfinished);
        $scope.setEducationHighAchiever($scope.options.educationAndSkills.education.highAchiever);
        $scope.setEducationRedDiploma($scope.options.educationAndSkills.education.redDiploma);
        $scope.options.educationAndSkills.tmpEducation=null;
        $('#educationModal').modal('show');
    };
    $scope.editEducation = function (index) {
        $scope.options.educationAndSkills.educationIndex = index;
        $scope.options.educationAndSkills.education = $scope.cadet.educationAndSkills.educations[index];
        $scope.cadet.educationAndSkills.educations.splice(index, 1);
        $scope.options.educationAndSkills.tmpEducation = angular.copy($scope.options.educationAndSkills.education);
        $scope.setEducationUnfinished($scope.options.educationAndSkills.education.unfinished);
        $scope.setEducationHighAchiever($scope.options.educationAndSkills.education.highAchiever);
        $scope.setEducationRedDiploma($scope.options.educationAndSkills.education.redDiploma);
        $('#educationModal').modal('show');
    };
    $scope.removeEducation = function (index) {
        $scope.cadet.educationAndSkills.educations.splice(index, 1);
    };
    $scope.restoreEducation = function () {
        if ($scope.options.educationAndSkills.tmpEducation!=null){
            $scope.cadet.educationAndSkills.educations.push($scope.options.educationAndSkills.tmpEducation);
            $scope.cadet.educationAndSkills.educations =
                $filter('orderBy')($scope.cadet.educationAndSkills.educations, ['institutionType', 'yearOfEnding']);
        }
    };

    $scope.saveEducation = function () {
        var verify = true;
        var edctn = $scope.options.educationAndSkills.education;
        if (edctn.institutionType == '') {
            alert('Проверьте данные формы');
            verify = false;
        } else if (Number(edctn.institutionType) < 5) {
            if (edctn.institutionName == '' || edctn.speciality == '' || edctn.yearOfEnding == '' ||
                edctn.unfinished == null || edctn.redDiploma == null ||
                    Number(edctn.yearOfEnding)<1970 || Number(edctn.yearOfEnding)<3000
            ) {
                alert('Проверьте данные формы');
                verify = false;
            }
        }
        if (verify) {
            $scope.cadet.educationAndSkills.educations.push($scope.options.educationAndSkills.education);
            $scope.cadet.educationAndSkills.educations =
                $filter('orderBy')($scope.cadet.educationAndSkills.educations, ['institutionType', 'yearOfEnding']);

            $('#educationModal').modal('hide');
        }
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
        if (education.unfinished == true || "true" == education.unfinished) {
            str += ', неоконченное';
        }
        if (education.highAchiever == true || "true" == education.highAchiever) {
            str += ', отличник';
        }
        if (education.redDiploma == true || "true" == education.redDiploma) {
            str += ', красный диплом';
        }
        return str;
    };

    $scope.getForeignLanguagesString = function () {
        var str = '';
        $.each($scope.cadet.educationAndSkills.foreignLanguages, function () {
            if (Number(this.language) == 1)
                str += 'английский ';
            if (Number(this.language) == 2)
                str += 'немецкий ';
            if (Number(this.language) == 3)
                str += 'французский ';
            if (Number(this.language) == 4)
                str += 'итальянский ';
            if (Number(this.language) == 5)
                str += 'испанский ';

            if (Number(this.level) == 1)
                str += '(свободно владеет), ';
            if (Number(this.level) == 2)
                str += '(средний уровень), ';
            if (Number(this.level) == 3)
                str += '(базовый уровень), ';
        });
        return str.substr(0, str.length - 2);
    };

    $scope.changeInstitutionType = function () {
        if (Number($scope.options.educationAndSkills.education.institutionType) < 5) {
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

    $scope.setEducationUnfinished = function (val) {
        $scope.toggleWithCustomItem('EducationUnfinished', val);
        $scope.options.educationAndSkills.education.unfinished = val;
    };
    $scope.setEducationHighAchiever = function (val) {
        $scope.toggleWithCustomItem('EducationHighAchiever', val);
        $scope.options.educationAndSkills.education.highAchiever = val;
    };
    $scope.setEducationRedDiploma = function (val) {
        $scope.toggleWithCustomItem('EducationRedDiploma', val);
        $scope.options.educationAndSkills.education.redDiploma = val;
    };

    $scope.addForeignLanguage = function () {
        $scope.cadet.educationAndSkills.foreignLanguages.push({
            language: '1',
            level: '1'
        });
    };
    $scope.removeForeignLanguage = function (index) {
        $scope.cadet.educationAndSkills.foreignLanguages.splice(index, 1);
    };


    $scope.editEducationAndSkills = function () {
        $('#educationAndSkillsShow').toggle();
        $('#educationAndSkillsEdit').toggle();
    };

    $scope.saveAndLoadEducationAndSkills = function () {

        var educationAndSkills = jQuery.extend(true, {}, $scope.cadet.educationAndSkills);


        var educations_institutionType = [];
        var educations_institutionName = [];
        var educations_speciality = [];
        var educations_yearOfEnding = [];
        var educations_unfinished = [];
        var educations_highAchiever = [];
        var educations_redDiploma = [];
        $.each(educationAndSkills.educations, function () {
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
        educationAndSkills['educations_institutionType'] = educations_institutionType;
        educationAndSkills['educations_institutionName'] = educations_institutionName;
        educationAndSkills['educations_speciality'] = educations_speciality;
        educationAndSkills['educations_yearOfEnding'] = educations_yearOfEnding;
        educationAndSkills['educations_unfinished'] = educations_unfinished;
        educationAndSkills['educations_highAchiever'] = educations_highAchiever;
        educationAndSkills['educations_redDiploma'] = educations_redDiploma;
        educationAndSkills.educations = [];


        var foreignLanguages_language = [];
        var foreignLanguages_level = [];
        $.each(educationAndSkills.foreignLanguages, function () {
            foreignLanguages_language.push(this.language);
            foreignLanguages_level.push(this.level);
        });
        educationAndSkills['foreignLanguages_language'] = foreignLanguages_language;
        educationAndSkills['foreignLanguages_level'] = foreignLanguages_level;
        educationAndSkills.foreignLanguages = [];


        educationAndSkills.id = $scope.cadet.id;
        $.post(
            "../api/cadet/saveAndLoadEducationAndSkills",
            withCsrfData(educationAndSkills)
            , function (data) {
                if (data.success == 0) {
                    $scope.$apply(function () {
                        $scope.cadet.educationAndSkills = data.educationAndSkills;
                        $('#educationAndSkillsShow').toggle();
                        $('#educationAndSkillsEdit').toggle();
                    });
                    alert("Обновлено");
                }
            },
            "json"
        );


    }


}
