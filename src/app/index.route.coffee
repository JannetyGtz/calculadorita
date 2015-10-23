angular.module 'calculadorita'
  .config ($stateProvider, $urlRouterProvider) ->
    'ngInject'
    $stateProvider
      .state 'home',
        url: '/'
        templateUrl: 'app/main/main.html'
        controller: 'MainController'
        controllerAs: 'main'
      .state 'login',
        url: '/login'
        templateUrl: 'app/login/login.html'
        controller: 'LoginController'
        controllerAs: 'login'
      .state 'signup',
        url: '/signup'
        templateUrl: 'app/signup/signup.html'
        controller: 'SignupController'
        controllerAs: 'signup'
      .state 'store',
        url: '/new_store'
        templateUrl: 'app/stores/stores.html'
        controller: 'StoresController'
        controllerAs: 'store_new'

    $urlRouterProvider.otherwise '/'
