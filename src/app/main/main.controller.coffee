angular.module 'calculadorita'
  .controller 'MainController', ($timeout, $scope, $firebaseArray) ->
    calcDate = () ->
      date = new Date()
      day = date.getDate()
      month = date.getMonth()+1
      year = date.getFullYear()
      return "#{year}#{month}#{day}"

    ventaParser = () ->
      reg = /\d+[+\/*-]*/g
      result = reg.test("#{$scope.venta}")
      console.log result
      return result

    ref = new Firebase("https://calculadoritaa.firebaseio.com/ventas/1/#{calcDate()}")
    $scope.ventas = $firebaseArray(ref)

    $scope.total = 0

    $scope.updateTotal = () ->
      if ventaParser()
        $scope.total = eval($scope.venta)
      else
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
