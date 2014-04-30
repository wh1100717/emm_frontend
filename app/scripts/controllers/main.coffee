'use strict'
app.controller 'MainCtrl', ($scope, $rootScope, $http) ->
  return

app.controller 'NavbarCtrl', ($scope, $rootScope, $location, Auth) ->
  $scope.logout = -> Auth.logout().then -> $location.path('/login')
  return

app.controller 'CrumbCtrl', ($scope, $rootScope, $location) ->
  $scope.crumb = (url) ->
    config = $rootScope.config
    return "" if config is undefined
    for menu in config.menus
      return menu.name if menu.href is url
      if menu.submenus
        for submenu in menu.submenus
          return "#{menu.name} -- #{submenu.name}" if submenu.href is url
  return

app.controller 'SidebarCtrl', ($scope, $rootScope) ->
  $scope.menus = $rootScope.config.menu
  return