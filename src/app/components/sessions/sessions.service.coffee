# app.service 'User', (localStorageService) ->
#   user = {}
#   {
#     create: (data) ->
#       user = data
#
#     get: () ->
#       return user
#
#     destroy: () ->
#       user = null
#       localStorageService.clearAll()
#
#     save: (key, data) ->
#       return localStorageService.set(key, data)
#
#     getKey: (key) ->
#       return localStorageService.get(key)
#
#     getToken: () ->
#       return localStorageService.get('token')
#
#     active: () ->
#       localStorageService.get('token') != null ? true : false
#   }
