/**
 * Created by skyplane on 18.09.17.
 */


var app = angular.module('cursantsApp', ["checklist-model"]);

var k;

app.controller('officerProfileCtrl', function ($scope) {


    $scope.cursantId = $('#cursantId').attr('value');


    $.post(
        "../api/cadet/loadCadet?cursantId="+$scope.cursantId,
        withCsrfData({})
        , function (json) {

            k=json;

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