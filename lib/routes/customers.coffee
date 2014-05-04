'use strict'

customers = require '../controllers/api/customers'

module.exports = (app) ->
  app.route('/api/customers/roles')
    .get(customers.roles)
  app.route('/api/customers/partners')
    .get(customers.partners)

