/**
 * Created by skyplane on 20.09.17.
 */

function initBehavior($scope){


    $scope.setThoughtsOfSuicideDoesNotHave = function (val) {
        $scope.toggleWithCustomItem('ThoughtsOfSuicideDoesNotHave', val);
        $scope.cadet.behavior.thoughtsOfSuicideDoesNotHave = val;
    };

    $scope.setSuicideAttemptsDidNotCommit = function (val) {
        $scope.toggleWithCustomItem('SuicideAttemptsDidNotCommit', val);
        $scope.cadet.behavior.suicideAttemptsDidNotCommit = val;
    };

    $scope.setAdministrativeOffenseDidNotCommit = function (val) {
        $scope.toggleWithCustomItem('AdministrativeOffenseDidNotCommit', val);
        $scope.cadet.behavior.administrativeOffenseDidNotCommit = val;
    };

    $scope.setPoliceRecordDoesNotHave = function (val) {
        $scope.toggleWithCustomItem('PoliceRecordDoesNotHave', val);
        $scope.cadet.behavior.policeRecordDoesNotHave = val;
    };

    $scope.setCriminalLiabilityWasNotInvolved = function (val) {
        $scope.toggleWithCustomItem('CriminalLiabilityWasNotInvolved', val);
        $scope.cadet.behavior.criminalLiabilityWasNotInvolved = val;
    };


    $scope.basicBehaviorText = function () {
        var str = '';

        var notEmpty = false;

        if (!$.parseJSON($scope.cadet.behavior.thoughtsOfSuicideDoesNotHave)){
           str += 'имеет мысли о суициде';
            notEmpty=true;
        }

        if (!$.parseJSON($scope.cadet.behavior.suicideAttemptsDidNotCommit)){
            if (notEmpty)
                str+=', ';
            str += 'совершал попытки суицида';
            notEmpty=true;
        }

        if (!$.parseJSON($scope.cadet.behavior.administrativeOffenseDidNotCommit)){
            if (notEmpty)
                str+=', ';
            str += 'совершал административные правонарушения';
            notEmpty=true;
        }

        if (!$.parseJSON($scope.cadet.behavior.policeRecordDoesNotHave)){
            if (notEmpty)
                str+=', ';
            str += 'имеет приводы в полицию';
            notEmpty=true;
        }

        if (!$.parseJSON($scope.cadet.behavior.criminalLiabilityWasNotInvolved)){
            if (notEmpty)
                str+=', ';
            str += 'привлекался к уголовной ответственности';
        }

        return str;
    };




    $scope.editBehavior = function (){
        $('#behaviorShow').toggle();
        $('#behaviorEdit').toggle();
    };

    $scope.saveAndLoadBehavior = function (){

        var behavior = jQuery.extend(true, {}, $scope.cadet.behavior);

        behavior.id = $scope.cadet.id;
        $.post(
            "../api/cadet/saveAndLoadBehavior",
            withCsrfData(behavior)
            , function (data) {
                if (data.success == 0) {
                    $scope.$apply(function () {
                        $scope.cadet.behavior = data.behavior;
                        $('#behaviorShow').toggle();
                        $('#behaviorEdit').toggle();
                    });

                    $scope.setThoughtsOfSuicideDoesNotHave($scope.cadet.behavior.thoughtsOfSuicideDoesNotHave);
                    $scope.setSuicideAttemptsDidNotCommit($scope.cadet.behavior.suicideAttemptsDidNotCommit);
                    $scope.setAdministrativeOffenseDidNotCommit($scope.cadet.behavior.administrativeOffenseDidNotCommit);
                    $scope.setPoliceRecordDoesNotHave($scope.cadet.behavior.policeRecordDoesNotHave);
                    $scope.setCriminalLiabilityWasNotInvolved($scope.cadet.behavior.criminalLiabilityWasNotInvolved);

                    alert("Обновлено");
                }
            },
            "json"
        );


    };

    $scope.setThoughtsOfSuicideDoesNotHave($scope.cadet.behavior.thoughtsOfSuicideDoesNotHave);
    $scope.setSuicideAttemptsDidNotCommit($scope.cadet.behavior.suicideAttemptsDidNotCommit);
    $scope.setAdministrativeOffenseDidNotCommit($scope.cadet.behavior.administrativeOffenseDidNotCommit);
    $scope.setPoliceRecordDoesNotHave($scope.cadet.behavior.policeRecordDoesNotHave);
    $scope.setCriminalLiabilityWasNotInvolved($scope.cadet.behavior.criminalLiabilityWasNotInvolved);

}
