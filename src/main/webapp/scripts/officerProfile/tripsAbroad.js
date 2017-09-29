/**
 * Created by skyplane on 20.09.17.
 */

function initTripsAbroad($scope){



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

    $scope.tripsAbroadIndex = 0;
    $scope.addTripsAbroadItem = function () {
        $scope.cadet.tripsAbroad.push({
            who: '',
            firstName: '',
            lastName: '',
            patronymic: '',
            country: '',
            doMaintainARelationship: null
        });
        $scope.tripsAbroadIndex = $scope.cadet.tripsAbroad.length - 1;
        $scope.tripsAbroad = $scope.cadet.tripsAbroad[$scope.cadet.tripsAbroad.length - 1];
        $scope.setDoMaintainARelationShip($scope.tripsAbroad.doMaintainARelationship);
        $('#tripsAbroadModal').modal('show');
    };

    $scope.editTripsAbroadItem = function (index) {
        $scope.tripsAbroadIndex = index;
        $scope.tripsAbroad = $scope.cadet.tripsAbroad[index];
        $scope.setDoMaintainARelationShip($scope.tripsAbroad.doMaintainARelationship);
        $('#tripsAbroadModal').modal('show');
    };
    $scope.removeTripsAbroadItem = function (index) {
        $scope.cadet.tripsAbroad.splice(index, 1);
    };
    $scope.saveTripsAbroadItem = function () {
        $scope.cadet.tripsAbroad[$scope.tripsAbroadIndex] = $scope.tripsAbroad;
        $('#tripsAbroadModal').modal('hide');
    };



    $scope.setDoMaintainARelationShip = function (val) {
        $scope.toggleWithCustomItem('DoMaintainARelationShip', val);
        $scope.tripsAbroad.doMaintainARelationship = val;
    };












    $scope.editTripsAbroad = function (){
        $('#tripsAbroadShow').toggle();
        $('#tripsAbroadEdit').toggle();
    };

    $scope.saveAndLoadTripsAbroad = function (){

        var tripsAbroad = {};

        var tripsAbroads_who = [];
        var tripsAbroads_firstName = [];
        var tripsAbroads_lastName = [];
        var tripsAbroads_patronymic = [];
        var tripsAbroads_country = [];
        var tripsAbroads_doMaintainARelationship = [];
        $.each($scope.cadet.tripsAbroad, function () {
            tripsAbroads_who.push(this.who);
            tripsAbroads_firstName.push(this.firstName);
            tripsAbroads_lastName.push(this.lastName);
            tripsAbroads_patronymic.push(this.patronymic);
            tripsAbroads_country.push(this.country);
            tripsAbroads_doMaintainARelationship.push(this.doMaintainARelationship);
        });
        tripsAbroad['tripsAbroads_who'] = tripsAbroads_who;
        tripsAbroad['tripsAbroads_firstName'] = tripsAbroads_firstName;
        tripsAbroad['tripsAbroads_lastName'] = tripsAbroads_lastName;
        tripsAbroad['tripsAbroads_patronymic'] = tripsAbroads_patronymic;
        tripsAbroad['tripsAbroads_country'] = tripsAbroads_country;
        tripsAbroad['tripsAbroads_doMaintainARelationship'] = tripsAbroads_doMaintainARelationship;

        tripsAbroad.id = $scope.cadet.id;
        $.post(
            "../api/cadet/saveAndLoadTripsAbroad",
            withCsrfData(tripsAbroad)
            , function (data) {
                if (data.success == 0) {
                    $scope.$apply(function () {
                        $scope.cadet.tripsAbroad = data.tripsAbroad;
                        $('#tripsAbroadShow').toggle();
                        $('#tripsAbroadEdit').toggle();
                    });
                    alert("Обновлено");
                }
            },
            "json"
        );


    }



}
