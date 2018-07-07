const express = require('express');

module.exports = () => {
  let router = express.Router();

  router.get('/web', (req, res) => {
    res.render('', {});
  });

  return router;
};
