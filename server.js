const express = require('express');
const static = require('express-static');
const bodyParser = require('body-parser');
const multer = require('multer');
const multerObj = multer({dest: './static/upload'});
const mysql = require('mysql');
const cookieParser = require('cookie-parser');
const cookieSession = require('cookie-session');
const consolidate = require('consolidate');
const expressRoute = require('express-route');

let server = express();
server.listen(8080);

//1.获取请求数据
//get 自带
server.use(multerObj.any());

//2.cookie、session
server.use(cookieParser());
(() => {
  let keys = [];
  for (var i = 0; i < 100000; i++) {
    keys[i] = 'a' + Math.random();
  }
  server.use(cookieSession({
    name: 'sess_id',
    keys,
    maxAge: 20*60*1000
  }));
})();

//3.模板
server.engine('html', consolidate.ejs);
server.set('views', 'template');
server.set('view engine', 'html');

//4.route
server.use('/article/', require('./route/1.js')());

//5.default:static
server.use(static('./static'));
