'use strict';

angular.module('emmFrontendApp')
  .controller('MainCtrl', function ($scope, $http) {
    $http.get('/api/home/awesomeThings').success(function(awesomeThings) {
      $scope.awesomeThings = awesomeThings;
    });
  });
