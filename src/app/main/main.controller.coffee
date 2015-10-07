angular.module 'calculadorita'
  .controller 'MainController', ($timeout, $scope, $firebaseArray) ->
    calcDate = () ->
      date = new Date()
      day = date.getDate()
      month = date.getMonth()+1
      year = date.getFullYear()
      return "#{year}#{month}#{day}"

    ventaParser = (str) ->
      reg = new RegExp(/^((\d*)[\+\-\/])*(\d*)$/)
      return reg.test(str)

    ref = new Firebase("https://calculadoritaa.firebaseio.com/ventas/1/#{calcDate()}")
    $scope.ventas = $firebaseArray(ref)

    $scope.total = 0

    $scope.updateTotal = () ->
      console.log ventaParser($scope.venta)
      if ventaParser($scope.venta)
        $scope.total = eval($scope.venta)
      else
        console.log 'aca no toy'
        $scope.total = 'chupalo!!'

    $scope.calcula = () ->
      
      if ventaParser()
        venta = $scope.venta
        total = eval(venta)

        $scope.ventas.$add
          venta: venta
          total: total

      $scope.venta = ''
    
    

    calcDate()
    return
