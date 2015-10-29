angular.module 'calculadorita'
  .controller 'SignupController', ($cookies, $scope, $firebaseArray, $state) ->
    $scope.signupData =
      username: 'Angel'
      email: 'boto@gmail.com'
      password: 'grosero'
      cellphone: '614-456-8956'

    $scope.has_user = false
    $scope.signup = (signupData) ->
      $scope.has_user = true
      ref = new Firebase('https://calculadoritaa.firebaseio.com')
      ref.createUser {
        email: signupData.email
        password: signupData.password

      }, (error, userData) =>
        if (error)
          alert 'el usuario ya se encuentra registrado'
        else
          users = ref.child("users/#{userData.uid}")
          users.set({
            username: signupData.username
            email: signupData.email
            store_id: $cookies.get('store_id')
            cellphone: signupData.cellphone
          })
          console.log("Successfully created user account with uid:", userData.uid)
        return
      $scope.signupData = ''
