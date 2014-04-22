'use strict';

var api = require('./controllers/api'),
    index = require('./controllers'),
    users = require('./controllers/users'),
    session = require('./controllers/session'),
    middleware = require('./middleware');

/**
 * 应用路由配置
 */
module.exports = function(app) {

  // 服务端 API 路由
  app.route('/api/awesomeThings')
    .get(api.awesomeThings);
  
  app.route('/api/users')
    .post(users.create)
    .put(users.changePassword);
  app.route('/api/users/me')
    .get(users.me);
  app.route('/api/users/:id')
    .get(users.show);

  app.route('/api/session')
    .post(session.login)
    .delete(session.logout);

  // 所有未定义的api路由都应该返回404错误
  app.route('/api/*')
    .get(function(req, res) {
      res.send(404);
    });

  // 这里定义了非api && 非SPA部分的view层路由控制
  app.route('/partials/*')
    .get(index.partials);

  // 这里定义了SPA主页
  app.route('/*')
    .get( middleware.setUserCookie, index.index);
};