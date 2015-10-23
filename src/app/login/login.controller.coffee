angular.module 'calculadorita'
  .controller 'LoginController', ($timeout, $scope, $firebaseArray, $state) ->
    $scope.loginData =
      email: 'mari@live.com'
      password: 'mariana'
    $scope.doLogin = ->
      console.log('Doing login', $scope.loginData)
      ref = new Firebase('https://calculadoritaa.firebaseio.com')
      ref.authWithPassword {
        email: $scope.loginData.email
        password: $scope.loginData.password
      }, (error, authData) ->
        if error
          console.log('Login Failed', error)
        else
          $state.go('home')
          console.log("Authenticated successfully with payload:", authData)
        return
      $scope.loginData = ''
