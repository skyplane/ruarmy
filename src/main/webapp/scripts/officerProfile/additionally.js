/**
 * Created by skyplane on 20.09.17.
 */



function initAdditionally($scope){


    $scope.editAdditionally = function (){
        $('#additionallyShow').toggle();
        $('#additionallyEdit').toggle();
    };

    $scope.saveAndLoadAdditionally = function (){

        var additionally = jQuery.extend(true, {}, $scope.cadet.additionally);

        additionally.id = $scope.cadet.id;
        $.post(
            "../api/cadet/saveAndLoadAdditionally",
            withCsrfData(additionally)
            , function (data) {
                if (data.success == 0) {
                    $scope.$apply(function () {
                        $scope.cadet.additionally = data.additionally;
                        $('#additionallyShow').toggle();
                        $('#additionallyEdit').toggle();
                    });
                    alert("Обновлено");
                }
            },
            "json"
        );


    }



}
