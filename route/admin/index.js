const express = require('express');
const common = require('../../libs/common');

module.exports = () => {
  let router = express.Router();
  //检查登录状态
  router.use((req, res, next) => {
    if (!req.session['admin_id'] && req.url != '/login') {
      res.redirect('/admin/login');
    } else {
      next();
    }
  });

  router.get('/', (req, res) => {
    res.render('admin/index.ejs', {});
  });

router.use('/login', require('./login')());
router.use('/banners', require('./banners')());

  return router;
};
