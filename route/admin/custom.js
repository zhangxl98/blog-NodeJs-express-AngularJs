const express = require('express');
const common = require('../../libs/common');
const mysql = require('mysql');

let db = mysql.createPool({host: 'localhost', user: 'root', password: '123456', database: 'learner'});

const pathLib = require('path');
const fs = require('fs');

module.exports = () => {
  let router = express.Router();

  router.get('/', (req, res) => {
    switch (req.query.act) {
      case 'del':
        db.query(`SELECT * FROM custom_evaluation_table WHERE ID=${req.query.id}`, (err, data) => {
          if (err) {
            console.error(err);
            res.status(500).send('database error').end();
          } else {
            if (data.length == 0) {
              res.status(404).send('no this custom evaluation').end();
            } else {
              fs.unlink('static/upload/' + data[0].src, (err) => {
                if (err) {
                  console.error(err);
                  res.status(500).send('file opration error').end();
                } else {
                  db.query(`DELETE FROM custom_evaluation_table WHERE ID=${req.query.id}`, (err, data) => {
                    if (err) {
                      console.error(err);
                      res.status(500).send('database error').end();
                    } else {
                      res.redirect('/admin/custom');
                    }
                  });
                }
              });
            }
          }
        });
        break;
      case 'mod':
          db.query(`SELECT * FROM custom_evaluation_table WHERE id=${req.query.id}`, (err, data) => {
            if (err) {
              console.error(err);
              res.status(500).send('database error').end();
            } else {
              if (data.length == 0) {
                res.status(404).send('no this evaluation').end();
              } else {
                db.query('SELECT * FROM custom_evaluation_table', (err, evaluations) => {
                  if (err) {
                    console.error(err);
                    res.status(500).send('database error').end()
                  } else {
                    res.render('admin/custom.ejs', {evaluations, mod_data: data[0]});
                  }
                });
              }
            }
          });
        break;
      default:
        db.query('SELECT * FROM custom_evaluation_table', (err, evaluations) => {
          if (err) {
            console.error(err);
            res.status(500).send('database error').end()
          } else {
            res.render('admin/custom.ejs', {evaluations});
          }
        });
        break;
    }
  });
  router.post('/', (req, res) => {
    let title = req.body.title;
    let description = req.body.description;

    if (req.files[0]) {
      let ext = pathLib.parse(req.files[0].originalname).ext;
      var oldPath = req.files[0].path;
      var newPath = req.files[0].path + ext;
      var newFileName = req.files[0].filename + ext;
      console.log(newFileName);
    } else {
      var newFileName = null;
    }


    if (newFileName) {        //有图片上传
      fs.rename(oldPath, newPath, (err) => {
        if (err) {
          console.error(err);
          res.status(500).send('file opration error').end()
        } else {
          if (req.body.mod_id) {    //编辑数据
            db.query(`SELECT * FROM custom_evaluation_table WHERE ID=${req.body.mod_id}`, (err, data) => {
              if (err) {
                console.error(err);
                res.status(500).send('database error').end();
              } else if (data.length == 0){
                res.status(404).send('old file not found').end();
              } else {
                //先删除图片
                fs.unlink('static/upload/' + data[0].src, (err) => {
                  if (err) {
                    console.error(err);
                    res.status(500).send('file opration error').end();
                  } else {
                    //再更新数据
                    db.query(`UPDATE custom_evaluation_table SET \
                      title='${title}', description='${description}', \
                      src='${newFileName}' \
                      WHERE ID=${req.body.mod_id}`, (err) => {
                      if (err) {
                        console.error(err);
                        res.status(500).send('database error').end();
                      } else {
                        res.redirect('/admin/custom');
                      }
                    });
                  }
                });
              }
            });
          } else {                 //添加数据
            db.query(`INSERT INTO custom_evaluation_table (title, description, src) VALUES('${title}', '${description}', '${newFileName}')`, (err, data) => {
              if (err) {
                console.error(err);
                res.status(500).send('database error').end();
              } else {
                res.redirect('/admin/custom')
              }
            });
          }
        }
      });
    } else {                  //没有图片上传
      if (req.body.mod_id) {
        db.query(`UPDATE custom_evaluation_table SET title='${title}', description='${description}' WHERE ID=${req.body.mod_id}`, (err) => {
          if (err) {
            console.error(err);
            res.status(500).send('database error').end();
          } else {
            res.redirect('/admin/custom');
          }
        });
      } else {
        // db.query(`INSERT INTO custom_evaluation_table (title, description, src) VALUES('${title}', '${description}', '${newFileName}')`, (err, data) => {
        //   if (err) {
        //     console.error(err);
        //     res.status(500).send('database error').end();
        //   } else {
        //     res.redirect('/admin/custom')
        //   }
        // });
      }
    }
  });

  return router;
};
