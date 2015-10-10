angular.module 'calculadorita'
  .controller 'LoginController', ($timeout, $scope, $firebaseArray) ->
    ref = new Firebase('https://calculadorita.firebaseio.com')
    ref.authWithPassword {
      email: 'bobtony@firebase.com'
      password: 'correcthorsebatterystaple'
    }, (error, authData) ->
      if error
        console.log 'Login Failed!', error
      else
        console.log 'Authenticated successfully with payload:', authData
      return