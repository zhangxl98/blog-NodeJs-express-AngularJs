const crypot = require('crypto');

module.exports = {
  MD5_SUFFIX: 's54sgGDS*!dsdfg$e8sr*fg563fuKHJIOdfg82u)#456UG@hkhL',
  md5: (str) => {
    let obj = crypot.createHash('md5');
    obj.update(str);
    return obj.digest('hex');
  }
};
