/**
 * Created by skyplane on 18.09.17.
 */


var app = angular.module('cursantsApp', ["checklist-model"]);

var k;

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


app.controller('officerProfileCtrl', function ($scope, $filter) {

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


    $scope.options={};




    $scope.cursantId = $('#cursantId').attr('value');

    $scope.cadet={};

    $.post(
        "../api/cadet/loadCadet?cursantId="+$scope.cursantId,
        withCsrfData({})
        , function (json) {


            $scope.$apply(function () {
                $scope.cadet=json;
            });

            initTotalInformation($scope);
            initEducationAndSkills($scope, $filter);
            initAddressData($scope);
            initFamilyComposition($scope, $filter);
            initHealth($scope);
            initBehavior($scope);
            initTripsAbroad($scope);
            initAdditionally($scope);


        },
        "json"
    );


});


function withCsrfData(param) {
    var csrfName = $('#csrfParameter').attr('name');
    var csrfValue = $('#csrfParameter').attr('value');
    param[csrfName] = csrfValue;
    return param;
};