'use strict'
app = angular.module('emmFrontendApp')
app.controller 'NavbarCtrl', ($scope, $location, Auth) ->
  $scope.menu = [{
      title: 'Home'
      link: '/'
    }]
  if Auth.isLoggedIn()
    $scope.menu.push {
      title: 'Settings'
      link: '/settings'
    }
  $scope.logout = -> Auth.logout().then -> $location.path('/login')
  $scope.isActive = (route) -> route is $location.path()