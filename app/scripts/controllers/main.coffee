'use strict'
app = angular.module('emmFrontendApp')

app.controller 'MainCtrl', ($scope, $rootScope, $http) ->
  # ace.settings.check 'main-container' , 'fixed'
  $http({
    method:'GET'
    url: '/api/config'
  }).success((data, status, headers, config) ->
    console.log data.menus[0]
    console.log data.menus[0].submenus
    $rootScope.config = data
  ).error((data, status, headers, config) ->
    alert '/api/config error'
  )
  return

app.controller 'NavbarCtrl', ($scope, $rootScope, $location, Auth) ->
  # ace.settings.check('navbar' , 'fixed')
  $scope.user = $rootScope.config.user
  $scope.company = $rootScope.config.company
  $scope.logout = -> Auth.logout().then -> $location.path('/login')
  return

app.controller 'CrumbCtrl', ($scope, $rootScope) ->
  # ace.settings.check 'breadcrumbs' , 'fixed'

  return

app.controller 'SidebarCtrl', ($scope, $rootScope) ->
  $scope.menus = $rootScope.config.menu
  return