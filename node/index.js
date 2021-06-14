'use strict';

var apiClient = require('./lib/api/topClient.js').TopClient;
var dingtalkClient = require('./lib/api/dingtalkClient.js').DingTalkClient;
var tmcClient = require('./lib/tmc/tmcClient.js').TmcClient;

var client = new apiClient({
  appkey: '',
  appsecret: '',

  url: 'https://eco.taobao.com/router/rest'
});

var Idlist = [
  {
    name: '聚划算满减',
    id: 32366,
    msg: '聚划算内的有满减或满折类的商品库获取'
  },
  {
    name: '聚划算单品爆款(开团热卖中)',
    id: 31371,
    msg: '精选聚划算适合淘宝客推广单品爆款，包含单品团爆款'
  },
  {
    name: '聚划算单品爆款(预热)',
    id: 31370,
    msg: '精选聚划算适合淘宝客推广单品爆款，包含单品团爆款'
  },
  {
    name: '猫超减满折',
    id: 27160,
    msg: '天猫超市内的有满减或满折类的商品库获取。'
  },
  {
    name: '猫超1元购凑单',
    id: 27162,
    msg: '精选天猫超市适合淘宝客推广单品爆款。'
  },
  {
    name: '猫超第二件0元',
    id: 27161,
    msg: '精选天猫超市适合淘宝客推广单品爆款。'
  },
  {
    name: '①国际直营双11清单',
    id: 37088,
    msg: '天猫国际直营双11报矿清单    '
  },
  {
    name: '②国际直营正品保障',
    id: 30015,
    msg: '天猫国际直营内有N元选N件产品，或者2件5折、2件8折的商品库获取'
  },
  {
    name: '③天猫国际直营爆款(99元选10件)',
    id: 30014,
    msg: '：精选天猫国际直营正品，适合淘客推广的单品爆款，更多9.9元低价单品'
  },
  {
    name: '③国际直营正品保障(99元选3件)',
    id: 30013,
    msg: '天猫国际直营内有N元选N件产品，或者2件5折、2件8折的商品库获取'
  },
  {
    name: '天天特卖相关',
    id: 31362,
    msg: '低价好货，工厂产业带爆款。'
  },
  {
    name: '有好货相关',
    id: 4092,
    msg: '商品本身是受欢迎的品质好货，淘宝有好货的产品心智'
  },
  {
    name: '好券直播',
    id: 3756,
    msg: '数据源同联盟app的好券直播。小时计更新，展示联盟高佣优质商品库中的领券热门商品。'
  },
  {
    name: '实时热销榜',
    id: 28026,
    msg: ' 淘宝客渠道每日实时热销爆款，官方数据实时更新。'
  },
  {
    name: '本地化生活(外卖红包)',
    id: 28026,
    msg: ' 淘宝客渠道每日实时热销爆款，官方数据实时更新。'
  },
  {
    name: '大额券',
    id: 27446,
    msg: ' 大面额折扣超高佣金，每单赚更多'
  }
];
module.exports = {
  ApiClient: client,
  TmcClient: tmcClient,
  DingTalkClient: dingtalkClient,
  Idlist: Idlist
};
