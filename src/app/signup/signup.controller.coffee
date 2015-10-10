angular.module 'calculadorita'
  .controller 'SignupController', ($timeout, $scope, $firebaseArray) ->
    ref = new Firebase('https://calculadoritaa.firebaseio.com')
    ref.createUser {
      email: 'bobtony@firebase.com'
      password: 'correcthorsebatterystaple'
    }, (error, userData) ->
      if error
        console.log 'Error creating user:', error
      else
        console.log 'Successfully created user account with uid:', userData.uid
      return