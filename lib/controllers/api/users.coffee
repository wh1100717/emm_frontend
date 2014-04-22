'use strict'

mongoose = require 'mongoose'
passport = require 'passport'

User = mongoose.model 'User'

###
 * 创建用户
###
exports.create = (req, res, next) ->
  newUser = new User(req.body)
  newUser.provider = 'local'
  newUser.save (err) ->
    return res.json(400,err) if err
    req.logIn newUser, (err) ->
      return next(err) if err
      res.json req.user.userInfo

###
 * 获取用户资料
 * 如果制定用户id，则返回对应id资料，如果未指定返回当前用户资料
###
exports.show = (req, res, next) ->
  userId = req.params.id
  if userId
    User.findById userId, (err, user) ->
      return next(err) if err
      return res.send(404) if not user
      res.send {profile: user.profile}
  else
    res.send {profile: req.user.profile} || null

###
 * 更改密码
###
exports.changePassword = (req, res, next) ->
  userId = req.user._id
  oldPass = String(req.body.oldPassword)
  newPass = String(req.body.newPassword)

  User.findById userId, (err, user) ->
    if user.authenticate oldPass
      user.password = newPass
      user.save (err) ->
        return res.send(400) if err
        res.send 200
    else
      res.send 403

###
 * 获取当前用户
###
exports.me = (req, res) -> res.json req.user || null
