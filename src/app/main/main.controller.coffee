angular.module 'calculadorita'
 .controller 'MainController', ($timeout, $scope, $firebaseArray, $cookies) ->
    calcDate = () ->
      date = new Date()
      day = date.getDate()
      month = date.getMonth()+1
      year = date.getFullYear()
      return "#{year}#{month}#{day}"

    ventaParser = (str) ->
      reg = new RegExp(/(^\s*([-+]?)(\d+)(?:\s*([-+​​*\/])\s*((?:\s[-+])?\d+)\s*​​)+$)|(^\d+$)/)

    store_id = $cookies.get('store_id')
    console.log store_id
    ref = new Firebase("https://calculadoritaa.firebaseio.com/ventas/#{store_id}/#{calcDate()}")
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

    $scope.fecha =  new Date()

    $scope.salesDate = () ->
      date = new Date($scope.fecha)
      fecha = date.getFullYear() + '' + (date.getMonth()+1) + '' + date.getDate()
      console.log fecha
      ref = new Firebase("https://calculadoritaa.firebaseio.com/ventas/#{store_id}/#{fecha}")
      $scope.ventas = $firebaseArray(ref)
