angular.module 'calculadorita'
  .controller 'StoresController', ($scope, $firebaseArray,$state, $cookies) ->

    phoneParser = (str) ->
      reg = new RegExp(/^\d{3}-\d{3}-\d{4}$/)

    ref = new Firebase("https://calculadoritaa.firebaseio.com/stores/")
    $scope.stores = $firebaseArray(ref)
    $scope.agregar = (store) ->
      $scope.store = ''
      $scope.stores.$add(store).then (data) ->
        $cookies.put('store_id', data.key())
        $state.go('signup')
        return
