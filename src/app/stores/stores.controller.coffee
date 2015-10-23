angular.module 'calculadorita'
  .controller 'StoresController', ($timeout, $scope, $firebaseArray) ->

    phoneParser = (str) ->
      reg = new RegExp(/^\d{3}-\d{3}-\d{4}$/)

    ref = new Firebase("https://calculadoritaa.firebaseio.com/stores")
    $scope.stores = $firebaseArray(ref)

    $scope.agregar = () ->
      if phoneParser($scope.phone)
        $scope.stores.$add $scope.store

      console.log $scope.store
      $scope.store = ''
