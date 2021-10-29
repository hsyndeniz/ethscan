const axios = require('axios');
const express = require('express');
const router = express.Router();

/* GET home page. */
router.get('/', function(req, res, next) {
  const start_block = 0;
  const end_block = 99999999;
  axios.get(`https://api.etherscan.io/api?module=account&action=txlist&address=${process.env.ADDRESS}&startblock=${start_block}&endblock=${end_block}&page=1&offset=10&sort=asc&apikey=${process.env.API_KEY}`)
  .then(function (response) {
    console.log(response.data.result);
    // write an insert query to insert multiple tx'!
    res.send(response.data.result);
  })
  .catch(function (error) {
    // handle error
    console.log(error);
    res.send(error);
  });
});

module.exports = router;
