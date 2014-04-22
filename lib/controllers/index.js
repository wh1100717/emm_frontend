'use strict';

var path = require('path');

/**
 * 如果view目录下面包含该html页面则返回该页面，如果不存在则返回404
 */
exports.partials = function(req, res) {
  var stripped = req.url.split('.')[0];
  var requestedView = path.join('./', stripped);
  res.render(requestedView, function(err, html) {
    if(err) {
      console.log("Error rendering partial '" + requestedView + "'\n", err);
      res.status(404);
      res.send(404);
    } else {
      res.send(html);
    }
  });
};

/**
 * 返回SPA主页
 */
exports.index = function(req, res) {
  res.render('index');
};
