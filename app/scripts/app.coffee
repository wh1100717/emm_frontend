'use strict'

app = angular.module 'emmFrontendApp', ['ngCookies','ngResource','ngSanitize','ngRoute']

###
 * $routProvider: 用于配置route路由
 * $locationProvider: 用于配置angularJS中的deep link路径的存储格式。 包含hashPrefix和html5Mode属性
 * $$httpProvider: 用于进行$http的配置
###
app.config ($routeProvider, $locationProvider ,$httpProvider) ->
  $routeProvider
    .when('/',{
      templateUrl: 'partials/main'
      controller: 'MainCtrl',
      authenticate: true
      })
    .when('/login',{
      templateUrl: 'partials/login'
      controller: 'LoginCtrl'
      })
    .when('/signup',{
      templateUrl: 'partials/signup'
      controller: 'SignupCtrl'
      })
    .when('/settings',{
      templateUrl: 'partials/settings'
      controller: 'SettingsCtrl'
      authenticate: true
      })
    .when('/role',{
      templateUrl: 'partials/role'
      controller: 'SettingsCtrl'
      authenticate: true
      })
    .otherwise({
      redirectTo: '/'
      })
  $locationProvider.html5Mode true

  ###
   * 当server端返回401错误的时候重定向到/login登陆页面
  ###
  $httpProvider.interceptors.push ['$q','$location', ($q, $location) ->
    {
      responseError: (response) ->
        $location.path '/login' if response.status is 401
        $q.reject(response)
    }
  ]

app.run ($rootScope, $location, $http, Auth) ->
  if Auth.isLoggedIn()
    $http({
      method:'GET'
      url: '/api/config'
    }).success((data, status, headers, config) ->
      $rootScope.config = data
    ).error((data, status, headers, config) ->
      alert '/api/config error'
    )
  else
    $rootScope.config = {
      user:{}
      company:{}
      menus:{}
    }

  ###
   * 监听route地址的变化，如果route地址需要权限验证，而又未登录，则跳转至login登陆页面
  ###
  $rootScope.$on '$routeChangeStart', (event, next) ->
    url = $location.url()
    url = url.substr(0,url.indexOf('?')) if url.indexOf('?') > -1

    $location.path('/') if Auth.isLoggedIn() and url is '/login'
    $location.path('/') if Auth.isLoggedIn() and url is '/signup'
    $location.path('/login') if next.authenticate and not Auth.isLoggedIn()
    $rootScope.url = url
    if Auth.isLoggedIn() and not $rootScope.config.user.name
      console.log 123
      $http({
        method:'GET'
        url: '/api/config'
      }).success((data, status, headers, config) ->
        $rootScope.config = data
      ).error((data, status, headers, config) ->
        alert '/api/config error'
      )      
    if not Auth.isLoggedIn()
      $rootScope.config = {
        user:{}
        company:{}
        menus:{}
      }
    return

# ###
#  * KISSY初始化
# ###
# KISSY.ready (S) ->
#   console.log 'Kissy Initialization'
#   KISSY.config 'combine',false

# ###
#  * 上传文件插件示例
# ###
# KISSY.use """
#   gallery/uploader/1.5/index,
#   gallery/uploader/1.5/themes/default/index,
#   gallery/uploader/1.5/themes/default/style.css
#   """, (S, Uploader, DefaultTheme) ->
#   KISSY.use """
#     gallery/uploader/1.5/plugins/auth/auth,
#     gallery/uploader/1.5/plugins/urlsInput/urlsInput,
#     gallery/uploader/1.5/plugins/proBars/proBars  
#     """, (S, Auth, UrlsInput, ProBars) ->
#     uploader = new Uploader '#J_UploaderBtn', {action: '/file/upload'}
#     uploader.theme(new DefaultTheme {queueTarget: '#J_UploaderQueue'})
#     uploader.plug(new Auth {max:3,maxSize:10240}).plug(new UrlsInput {target: '#J_Urls'}).plug(new ProBars())





