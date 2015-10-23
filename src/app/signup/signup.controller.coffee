angular.module 'calculadorita'
  .controller 'SignupController', ($timeout, $scope, $firebaseArray, $state) ->
    $scope.signupData =
      username: 'netty'
      email: 'nett@gmail.com'
      password: 'carajo'
    $scope.doSign_up = () ->
      ref = new Firebase('https://calculadoritaa.firebaseio.com')
      ref.createUser {
        username: $scope.signupData.username
        email: $scope.signupData.email
        password : $scope.signupData.password
      }, (error, userData) ->
        if (error)
          console.log("Error creating user:", error)
        else
          $state.go('home')
          console.log("Successfully created user account with uid:", userData.uid)
        return
      $scope.signupData = ''
