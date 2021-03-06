require.config({
    baseUrl : "./",
    paths : {
        "angular" : "lib/angular",
        "app" : "js/app"
    },
    shim : {
        "angular":{exports:"angular"},
    }
})
//非ADM规范的js则要使用shim

require(["app"], function(app) {
    app.controller("TextController", function($scope) {
        $scope.greeting = "sixther";
        $scope.startingValue = 1;
        computeNeeded = function () {
            $scope.needed = $scope.startingValue * 10
        };
        $scope.$watch('startingValue', computeNeeded);
    })
});