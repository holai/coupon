var express = require('express');
var router = express.Router();

var client = require('../../index.js').ApiClient;

/* GET users listing. */
router.use('/', function (req, res, next) {
  var page = req.query.page;
  var q = req.query.q; //查询词

  console.log(q);

  client.executeWithHeader(
    'taobao.tbk.dg.material.optional',
    {
      adzone_id: 111359550006,
      material_id: 17004, //不传时默认物料id=2836；如果直接对消费者投放，可使用官方个性化算法优化的搜索物料id=17004
      page_no: page,
      page_size: 10,
      q
    },
    {},
    function (error, response) {
      if (!error) {
        console.log(response);
        res.send(response);
      } else {
        console.error(error);

        res.send(response);
      }
    }
  );
});

module.exports = router;
