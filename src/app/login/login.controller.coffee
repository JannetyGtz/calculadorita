angular.module 'calculadorita'
  .controller 'LoginController', ($scope, $firebaseObject, $firebaseArray, $state, $cookies) ->
    $scope.loginData =
      email: 'lolo@live.com'
      password: '123'
    $scope.doLogin = ->
      #console.log('Doing login', $scope.loginData)
      ref = new Firebase('https://calculadoritaa.firebaseio.com')
      ref.authWithPassword {
        email: $scope.loginData.email
        password: $scope.loginData.password
      }, (error, authData) ->
        if error
          alert 'no existes cabron!!'
          console.log('Login Failed', error)
        else
          $cookies.put('user_id', authData.id)
          user = $firebaseObject(ref.child("users/#{authData.uid}"))
          user.$loaded().then () ->
            $cookies.put('store_id', user.store_id)
            $state.go('main')
          #console.log $cookies.get('store_id')
        return
