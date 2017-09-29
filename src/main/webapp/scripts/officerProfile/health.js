/**
 * Created by skyplane on 20.09.17.
 */

var k;

function initHealth($scope) {



    $scope.basicHealthText = function () {
        var str = '';
        if ($.parseJSON($scope.cadet.health.concussionsWereNot)){
            str += 'сотрясений головного мозга не было';
        } else
            str += 'были сотрясения головного мозга';
        if ($.parseJSON($scope.cadet.health.traumaticBrainInjuryWasNot)){
            str += ', черепно-мозговых травм не было';
        } else
            str += ', были черепно-мозговыe травмы';
        if ($.parseJSON($scope.cadet.health.theNarcologWasNot)){
            str += ', на учёте у нарколога не состоял';
        } else
            str += ', состоял на учёте у нарколога';
        if ($.parseJSON($scope.cadet.health.thePsychiatristWasNot)){
            str += ', на учёте у психиатра не состоял';
        } else
            str += ', состоял на учёте у психиатра';
        return str;
    };


    $scope.setConcussionsWereNot = function (val) {
        $scope.toggleWithCustomItem('ConcussionsWereNot', val);
        $scope.cadet.health.concussionsWereNot = val;
    };

    $scope.setTraumaticBrainInjuryWasNot = function (val) {
        $scope.toggleWithCustomItem('TraumaticBrainInjuryWasNot', val);
        $scope.cadet.health.traumaticBrainInjuryWasNot = val;
    };

    $scope.setTheNarcologWasNot = function (val) {
        $scope.toggleWithCustomItem('TheNarcologWasNot', val);
        $scope.cadet.health.theNarcologWasNot = val;
    };

    $scope.setThePsychiatristWasNot = function (val) {
        $scope.toggleWithCustomItem('ThePsychiatristWasNot', val);
        $scope.cadet.health.thePsychiatristWasNot = val;
    };


    $scope.textByAlcohol = function () {
        if ($scope.cadet.health.alcohol == "1")
            return "алкоголь не употребляет";
        if ($scope.cadet.health.alcohol == "2")
            return "алкоголь употребляет по праздникам";
        if ($scope.cadet.health.alcohol == "3")
            return "алкоголь употребляет 1 раз в неделю или реже";
        if ($scope.cadet.health.alcohol == "4")
            return "алкоголь употребляет 1 - 3 раза в неделю";
        if ($scope.cadet.health.alcohol == "5")
            return "алкоголь употребляет более 3-х раз в неделю";

    };

    $scope.textByDrugUse = function () {
        if ($scope.cadet.health.drugUse == "1")
            return "наркотики не употреблял";
        if ($scope.cadet.health.drugUse == "2")
            return "наркотики употреблял однократно";
        if ($scope.cadet.health.drugUse == "3")
            return "наркотики употреблял систематически";
    };


    $scope.editHealth = function () {
        $('#healthShow').toggle();
        $('#healthEdit').toggle();
    };

    $scope.saveAndLoadHealth = function () {

        var health = jQuery.extend(true, {}, $scope.cadet.health);

        health.id = $scope.cadet.id;
        $.post(
            "../api/cadet/saveAndLoadHealth",
            withCsrfData(health)
            , function (data) {
                if (data.success == 0) {
                    $scope.$apply(function () {
                        $scope.cadet.health = data.health;
                        $('#healthShow').toggle();
                        $('#healthEdit').toggle();
                    });

                    $scope.setConcussionsWereNot($scope.cadet.health.concussionsWereNot);
                    $scope.setTraumaticBrainInjuryWasNot($scope.cadet.health.traumaticBrainInjuryWasNot);
                    $scope.setTheNarcologWasNot($scope.cadet.health.theNarcologWasNot);
                    $scope.setThePsychiatristWasNot($scope.cadet.health.thePsychiatristWasNot);

                    alert("Обновлено");
                }
            },
            "json"
        );


    };

    $scope.setConcussionsWereNot($scope.cadet.health.concussionsWereNot);
    $scope.setTraumaticBrainInjuryWasNot($scope.cadet.health.traumaticBrainInjuryWasNot);
    $scope.setTheNarcologWasNot($scope.cadet.health.theNarcologWasNot);
    $scope.setThePsychiatristWasNot($scope.cadet.health.thePsychiatristWasNot);




}
