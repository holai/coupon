var express = require('express');
var router = express.Router();

var Idlist = require('../../index.js').Idlist;

/* GET users listing. */
router.get('/', function (req, res, next) {
  res.send(Idlist);
});

module.exports = router;
