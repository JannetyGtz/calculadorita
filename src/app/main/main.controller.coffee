angular.module 'calculadorita'
  .controller 'MainController', ($timeout, $scope, $firebaseArray) ->
    calcDate = () ->
      date = new Date()
      day = date.getDate()
      month = date.getMonth()+1
      year = date.getFullYear()
      return "#{year}#{month}#{day}"

    ventaParser = (str) ->
      reg = new RegExp(/(^\s*([-+]?)(\d+)(?:\s*([-+​*\/])\s*((?:\s[-+])?\d+)\s*​)+$)|(^\d+$)/)

    ref = new Firebase("https://calculadoritaa.firebaseio.com/ventas/1/#{calcDate()}")
    $scope.ventas = $firebaseArray(ref)

    $scope.total = 0

    $scope.updateTotal = () ->
      if ventaParser($scope.venta)
        $scope.total = eval($scope.venta)

    $scope.calcula = () ->
      if ventaParser($scope.venta)
        venta = $scope.venta
        total = eval(venta)
        console.log total
        $scope.ventas.$add
          venta: venta
          total: total

      $scope.venta = ''

      calcDate()
      return

    $(document).ready ->
      date = new Date
      day = date.getDate()
      month = date.getMonth() + 1
      year = date.getFullYear()
      if month < 10
        month = '0' + month
      if day < 10
        day = '0' + day
      today = year + '-' + month + '-' + day
      $('#desde').attr 'value', today
      $('#hasta').attr 'value', today