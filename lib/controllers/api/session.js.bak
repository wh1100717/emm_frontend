'use strict';

var mongoose = require('mongoose'),
    passport = require('passport');

/**
 * 登出
 * Passport exposes a logout() function on req (also aliased as logOut()) that can be called
 * from any route handler which needs to terminate a login session. 
 * Invoking logout() will remove the req.user property and clear the login session (if any).
 */
exports.logout = function (req, res) {
  req.logout();
  res.send(200);
};

/**
 * 登入
 * 更多信息查看 http://passportjs.org/guide/authenticate/ 中的Custom Callback章节
 */
exports.login = function (req, res, next) {
  passport.authenticate('local', function(err, user, info) {
    var error = err || info;
    if (error) return res.json(401, error);

    req.logIn(user, function(err) {
      
      if (err) return res.send(err);
      res.json(req.user.userInfo);
    });
  })(req, res, next);
};