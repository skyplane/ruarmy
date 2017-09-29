/**
 * Created by skyplane on 20.09.17.
 */

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


function initAddressData($scope){

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


    $scope.editAddressData = function (){
        $('#addressDataShow').toggle();
        $('#addressDataEdit').toggle();
    };

    $scope.saveAndLoadAddressData = function (){

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
