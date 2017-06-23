/**
 * Created by skyplane on 22.06.17.
 */


var loadCursantsTableOnce = false;

var datatablesCursantsColumns = [
    {data: "fio", visible: true},
    {data: "militaryRank", visible: false},
    {data: "post", visible: false},
    {data: "division", visible: true},
    {data: "faculty", visible: false},
    {data: "speciality", visible: false},
    {data: "nationality", visible: false},
    {data: "religion", visible: false},
    {data: "family", visible: false},
    {data: "validityCategory", visible: false},
    {data: "actualAddress", visible: false},
    {data: "registeredAddress", visible: false},
    {data: "placeOfBirth", visible: false},
    {data: "dateOfBirth", visible: false}
];


function loadCursantsTable($scope) {
    $.post(
        "../api/cadet/loadCadets",
        withCsrfData({})
        , function (json) {
            $scope.options.cursants = json.data;
            // $scope.userProfile = $scope.options.cursants[0].id;

            $('#cursantsTable').DataTable({
                destroy: true,
                buttons: ['csv', 'excel',
                    {extend: 'pdfHtml5', orientation: 'landscape', pageSize: 'LEGAL'}
                    , 'colvis'],
                responsive: true,
                sScrollX: '100%',
                language: datatablesLanguage,
                columns: datatablesCursantsColumns,
                data: json.data,
                order: [1, 'desc'],
                "fnInitComplete": function (oSettings) {
                    if (loadCursantsTableOnce == false) {
                        loadCursantsTableOnce = true;
                        /* $('#profilesTable tbody').on('click', 'tr', function () {
                         var tr = this;
                         if ($(tr).hasClass('selected')) {
                         $(tr).removeClass('selected');
                         $('.editProfile').fadeOut();
                         } else {
                         $('#profilesTable').DataTable().$('tr.selected').removeClass('selected');
                         $(tr).addClass('selected');
                         $('.editProfile').fadeIn();
                         $.get(
                         "../api/profile/loadProfileById?id=" + $($(tr).find('td')[0]).text()
                         , function (json) {
                         $scope.$apply(function () {
                         $scope.profile = json;
                         });
                         },
                         "json"
                         );
                         }
                         });*/
                    }
                }
            });


            $('#cursantsTable').DataTable().buttons().container().appendTo('#cursantsTable_wrapper .col-sm-6:eq(0)');

        },
        "json"
    );
}


var app = angular.module('cursantsApp', ["checklist-model"]);


app.controller('officerCtrl', function ($scope) {

    $scope.cursant = {};
    $scope.options = {};
    $scope.options.cursants = [];


    $scope.init = function () {
        loadCursantsTable($scope);

    };
});


function withCsrfData(param) {
    var csrfName = $('#csrfParameter').attr('name');
    var csrfValue = $('#csrfParameter').attr('value');
    param[csrfName] = csrfValue;
    return param;
};