// Generated by CoffeeScript 1.7.1
'use strict';
var app;

app = angular.module('emmFrontendApp');

app.controller('MainCtrl', function($scope, $rootScope, $http) {});

app.controller('NavbarCtrl', function($scope, $rootScope, $location, Auth) {
  $scope.logout = function() {
    return Auth.logout().then(function() {
      return $location.path('/login');
    });
  };
});

app.controller('CrumbCtrl', function($scope, $rootScope, $location) {
  $scope.crumb = function(url) {
    var config, menu, submenu, _i, _j, _len, _len1, _ref, _ref1;
    config = $rootScope.config;
    if (config === void 0) {
      return "";
    }
    _ref = config.menus;
    for (_i = 0, _len = _ref.length; _i < _len; _i++) {
      menu = _ref[_i];
      if (menu.href === url) {
        return menu.name;
      }
      if (menu.submenus) {
        _ref1 = menu.submenus;
        for (_j = 0, _len1 = _ref1.length; _j < _len1; _j++) {
          submenu = _ref1[_j];
          if (submenu.href === url) {
            return "" + menu.name + " -- " + submenu.name;
          }
        }
      }
    }
  };
});

app.controller('SidebarCtrl', function($scope, $rootScope) {
  $scope.menus = $rootScope.config.menu;
});
