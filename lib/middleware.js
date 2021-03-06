// Generated by CoffeeScript 1.7.1
'use strict';

/*
 * 用于应用的自定义中间件
 */
module.exports = {

  /*
   *  可以用于做API的访问权限验证
   */
  auth: function(req, res, next) {
    if (req.isAuthenticated()) {
      return next();
    }
    return res.send(401);
  },

  /*
   * Set a cookie for angular so it knows we have an http session
   */
  setUserCookie: function(req, res, next) {
    if (req.user) {
      res.cookie('user', JSON.stringify(req.user.userInfo));
    }
    return next();
  }
};
