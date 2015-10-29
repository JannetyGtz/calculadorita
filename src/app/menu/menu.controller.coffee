angular.module 'calculadorita'
  .controller 'MenuController', ($cookies, $scope, $state) ->
    $scope.deleteCookies = () ->
      $cookies.remove('store_id')
      $cookies.remove('user_id')
      $state.go('login')
