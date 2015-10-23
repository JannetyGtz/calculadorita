angular.module 'calculadorita'
  .factory routeTo = (route) ->
    window.location.href = '#/' + route
    return
