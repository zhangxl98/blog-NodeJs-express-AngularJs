const express = require('express');

module.exports = () => {
  let router = express.Router();

  router.get('/1.html', (req, res) => {
    res.send('Hello World!').end();
  });
  return router;
};
