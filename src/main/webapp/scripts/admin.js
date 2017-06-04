var datatablesUsersColumns = [
    {data: "id"},
    {data: "login"},
    {data: "password"},
    {data: "role"}
];

var datatablesProfilesColumns = [
    {data: "id"},
    {data: "profileName"}
];

var datatablesDivisionsColumns = [
    {data: "id"},
    {data: "name"}
];


var loadUsersTableOnce = false;
var loadProfilesTableOnce = false;
var loadDivisionsTableOnce = false;


function loadDivisionsTable($scope) {
    $.post(
        "../api/division/loadDivisions",
        $scope.csrfData()
        , function (json) {
            $scope.options.divisions = json.data;
            $('#divisionsTable').DataTable({
                destroy: true,
                language: datatablesLanguage,
                columns: datatablesDivisionsColumns,
                data: json.data,
                order: [1, 'desc'],
                "fnInitComplete": function (oSettings) {
                    if (loadDivisionsTableOnce == false) {
                        loadDivisionsTableOnce = true;
                        $('#divisionsTable tbody').on('click', 'tr', function () {
                            var tr = this;
                            if ($(tr).hasClass('selected')) {
                                $(tr).removeClass('selected');
                                $('.editDivision').fadeOut();
                            } else {
                                $('#divisionsTable').DataTable().$('tr.selected').removeClass('selected');
                                $(tr).addClass('selected');
                                $('.editDivision').fadeIn();

                                $scope.$apply(function () {
                                    $scope.division.id = $($(tr).find('td')[0]).text();
                                    $scope.division.name = $($(tr).find('td')[1]).text();
                                });

                            }
                        });
                    }
                }
            });
        },
        "json"
    );
}


function loadUsersTable($scope) {
    $.post(
        "../api/user/loadUsers",
        $scope.csrfData()
        , function (json) {
            $('#usersTable').DataTable({
                destroy: true,
                language: datatablesLanguage,
                columns: datatablesUsersColumns,
                data: json.data,
                order: [1, 'desc'],
                "fnInitComplete": function (oSettings) {
                    if (loadUsersTableOnce == false) {
                        loadUsersTableOnce = true;
                        $('#usersTable tbody').on('click', 'tr', function () {
                            var tr = this;
                            if ($(tr).hasClass('selected')) {
                                $(tr).removeClass('selected');
                                $('.editUser').fadeOut();
                            } else {
                                $('#usersTable').DataTable().$('tr.selected').removeClass('selected');
                                $(tr).addClass('selected');
                                $('.editUser').fadeIn();

                                $.get(
                                    "../api/user/loadUserById?id=" + $($(tr).find('td')[0]).text()
                                    , function (json) {
                                        $scope.$apply(function () {
                                            $scope.user = json;

                                            $scope.userProfile = json.profile.id;
                                            $scope.tmp.divisions = json.divisions;

                                            $scope.user.password1 = $scope.user.password;

                                            $.each($('.roleOption'), function () {
                                                $(this).removeAttr('selected');
                                            });

                                            $.each($scope.roles, function () {
                                                var role = this;
                                                if ($scope.user.role == role['value']) {
                                                    $scope.user.role = role['key'];
                                                    $.each($('.roleOption'), function () {
                                                        if ($(this).val() == role['key']) {
                                                            $(this).attr('selected', '');
                                                        }
                                                    });
                                                }
                                            });

                                        });
                                    },
                                    "json"
                                );

                            }
                        });
                    }
                }
            });
        },
        "json"
    );
}


function loadProfilesTable($scope) {
    $.post(
        "../api/profile/loadProfiles",
        $scope.csrfData()
        , function (json) {
            $scope.options.profiles = json.data;
            $scope.userProfile = $scope.options.profiles[0].id;
            $('#profilesTable').DataTable({
                destroy: true,
                language: datatablesLanguage,
                columns: datatablesProfilesColumns,
                data: json.data,
                order: [1, 'desc'],
                "fnInitComplete": function (oSettings) {
                    if (loadProfilesTableOnce == false) {
                        loadProfilesTableOnce = true;
                        $('#profilesTable tbody').on('click', 'tr', function () {
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
                        });
                    }
                }
            });
        },
        "json"
    );
}


var app = angular.module('usersApp', ["checklist-model"]);
app.controller('usersCtrl', function ($scope) {

    $scope.options = {};
    $scope.user = {};
    $scope.profile = {};
    $scope.options.profiles = [];
    $scope.division = {};
    $scope.options.divisions = [];
    $scope.divisions = [];
    $scope.roles = [];

    $scope.userProfile=0;


    $scope.clearDivisionData = function () {
        $scope.division.id = '';
        $scope.division.name = '';
    };


    $scope.clearUserData = function () {
        $scope.user.id = '';
        $scope.user.login = '';
        $scope.user.password = '';
        $scope.user.password1 = '';
        $scope.user.role = '';
    };

    $scope.clearProfileData = function () {
        $scope.profile.id = '';
        $scope.profile.profileName = '';
        $scope.profile.faculty = 'DENIED';
        $scope.profile.specialty = 'DENIED';
        $scope.profile.yearOfAdmission = 'DENIED';
        $scope.profile.militaryRank = 'DENIED';
        $scope.profile.surname = 'DENIED';
        $scope.profile.name = 'DENIED';
        $scope.profile.patronymic = 'DENIED';
        $scope.profile.dateOfBirth = 'DENIED';
        $scope.profile.passportNumber = 'DENIED';
        $scope.profile.militaryIdNumber = 'DENIED';
        $scope.profile.nationality = 'DENIED';
        $scope.profile.religion = 'DENIED';
        $scope.profile.phone = 'DENIED';
        $scope.profile.unit = 'DENIED';
        $scope.profile.post = 'DENIED';
        $scope.profile.education = 'DENIED';
        $scope.profile.skills = 'DENIED';
        $scope.profile.drivingLicense = 'DENIED';
        $scope.profile.compositionOfFamily = 'DENIED';
        $scope.profile.concussionsWereNot = 'DENIED';
        $scope.profile.traumaticBrainInjuryWasNot = 'DENIED';
        $scope.profile.theNarcologWasNot = 'DENIED';
        $scope.profile.thePsychiatristWasNot = 'DENIED';
        $scope.profile.alcohol = 'DENIED';
        $scope.profile.drugUse = 'DENIED';
        $scope.profile.chronicDiseases = 'DENIED';
        $scope.profile.validityCategory = 'DENIED';
        $scope.profile.thoughtsOfSuicideDoesNotHave = 'DENIED';
        $scope.profile.suicideAttemptsDidNotCommit = 'DENIED';
        $scope.profile.administrativeOffenseDidNotCommit = 'DENIED';
        $scope.profile.policeRecordDoesNotHave = 'DENIED';
        $scope.profile.criminalLiabilityWasNotInvolved = 'DENIED';
        $scope.profile.scars = 'DENIED';
        $scope.profile.tattoo = 'DENIED';
        $scope.profile.abroad = 'DENIED';
        $scope.profile.relativesAndFriendsAbroad = 'DENIED';
        $scope.profile.addressData = 'DENIED';
    };

    $scope.divisionSubmit = function () {
        var params = $scope.withCsrfData($scope.division);
        $.post(
            "../api/division/saveDivision",
            params
            , function (json) {
                alert('Успешно');
                $scope.clearDivisionData();
                $('#divisionModal').modal('hide');
                loadDivisionsTable($scope);
            },
            "json"
        );
    };


    $scope.userSubmit = function () {
        var params = $scope.csrfData();
        params['user'] = $scope.user;
        params['divisions'] = $scope.tmp.divisions;
        params['profile'] = $scope.userProfile;
        $.post(
            "../api/user/saveUser",
            params
            , function (json) {
                alert('Успешно');
                $scope.clearUserData();
                $('#userModal').modal('hide');
                loadUsersTable($scope);
            },
            "json"
        );
    };

    $scope.profileSubmit = function () {
        var params = $scope.withCsrfData($scope.profile);
        $.post(
            "../api/profile/saveProfile",
            params
            , function (json) {
                alert('Успешно');
                $scope.clearProfileData();
                $('#profileModal').modal('hide');
                loadProfilesTable($scope);
            },
            "json"
        );
    };

    $scope.csrfData = function () {
        var csrfName = $('#csrfParameter').attr('name');
        var csrfValue = $('#csrfParameter').attr('value');
        var param = {};
        param[csrfName] = csrfValue;
        return param;
    };

    $scope.withCsrfData = function (param) {
        var csrfName = $('#csrfParameter').attr('name');
        var csrfValue = $('#csrfParameter').attr('value');
        param[csrfName] = csrfValue;
        return param;
    };

    $scope.init = function () {
        $.post(
            "../api/user/loadUserRoles",
            $scope.csrfData()
            , function (json) {
                $scope.roles = json.data;
            },
            "json"
        );
        $scope.clearUserData();
        $scope.clearProfileData();
        loadUsersTable($scope);
        loadProfilesTable($scope);
        loadDivisionsTable($scope);

        $scope.cadet.addressData.subjectOfActualAddressType=1;

    };


    $scope.tmp = {
        divisions: []
    };
    $scope.checkAll = function() {
        $scope.tmp.divisions = $scope.options.divisions.map(function(item) { return item.id; });
    };
    $scope.uncheckAll = function() {
        $scope.tmp.divisions = [];
    };
    $scope.checkFirst = function() {
        $scope.tmp.divisions.splice(0, $scope.tmp.divisions.length);
        $scope.tmp.divisions.push(1);
    };


});


var division;
var divisions;