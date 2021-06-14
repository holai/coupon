var express = require('express');
var router = express.Router();

var client = require('../../index.js').ApiClient;

/* GET users listing. */
router.use('/', function (req, res, next) {
  // 28026
  var page = req.query.page;
  var material_id = req.query.id;
  console.log(req.query);

  console.log(material_id, page);
  client.executeWithHeader(
    'taobao.tbk.dg.optimus.material',
    {
      adzone_id: 111359550006,
      material_id: material_id,
      page_no: page,
      page_size: 10
      // 'start_time':'2017-03-21 00:00:00',
      // 'end_time':'2017-03-23 23:59:59',
      // 'session':'70000100f25719047abee9303ca8ee5d2e84f19cdd4edfb48d5e917a3e9a4aca99aaf042153472040'
    },
    {},
    function (error, response) {
      if (!error) {
        console.log(response);
        res.send(response);
      } else console.log(error);
    }
  );
});

module.exports = router;
