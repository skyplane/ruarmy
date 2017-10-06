
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

function initAddressData($scope) {

    $scope.options.addressData = {};

    $scope.options.addressData.cityTypes = [
        {'name': 'город', 'value': '1'}, {'name': 'ПГТ', 'value': '2'}, {'name': 'поселок', 'value': '3'},
        {'name': 'село', 'value': '4'}, {'name': 'деревня', 'value': '5'}, {'name': 'станица', 'value': '6'},
        {'name': 'хутор', 'value': '7'}
    ];

    $scope.options.addressData.streetTypes = [
        {'name': 'улица', 'value': '1'}, {'name': 'переулок', 'value': '2'}, {'name': 'проспект', 'value': '3'},
        {'name': 'микрорайон', 'value': '4'}, {'name': 'шоссе', 'value': '5'}, {'name': 'площадь', 'value': '6'},
        {'name': 'бульвар', 'value': '7'}, {'name': 'проезд', 'value': '8'}, {'name': 'в\\ч', 'value': '9'}
    ];

    $scope.editAddressData = function () {
        $('#addressDataShow').toggle();
        $('#addressDataEdit').toggle();
    };

    $scope.updateActualAddressByRegistered = function () {
        $scope.cadet.addressData.actualData.subjectOfActualAddressType = $scope.cadet.addressData.registeredData.subjectOfRegisteredAddressType;
        $scope.cadet.addressData.actualData.subjectOfActualAddress = $('#subjectOfRegisteredAddress').val();
        $scope.cadet.addressData.actualData.cityOfActualAddressType = $scope.cadet.addressData.registeredData.cityOfRegisteredAddressType;
        $scope.cadet.addressData.actualData.cityOfActualAddress = $('#cityOfRegisteredAddress').val();
        $scope.cadet.addressData.actualData.streetOfActualAddressType = $scope.cadet.addressData.registeredData.streetOfRegisteredAddressType;
        $scope.cadet.addressData.actualData.streetOfActualAddress = $scope.cadet.addressData.registeredData.streetOfRegisteredAddress;
        $scope.cadet.addressData.actualData.houseOfActualAddress = $scope.cadet.addressData.registeredData.houseOfRegisteredAddress;
        $scope.cadet.addressData.actualData.buildingOfActualAddress = $scope.cadet.addressData.registeredData.buildingOfRegisteredAddress;
        $scope.cadet.addressData.actualData.apartmentOfActualAddress = $scope.cadet.addressData.registeredData.apartmentOfRegisteredAddress;
        $scope.cadet.addressData.actualData.indexOfActualAddress = $scope.cadet.addressData.registeredData.indexOfRegisteredAddress;
    };

    $scope.saveAndLoadAddressData = function () {

        var addressData = jQuery.extend(true, {}, $scope.cadet.addressData);

        addressData.id = $scope.cadet.id;
        $.post(
            "../api/cadet/saveAndLoadAddressData",
            withCsrfData(addressData)
            , function (data) {
                if (data.success == 0) {
                    $scope.$apply(function () {
                        $scope.cadet.addressData = data.addressData;
                        $('#addressDataShow').toggle();
                        $('#addressDataEdit').toggle();
                    });
                    alert("Обновлено");
                }
            },
            "json"
        );

    }

}
